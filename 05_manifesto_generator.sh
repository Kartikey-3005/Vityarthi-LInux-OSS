#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Kartikey Karnwal | Roll: 24BCE10508
# Description: Interactively generates a personalised open-source
#              philosophy manifesto and saves it to a .txt file.
# Concepts: read (user input), string concatenation, > and >> redirection,
#           date command, alias declaration.

# --- Alias concept demonstration ---
# An alias maps a long command to a short, memorable label.
# This is defined in-script to demonstrate the concept.
# In a real shell session, aliases live in ~/.bashrc or ~/.bash_aliases.
alias today='date "+%d %B %Y"'

# We can now call 'today' as if it were a built-in command:
# CURRENT=$(today)  -- this resolves to today's formatted date.
# For script compatibility we use the full date command below,
# but the alias above is a live, working declaration.

echo "=================================================="
echo " Open Source Manifesto Generator"
echo "=================================================="
echo "Answer three questions to generate your manifesto."
echo ""

# read -p: displays the prompt inline and waits for the user to type.
# The input is stored in the named variable.
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# Command substitution: capture the current date into a variable
DATE=$(date '+%d %B %Y')

# Output filename includes the current username for personalisation
OUTPUT="manifesto_$(whoami).txt"

echo ""
echo "Composing your manifesto..."
echo "--------------------------------------------------"

# > operator: creates the file fresh (overwrites if it already exists).
# Writing the header block line by line.
echo "=== My Open Source Manifesto ===" > "$OUTPUT"
echo "Author : $(whoami)"               >> "$OUTPUT"
echo "Date   : $DATE"                   >> "$OUTPUT"
echo ""                                 >> "$OUTPUT"

# >> operator: appends the manifesto paragraph without overwriting the header.
# String concatenation is achieved by embedding $TOOL, $FREEDOM, $BUILD
# directly inside a double-quoted echo string — bash expands them inline.
echo "I believe that software should empower rather than restrict. \
The tool I rely on daily, $TOOL, represents this philosophy perfectly. \
To me, open source is synonymous with $FREEDOM — it ensures that code \
remains a public good, not a locked box. Standing on the shoulders of \
the community, I pledge to build $BUILD and share it freely, so others \
may learn from my work just as I have learned from theirs." >> "$OUTPUT"

echo "--------------------------------------------------"
echo "Manifesto saved to: $OUTPUT"
echo "--------------------------------------------------"

# Display the completed file using cat
cat "$OUTPUT"
