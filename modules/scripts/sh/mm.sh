#!/bin/sh

set -e

# Get current directory name and parent directory name
CWD=$(pwd)
CWD_NAME=$(basename "$CWD")
CWD_NAME=$(printf "%s" "$CWD_NAME" | cut -c1-12)
PARENT_CWD=$(dirname "$CWD")
PARENT_CWD_NAME=$(basename "$PARENT_CWD")
PARENT_CWD_NAME=$(printf "%s" "$PARENT_CWD_NAME" | cut -c1-12)

# Create session name in format "cwd (parent-cwd)"
SESSION_NAME="${CWD_NAME} (${PARENT_CWD_NAME})"

# Check if tmux session already exists
if ! tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
    # Create new session with first window named "sys"
    tmux new-session -d -s "$SESSION_NAME" -n "sys" -c "$CWD"
    # Create additional windows with specific names
    tmux new-window -t "$SESSION_NAME:1" -n "vi" -c "$CWD"
    tmux new-window -t "$SESSION_NAME:2" -n "git" -c "$CWD"
    # Start lazygit in git window if available and in a git repo
    if command -v lazygit >/dev/null 2>&1 && [ -d "$CWD/.git" ]; then
        #tmux send-keys -t "$SESSION_NAME:2" "lazygit" C-m
        tmux send-keys -t "$SESSION_NAME:2" "echo 'lazygit here'" C-m
        tmux send-keys -t "$SESSION_NAME:2" "lg"
    fi
    tmux new-window -t "$SESSION_NAME:3" -n "run" -c "$CWD"
    tmux new-window -t "$SESSION_NAME:4" -n "nav" -c "$CWD"
    tmux new-window -t "$SESSION_NAME:5" -n "docker" -c "$CWD"
    tmux new-window -t "$SESSION_NAME:6" -n "ssh" -c "$CWD"
    tmux new-window -t "$SESSION_NAME:7" -n "logs" -c "$CWD"
    tmux new-window -t "$SESSION_NAME:8" -n "more" -c "$CWD"
    tmux new-window -t "$SESSION_NAME:9" -n "end" -c "$CWD"
    # Select first window (sys)
    tmux select-window -t "$SESSION_NAME:1"
fi

# Attach to session
tmux attach-session -t "$SESSION_NAME"
