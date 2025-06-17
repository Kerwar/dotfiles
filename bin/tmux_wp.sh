#!/bin/bash

# Set the session name to the current directory's name
SESSION_NAME=$(basename "$(pwd)")

# Desired IP address
WORK_IP="172.31.2.63"

# Get the first IP address from `hostname -I`
CURRENT_IP=$(hostname -I | awk '{print $1}')

# Check if a tmux session with the same name already exists
if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
  echo "Session '$SESSION_NAME' already exists. Attaching to it."
  tmux attach-session -t "$SESSION_NAME"
else
  echo "Creating new tmux session: $SESSION_NAME"

  # Create a new detached tmux session with the first window
  tmux new-session -d -s "$SESSION_NAME" -n "nvim" "nvim; bash"

  # Create the second window
  tmux new-window -t "$SESSION_NAME":2 -n "build"

  # Create the third window
  tmux new-window -t "$SESSION_NAME":3 -n "config" -c ~/.config/nvim "nvim; bash"

  # Create the fourth window with multiple panes
  tmux new-window -t "$SESSION_NAME":4 -n "debug"

  # Split the fifth window into 4 panes
  tmux split-window -h -t "$SESSION_NAME":4.0 # Split horizontally (creates 2 panes)
  tmux split-window -v -t "$SESSION_NAME":4.0 # Split vertically in the first pane
  tmux split-window -v -t "$SESSION_NAME":4.2 # Split vertically in the second pane (which is now pane 3.2)

  # Create the fifth window in Pos64Src
  if [ "$CURRENT_IP" == "$WORK_IP" ]; then
    tmux new-window -t "$SESSION_NAME":5 -n "Pos" -c ~/prj/Pos64Src "nvim"
else
    echo "Current IP ($CURRENT_IP) does not match the desired IP ($WORK_IP)."
  fi

  # Select the first window to start in
  tmux select-window -t "$SESSION_NAME":1

  # Attach to the newly created session
  tmux attach-session -t "$SESSION_NAME"
fi

