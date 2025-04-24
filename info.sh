#!/bin/bash

# Define colors for terminal output
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Output file paths
TEXT_REPORT="system_report.txt"
HTML_REPORT="system_report.html"

# Clear previous reports
> "$TEXT_REPORT"
> "$HTML_REPORT"

# Helper function for both text and HTML output
print_section() {
    local title=$1
    echo -e "\n${CYAN}==== $title ==== ${NC}" | tee -a "$TEXT_REPORT"
    echo -e "<h2>$title</h2><pre>" >> "$HTML_REPORT"
}

append_to_reports() {
    local output=$1
    echo -e "$output" | tee -a "$TEXT_REPORT"
    echo -e "$output" >> "$HTML_REPORT"
}

# HTML header
echo "<html><head><title>System Report</title></head><body><h1>System Report</h1>" >> "$HTML_REPORT"

# 1. System Info
print_section "SYSTEM INFORMATION"
append_to_reports "${YELLOW}Hostname:${NC} $(hostname)"
append_to_reports "${YELLOW}Current User:${NC} $USER"
append_to_reports "${YELLOW}Uptime:${NC} $(uptime -p)"
append_to_reports "${YELLOW}Current Date & Time:${NC} $(date)"

# 2. CPU and Memory
print_section "CPU AND MEMORY"
append_to_reports "${YELLOW}CPU Cores:${NC} $(nproc)"
append_to_reports "${YELLOW}CPU Model:${NC} $(grep -m 1 'model name' /proc/cpuinfo | cut -d ':' -f2 | sed 's/^ //')"
append_to_reports "${YELLOW}Total RAM:${NC} $(free -h | awk '/Mem:/ {print $2}')"
append_to_reports "${YELLOW}Free RAM:${NC} $(free -h | awk '/Mem:/ {print $4}')"

# 3. Disk & Filesystem
print_section "DISK & FILESYSTEM"
append_to_reports "$(df -h --total | grep -E 'Filesystem|total')"
append_to_reports "${YELLOW}Mounted Filesystems:${NC}"
append_to_reports "$(mount | grep '^/' | awk '{print $1, $3, $5}')"
append_to_reports "${YELLOW}Disk usage in /home and /var:${NC}"
append_to_reports "$(du -sh /home /var 2>/dev/null)"

# 4. Networking
print_section "NETWORKING"
append_to_reports "${YELLOW}IP Addresses:${NC}"
append_to_reports "$(ip a | grep 'inet ' | awk '{print $2}')"
append_to_reports "${YELLOW}Active Network Interfaces:${NC}"
append_to_reports "$(ip link show | awk -F: '$0 !~ "lo|^[^0-9]"{print $2}' | sed 's/^[ \t]*//')"
append_to_reports "${YELLOW}Top 5 processes by memory and CPU:${NC}"
append_to_reports "$(ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -n 6)"

# HTML footer
echo "</pre></body></html>" >> "$HTML_REPORT"

# End message
echo -e "\n${GREEN}Reports generated:${NC}"
echo -e "- Text: ${CYAN}$TEXT_REPORT${NC}"
echo -e "- HTML: ${CYAN}$HTML_REPORT${NC}"
