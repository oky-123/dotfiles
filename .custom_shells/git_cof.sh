#!/bin/sh

# Git checkout branch
function git_cof() {
  git branch --sort=-authordate | sort -r |
    sk --exit-0 --no-multi --preview-window="right,65%" --preview="echo {} | tr -d ' *' | xargs git lgn --color=always" |
    head -n 1 |
    perl -pe "s/\s//g; s/\*//g; s/remotes\/origin\///g" |
    xargs git co
}

git_cof
