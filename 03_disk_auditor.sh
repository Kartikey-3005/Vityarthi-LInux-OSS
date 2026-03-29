#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Kartikey Karnwal | Roll: 24BCE10508
# Description: Audits key Linux directories for permissions, ownership,
#              and disk usage. Also checks Git's config footprint.
# Concepts: for loop, arrays, [ -d ] test, du, ls -ld, awk, cut.

# Define the audited software for labelling purposes
SOFTWARE_CHOICE="Git"

# Array of critical system directories to audit
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "========================================"
echo " Directory Audit Report"
echo "========================================"

# for loop: iterate through every directory in the array
for DIR in "${DIRS[@]}"; do
    # Conditional test: [ -d ] returns true if path is a directory
    if [ -d "$DIR" ]; then
        # awk extracts columns 1 (permissions), 3 (owner), 4 (group)
        # from ls -ld long-format output
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        # du -sh gives human-readable size; cut -f1 takes just the number
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        echo "$DIR"
        echo "  Permissions/Owner : $PERMS"
        echo "  Disk Usage        : $SIZE"
        echo "----------------------------------------"
    else
        echo "$DIR — does not exist on this system"
        echo "----------------------------------------"
    fi
done

echo ""
echo "Checking $SOFTWARE_CHOICE system configuration footprint..."
echo "========================================"

# [ -f ] tests for a regular file (not a directory)
GIT_CONFIG="/etc/gitconfig"
GIT_BIN="/usr/bin/git"

if [ -f "$GIT_CONFIG" ]; then
    GIT_PERMS=$(ls -ld "$GIT_CONFIG" | awk '{print $1, $3, $4}')
    echo "$GIT_CONFIG => $GIT_PERMS"
else
    echo "Global Git config ($GIT_CONFIG) not found on this system."
fi

if [ -f "$GIT_BIN" ]; then
    BIN_PERMS=$(ls -ld "$GIT_BIN" | awk '{print $1, $3, $4}')
    echo "$GIT_BIN => $BIN_PERMS"
else
    echo "Git binary ($GIT_BIN) not found."
fi
