#!/bin/bash
# Script 1: System Identity Report
# Author: Kartikey Karnwal | Course: Open Source Software
# Description: Displays a welcome screen with system identity and OS license info.
# Concepts used: Variables, command substitution $(), echo, basic output formatting.

# --- Variables ---
STUDENT_NAME="Kartikey Karnwal"
SOFTWARE_CHOICE="Git"

# --- System info ---
# Using command substitution $() to dynamically fetch system data
KERNEL=$(uname -r)
USER_NAME=$(whoami)
USER_HOME=$HOME
UPTIME=$(uptime -p)
CURRENT_DATE=$(date +"%A, %B %d, %Y %T")

# Extracting the distribution name from the os-release file
DISTRO=$(grep '^PRETTY_NAME' /etc/os-release | cut -d'"' -f2)

# --- Display ---
echo "=================================================="
echo " Open Source Audit - $STUDENT_NAME"
echo " Focus: $SOFTWARE_CHOICE"
echo "=================================================="
echo "Date/Time  : $CURRENT_DATE"
echo "Distro     : $DISTRO"
echo "Kernel     : $KERNEL"
echo "User       : $USER_NAME"
echo "Home Dir   : $USER_HOME"
echo "Uptime     : $UPTIME"
echo "--------------------------------------------------"
# Message stating the open-source license covering the OS
echo "License Info: This operating system is powered by the Linux kernel,"
echo "which is distributed under the GNU General Public License version 2 (GPLv2)."
echo "=================================================="