#! /bin/bash

echo "Work Directory:"

read DIRECTORY

DIRECTORY="${PWD}/${DIRECTORY}"

if cd "$DIRECTORY"; then
  # window 1
  tmux split-window -v -c '#{pane_current_path}'
  tmux resize-pane -D 5

  # window 2
  tmux new-window -c "#{pane_current_path}"
  tmux split-window -v -c '#{pane_current_path}'

  # return to window1
  tmux previous-window
  tmux select-pane -U
fi
