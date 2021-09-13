//
//  GithubCommand.swift
//  
//
//  Created by Mier on 13/09/2021.
//

import Foundation

struct GithubCommand {
    let baseBranch: String

    var allCommits: String {
        "git log --no-merges --pretty=%s --graph \(baseBranch).."
    }

    func createPR(title: String, description: String) -> String {
        "gh pr create -t \"\(title)\" -b \"\(description)\" -B \(baseBranch) -d -a @me"
    }

    var pushToRemote: String {
        "git push -u origin HEAD"
    }
}
