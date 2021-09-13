//
//  CreatePRCommand.swift
//  
//
//  Created by Mier on 13/09/2021.
//

import ArgumentParser
import Foundation

enum PRType: EnumerableFlag {
    case feature
    case fix
}

struct CreatePRCommand: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "gen-pr",
        abstract: "A Swift command-line tool to generate a pull request by taking the leverage of GITHUT CLI and git commit logs on current branch",
        discussion: """
            The intension of this command line tool is to automate some of the redundant manual processes. It will:\n
                    1. Get all the commit logs against the base branch\n
                    2. Generate full pr description according to git commit logs and given optional extra description.\n
                    3. Push the working branch to remote origin. At the moment, `gh pr create` will not push branch to the server https://github.com/cli/cli/issues/1718. Thus, we need to manually push the working branch to origin\n
                    4. Create pull request by using `gh pr create`\n
                    5. Optional, it will open the created pull request url on the default browser.\n
            To learn more please use `--help` or visit `https://github.com/Mieraidihaimu/GeneratePR`
            """
    )

    @Argument(help: "The pull request title")
    var title: String

    @Option(name: [.customLong("extra-description"), .customShort("e")], help: "The PR extra description for pull request. ")
    var extra: String?

    @Option(name: [.customLong("base-branch"), .customShort("b")], help: "The base branch which the pull requests will be open to, default is main")
    var baseBranch: String = "main"

    @Flag(help: "The PR type: is it a feature or bug fix PR?. Default value is feature PR.")
    var type: PRType = .feature

    @Argument(help: "Linked github issue path. For instance, in issue URL https://github.com/randomX/repoY/issues/1060, the `randomX/repoY/issues/1060` is the issue path")
    var issue: String

    @Argument(help: "The github product issue id")
    var issueId: String

    @Flag(name: [.customLong("verbose"), .customShort("v")], help: "Show logs, information and non blocking messages.")
    var verbose = false

    @Flag(name: [.customLong("open-URL"), .customShort("o")], help: "Open Pull request URL on default browser.")
    var openUrl = false

    func run() throws {
        Log.isEnabled = verbose

        let githubCommand = GithubCommand(baseBranch: baseBranch)

        // 1. Get all the commit logs against the base branch
        let outputCommitLogs = ShellScripRunner.runShell(command: githubCommand.allCommits)

        // 2. Generate full pr description
        let prDescription = CommandHelper.generateDescription(
            issue: issue, prType: type, commitLogs: outputCommitLogs, extra: extra ?? ""
        )

        // 3. Push the working branch to remote origin. At the moment, `gh pr create` will not push branch to the server https://github.com/cli/cli/issues/1718. Thus, we need to manually push the working branch to origin
        ShellScripRunner.runShell(command: githubCommand.pushToRemote)

        // 4. Create pull request by using `gh pr create`
        let createPRCommand = githubCommand.createPR(title: title, description: prDescription)
        let prURL = ShellScripRunner.runShell(command: createPRCommand)

        if openUrl {
            // 5. Optional, it will open the created pull request url on the default browser.
            ShellScripRunner.runShell(command: "open \(prURL)")
        }
        throw ExitCode.success
    }
}
