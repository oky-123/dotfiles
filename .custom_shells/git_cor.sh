#!/bin/sh

# Git checkout branch in origin
function git_cor() {
  git branch -r --sort=-authordate |
    sk --exit-0 --no-multi --preview-window="right,65%" --preview="echo {} | tr -d ' *' | xargs git lgn --color=always" |
    head -n 1 |
    sed -e "s/^\*\s*//g" |
    xargs git co -t
}

git_cor
