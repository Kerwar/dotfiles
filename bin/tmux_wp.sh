#!/bin/bash

# Set the session name to the current directory's name
SESSION_NAME=$(basename "$(pwd)")

# Check if a tmux session with the same name already exists
tmux has-session -t "$SESSION_NAME" 2>/dev/null

if [ $? -eq 0 ]; then
  echo "Session '$SESSION_NAME' already exists. Attaching to it."
  tmux attach-session -t "$SESSION_NAME"
else
  echo "Creating new tmux session: $SESSION_NAME"

  # Create a new detached tmux session with the first window
  tmux new-session -d -s "$SESSION_NAME" -n "nvim"

  # Create the second window
  tmux new-window -t "$SESSION_NAME":2 -n "build"

  # Create the third window
  tmux new-window -t "$SESSION_NAME":3 -n "config" -c ~/.config/nvim

  # Create the fourth window in Pos64Src
  tmux new-window -t "$SESSION_NAME":4 -n "Pos" -c ~/prj/Pos64Src

  # Create the fifth window with multiple panes
  tmux new-window -t "$SESSION_NAME":5 -n "debug"

  # Split the fifth window into 4 panes
  tmux split-window -h -t "$SESSION_NAME":5.0 # Split horizontally (creates 2 panes)
  tmux split-window -v -t "$SESSION_NAME":5.0 # Split vertically in the first pane
  tmux split-window -v -t "$SESSION_NAME":5.2 # Split vertically in the second pane (which is now pane 3.2)

  # Select the first window to start in
  tmux select-window -t "$SESSION_NAME":1

  # Attach to the newly created session
  tmux attach-session -t "$SESSION_NAME"
fi

