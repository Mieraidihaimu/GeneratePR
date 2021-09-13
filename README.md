# GeneratePR

A Swift command-line tool to generate a pull request by taking the leverage of GITHUT CLI and git commit logs on current branch, then create a draft Pull requests.

## 📋 Supported OS & SDK Versions

* Swift 5.2
* OSX

## Details

The intension of this command line tool is to automate some of the redundant manual processes. I have used `swift-argument-parser` and `github-cli`. It will:
1. Get all the commit logs against the base branch
2. Generate full pr description according to git commit logs and given optional extra description.
3. Push the working branch to remote origin. At the moment, `gh pr create` will not push branch to the server https://github.com/cli/cli/issues/1718. Thus, we need to manually push the working branch to origin
4. Create pull request by using `gh pr create`
5. Optional, it will open the created pull request url on the default browser.

## 🌟 Pre-requisition 

For now, need to be in Mac enviroment with git command line tool and github cli installed,

- [ ] Install git https://github.com/git-guides/install-git
- [ ] Install github cli command line tool https://github.com/cli/cli


## 🔮 Installation & Example
To install it, simply add the following lines
Ready Set goal ~~~~~

```shell
git clone https://github.com/Mieraidihaimu/GeneratePR.git
cd GeneratePR
swift build -c release
cp .build/release/GeneratePR /usr/local/bin/gen-pr
```

once you have moved binary file as gen-pr, you can start creating PR like

```shell
gen-pr "title" "Mieraidihaimu/GeneratePR/issues/1" -e "no need to panic" --fix -o
```

then you can sit back and relex. Here are the usage

```shell
USAGE: gen-pr <title> [--extra-description <extra-description>] [--base-branch <base-branch>] [--feature] [--fix] <issue> [--verbose] [--open-URL]

ARGUMENTS:
  <title>                 The pull request title
  <issue>                 Linked github issue path. For instance, in issue URL
                          https://github.com/randomX/repoY/issues/1060, the
                          `randomX/repoY/issues/1060` is the issue path

OPTIONS:
  -e, --extra-description <extra-description>
                          The PR extra description for pull request.
  -b, --base-branch <base-branch>
                          The base branch which the pull requests will be open
                          to, default is main (default: main)
  --feature/--fix         The PR type: is it a feature or bug fix PR?. Default
                          value is feature PR. (default: feature)
  -v, --verbose           Show logs, information and non blocking messages.
  -o, --open-URL          Open Pull request URL on default browser.
  -h, --help              Show help information.

```

To learn more please use `--help` or visit `https://github.com/Mieraidihaimu/GeneratePR`

## 🌝 Contribute

1. Fork it! 👀
2. Create your feature branch: `git checkout -b name/my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin name/my-new-feature`
5. Submit a pull request :D 🙈
6. Get thumbs up and 👍

## ☄️ Author

### Mieraisan Mieraidihaimu (CallMe: Mier)
- [LinkedIn](https://www.linkedin.com/in/mieraidihaimu-mieraisan-220b7732/)
- Email : mieraisan@gmail.com

## 🌈 License

`GeneratePR` is released under the MIT license. See LICENSE for details.
