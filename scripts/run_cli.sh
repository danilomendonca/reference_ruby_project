#!/bin/bash
# Script to run a command inside the project container

# Check if at least two arguments are passed
if [ $# -lt 2 ]; then
  echo "Usage: ./scripts/run_cli.sh <command> <arg>"
  exit 1
fi

# Extract the command and argument
COMMAND=$1
ARG=$2

# Check if input is coming from a pipe or file
if [ -t 0 ]; then
  # Interactive session
  docker run --rm -it project bundle exec ruby bin/cli "$COMMAND" "$ARG"
else
  # Non-interactive session (e.g., input from a file or pipe)
  docker run --rm -i project bundle exec ruby bin/cli "$COMMAND" "$ARG"
fi
