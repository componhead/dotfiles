#!/usr/bin/env node

/**
 *
 * This code will ensure that before every commit in your client repository, your branch name and commit message adheres to a certain contract.
 * In this example, branch names must be like 'FOR-123_some-feature-name' or, and commit messages must finish like some
 * issue code, like FOR-100 or FOR-101_same_text.
 * In order for this to work, you should go to .git/hooks in any git client repository and create a commitCheck.js file (or modify the provided by default, commitCheck.js.sample) with
 * this contents.
 *
 * You need an await/async compliant version of node installed in your machine.
 *
 * Don't forget to make your file executable!
 */

const fs = require('fs')
const childProcessExec = require('child_process').exec
const util = require('util')
const BRANCH_CONTRACT = /^[A-Z]{2,4}-[0-9]{1,4}(_[a-z_ ]*)?$/
const CODE_CONTRACT =
  /[fix|chore|docs|feat|refactor|style|test](\([a-z]{3,}\))*:\s.*\s[A-Z]{2,3}-\d+.*/
const TIMEOUT_THRESHOLD = 3000

const exec = util.promisify(childProcessExec)

checkCommitMessage()
hookCleanup()

async function checkCommitMessage () {
  const message = fs.readFileSync(process.argv[2], 'utf8')
  let branchName = ''
  try {
    branchName = await getCurrentBranch()
  } catch (e) {
    handleGitBranchCommandError(e)
  }

  if (!BRANCH_CONTRACT.test(branchName)) {
    handleBadBranchName()
  }

  if (!CODE_CONTRACT.test(message)) {
    handleBadCommitMessage()
  }

  const BRANCH_REGEX = new RegExp(`${branchName}`, 'g')
  if (!BRANCH_REGEX.test(message)) {
    handleBadCommitMessageWithBranch()
  }

  process.exit(0)
}

async function getCurrentBranch () {
  const branch = await exec('git rev-parse --abbrev-ref HEAD')
  if (branch.stderr) {
    throw new Error(stderr)
  }
  return branch.stdout.trim()
}

function handleGitBranchCommandError (e) {
  console.log(
    'Something bad happened when trying to read the repository branches using the "git branch" command'
  )
  console.log(
    'this is script is intended to be run as a git hook inside a git repository. Are you sure you\'re calling it properly?'
  )
  console.log(
    'the error provided by the "git branch" invocation was the following:\n'
  )
  console.log('----')
  console.log(e.getMessage())
  console.log('----')
  console.log('Your commit will be rejected. This script will terminate.')
  process.exit(1)
}

function handleBadBranchName () {
  console.log('There is something wrong with your branch name')
  console.log(
    'branch names in this project must start with a valid Jira issue code, optionally followed by an' +
    ' underscored separated description, thus adhering to this contract:' +
    BRANCH_CONTRACT
  )
  console.log(
    'Your commit will be rejected. You should rename your branch to a valid name, for instance, you could run a command like the following to rename your branch:'
  )
  console.log('\n> git branch -m \'FOR-123_optional_description\'')
  console.log(
    '\nif you thing there is something wrong with this message, or that your branch name is not being' +
    ' validated properly, check the commitCheck.js git hook'
  )
  ignoreMessage()
  process.exit(1)
}

function handleBadCommitMessage () {
  console.log('There is something wrong with your commit message')
  console.log(
    ' they must start with a well formed conventional commit title followed by a MANDATORY jira key that' +
    ' match the branch name, thus adhering to this contract:' +
    CODE_CONTRACT
  )
  console.log(
    'Your commit will be rejected. Please re-commit your work again with a proper commit message.'
  )
  console.log(
    '\nif you thing there is something wrong with this message, or that your commit message is not being' +
    ' validated properly, check the commitCheck.js git hook'
  )
  ignoreMessage()
  process.exit(1)
}

function handleBadCommitMessageWithBranch () {
  console.log('There is something wrong with your commit message')
  console.log(' the jira key should match branch name')
  console.log(
    'Your commit will be rejected. You should include the correct branchname/jirakey in your commit'
  )
  console.log(
    '\nif you thing there is something wrong with this message, or that your commit message is not being' +
    ' validated properly, check the commitCheck.js git hook'
  )
  ignoreMessage()
  process.exit(1)
}

function hookCleanup () {
  setTimeout(() => {
    console.log(
      'This is a timeout message from your commitCheck.js git hook. If you see this, something bad happened in your pre-commit hook, and it absolutely did not work as expected.'
    )
    console.log(
      'Your commit will be rejected. Please read any previous error message related to your commit message, and/or check the commitCheck.js git hook script.'
    )
    console.log(
      '\nYou can find more info in this link:' +
      ' https://git-scm.com/book/uz/v2/Customizing-Git-An-Example-Git-Enforced-Policy'
    )
    process.exit(1)
  }, TIMEOUT_THRESHOLD)
}

function ignoreMessage () {
  console.log(
    '\nYou can override the constraint (not recommended) using \n\n> git commit --no-verify (or' +
    ' -n)'
  )
}
