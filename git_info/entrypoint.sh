#!/bin/bash

# Show log
git log

# Show modified files in last commit
git diff-tree --no-commit-id --name-only -r HEAD
