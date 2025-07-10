#!/bin/sh

# Get current directory name and parent directory name
CWD=$(pwd)
CWD_NAME=$(basename "$CWD")
PARENT_CWD=$(dirname "$CWD")
PARENT_CWD_NAME=$(basename "$PARENT_CWD")

# Create session name in format "cwd (parent-cwd)"
SESSION_NAME="${CWD_NAME} (${PARENT_CWD_NAME})"

# Check if tmux session already exists
if ! @tmux@/bin/tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
    # Create new session with first window named "sys"
    @tmux@/bin/tmux new-session -d -s "$SESSION_NAME" -n "sys" -c "$CWD"
    # Create additional windows with specific names
    @tmux@/bin/tmux new-window -t "$SESSION_NAME:1" -n "vi" -c "$CWD"
    @tmux@/bin/tmux new-window -t "$SESSION_NAME:2" -n "git" -c "$CWD"
    @tmux@/bin/tmux new-window -t "$SESSION_NAME:3" -n "run" -c "$CWD"
    @tmux@/bin/tmux new-window -t "$SESSION_NAME:4" -n "nav" -c "$CWD"
    @tmux@/bin/tmux new-window -t "$SESSION_NAME:5" -n "docker" -c "$CWD"
    @tmux@/bin/tmux new-window -t "$SESSION_NAME:6" -n "ssh" -c "$CWD"
    @tmux@/bin/tmux new-window -t "$SESSION_NAME:7" -n "logs" -c "$CWD"
    @tmux@/bin/tmux new-window -t "$SESSION_NAME:8" -n "more" -c "$CWD"
    @tmux@/bin/tmux new-window -t "$SESSION_NAME:9" -n "end" -c "$CWD"
    # Select first window (sys)
    @tmux@/bin/tmux select-window -t "$SESSION_NAME:0"
fi

# Attach to session
@tmux@/bin/tmux attach-session -t "$SESSION_NAME"
