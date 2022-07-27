#!/bin/sh

# Git open PR by commit hash
function openpr() {
  git searchpr $1 | xargs -I ISSUE_NUMBER gh pr view ISSUE_NUMBER --web;
}

openpr $1
