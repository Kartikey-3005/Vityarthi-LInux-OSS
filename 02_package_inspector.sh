#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Kartikey Karnwal
# Description: Checks package installation status, version, and prints its philosophy.
# Concepts used: if-then-else, case statement, dpkg, pipe with grep.

PACKAGE="git"

echo "Inspecting system for FOSS package: $PACKAGE..."
echo "------------------------------------------------"

# Check if package is installed. 
# Redirecting standard output and standard error to /dev/null for clean execution.
if dpkg -s "$PACKAGE" &>/dev/null; then
    echo "[SUCCESS] $PACKAGE is installed on this system."
    # Fetching version and description using pipe and extended grep
    dpkg -s "$PACKAGE" | grep -E '^Version|^Description'
else
    echo "[WARNING] $PACKAGE is NOT installed."
fi

echo "------------------------------------------------"

# Case statement to print a short description based on the package name
case $PACKAGE in
    git) 
        echo "Git: The decentralized engine of global collaboration and code sovereignty." 
        ;;
    httpd|apache2) 
        echo "Apache: The web server that built the open internet." 
        ;;
    mysql|mariadb-server) 
        echo "MySQL: Open source at the heart of millions of apps." 
        ;;
    vlc) 
        echo "VLC: The universal media player built by students, free from proprietary codecs." 
        ;;
    *) 
        echo "An open-source tool contributing to the vast Linux ecosystem." 
        ;;
esac