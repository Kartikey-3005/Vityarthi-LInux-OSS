#!/bin/bash
# Script 4: Log File Analyzer (Optimized for WSL)
# Author: Kartikey Karnwal

LOGFILE=${1:-"/var/log/syslog"}
KEYWORD=${2:-"error"}

# Retry if file missing or empty
while [ ! -s "$LOGFILE" ]; do
    echo "Error: File $LOGFILE is missing or empty."
    read -p "Enter a valid log file path: " LOGFILE
done

echo "Scanning $LOGFILE for keyword: '$KEYWORD'..."
echo "--------------------------------------------------"

# Fast counting using grep
COUNT=$(grep -i -c "$KEYWORD" "$LOGFILE")

echo "Keyword '$KEYWORD' found $COUNT times in $LOGFILE"
echo "--------------------------------------------------"

# Show last 5 matches
if [ "$COUNT" -gt 0 ]; then
    echo "Displaying last 5 occurrences:"
    grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
else
    echo "No matches found."
fi
