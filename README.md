 Master Basic Linux Command-Line and Bash Scripting

 Description

This project contains a Bash script (info.sh) that gathers and displays essential system information in a structured and user-friendly format. It’s designed to help practice common Linux commands and basic Bash scripting concepts.
 Features

The script provides detailed information under the following sections:

 System Information

   Hostname

   Current user

   System uptime

   Current date and time

   CPU and Memory

   Number of CPUs/cores

   CPU model

   Total and free RAM

   Disk & Filesystem

   Overall disk usage

   Mounted filesystems

   Disk usage for /home and /var

 Networking

   IP addresses

   Active network interfaces

   Top 5 processes by memory and CPU

  Other Features

   Colored terminal output for better readability (using ANSI escape codes)

   Optionally generates an HTML and a text report of the output

 Files Included

 info.sh – The Bash script.

 system_report.txt – Text-based report output.

 system_report.html – HTML-formatted version of the report.

 README.md – This documentation file.

 How to Run

 Make the script executable:

    chmod +x info.sh

Run the script:

    ./info.sh

 View output:

   Terminal (colored)

   system_report.txt (plain text)

   system_report.html (open in any browser)


Commands I Learned

Here are a few important Linux commands and tools I practiced:

  nproc – shows the number of processing cores.

  free -h – displays system memory in a human-readable format.

  ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -n 6 – lists top processes by memory usage.

  ip a and ip link show – show IP addresses and network interfaces.

  df -h, du -sh – used for disk usage reporting.

  awk, grep, cut, sed – text processing tools used to extract data.

Learning Goals

This project helped reinforce:

   Bash scripting basics

   System monitoring using CLI tools

   File redirection, permissions, and output formatting

   Creating dynamic reports using Linux commands

   Combining utilities for powerful automation
