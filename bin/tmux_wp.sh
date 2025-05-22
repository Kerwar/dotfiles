#!/bin/bash

# Check if a directory path is provided as an argument
if [ -z "$1" ]; then
  echo "Error: No directory path provided."
  echo "Usage: $0 <directory_path>"
  exit 1
fi

TARGET_DIR="$1"
SESSION_NAME="$1" # You can customize the session name

# Check if the target directory exists
if [ ! -d "$TARGET_DIR" ]; then
  echo "Error: Directory '$TARGET_DIR' not found."
  exit 1
fi

# Move to the target directory
echo "Moving to directory: $TARGET_DIR"
cd "$TARGET_DIR" || { echo "Failed to change directory to $TARGET_DIR"; exit 1; }

# Check if a tmux session with the same name already exists
tmux has-session -t "$SESSION_NAME" 2>/dev/null

if [ $? -eq 0 ]; then
  echo "Session '$SESSION_NAME' already exists. Attaching to it."
  tmux attach-session -t "$SESSION_NAME"
else
  echo "Creating new tmux session: $SESSION_NAME"

  # Create a new detached tmux session with the first window
  tmux new-session -d -s "$SESSION_NAME" -n "window1"

  # Create the second window
  tmux new-window -t "$SESSION_NAME":1 -n "window2"

  # Create the third window
  tmux new-window -t "$SESSION_NAME":2 -n "window3"

  # Create the fourth window with multiple panes
  tmux new-window -t "$SESSION_NAME":3 -n "window4"

  # Split the fourth window into 4 panes
  tmux split-window -h -t "$SESSION_NAME":3.0 # Split horizontally (creates 2 panes)
  tmux split-window -v -t "$SESSION_NAME":3.0 # Split vertically in the first pane
  tmux split-window -v -t "$SESSION_NAME":3.2 # Split vertically in the second pane (which is now pane 3.2)

  # Select the first window to start in
  tmux select-window -t "$SESSION_NAME":0

  # Attach to the newly created session
  tmux attach-session -t "$SESSION_NAME"
fi

