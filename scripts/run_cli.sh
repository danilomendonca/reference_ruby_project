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

# Execute the container command
docker compose run --rm project bundle exec ruby bin/cli "$COMMAND" "$ARG"
