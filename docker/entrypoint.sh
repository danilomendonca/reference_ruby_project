#!/bin/bash
# Docker entrypoint script

set -e # Exit on any error

# Check if a command is passed
if [ $# -eq 0 ]; then
  echo "Error: No command provided."
  exit 1
fi

# Execute the command
exec "$@"
