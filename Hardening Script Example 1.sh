#!/bin/bash

# Variable for the report output file, choose an output file name
REPORT_FILE="Hardening_Report_$(date '+%Y%m%d_%H%M%S')"

# Output the hostname
echo "Gathering hostname..."
# Placeholder for command to get the hostname
echo "Hostname: $(hostname)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE


# Output the OS version
echo "Gathering OS version..."
# Placeholder for command to get the OS version
echo "OS Version: $(sudo cat /etc/os-release)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE


# Output memory information
echo "Gathering memory information..."
# Placeholder for command to get memory info
echo "Memory Information: $(sudo vmstat)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE


# Output uptime information
echo "Gathering uptime information..."
# Placeholder for command to get uptime info
echo "Uptime Information: $(uptime)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE


# Backup the OS
echo "Backing up the OS..."
# Placeholder for command to back up the OS
sudo tar -cvpzf /baker_street_backup.tar.gz --exclude=/baker_street_backup.tar.gz --exclude=/proc --exclude=/tmp --exclude=/mnt --exclude=/sys --exclude=/dev --exclude=/run /

echo "OS backup completed." >> $REPORT_FILE
printf "\n" >> $REPORT_FILE



# Output the sudoers file to the report
echo "Gathering sudoers file..."
# Placeholder for command to output sudoers file
echo "Sudoers file:$(sudo cat /etc/sudoers)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE


# Script to check for files with world permissions and update them
echo "Checking for files with world permissions..."

Sudo find ~ -type f -perm /o+rwx -exec chmod o-rwx {} \;

# Placeholder for command to find and update files with world permissions
echo "World permissions have been removed from any files found." >> $REPORT_FILE
printf "\n" >> $REPORT_FILE


# Find specific files and update their permissions
echo "Updating permissions for specific scripts..."

# Engineering scripts - Only members of the engineering group
echo "Updating permissions for Engineering scripts."

# Placeholder for command to update permissions

Sudo find  -iname '*engineering*' -exec chown :engineering {} \;
Sudo find  -iname '*engineering*' chmod -R g+rwx,o-rwx

echo "Permissions updated for Engineering scripts." >> $REPORT_FILE
printf "\n" >> $REPORT_FILE


# Research scripts - Only members of the research group
echo "Updating permissions for Research scripts..."
# Placeholder for command to update permissions

Sudo find  -iname '*research*' -exec chown :research {} \;
Sudo find  -iname '*research*' chmod -R g+rwx,o-rwx

echo "Permissions updated for Research scripts" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE


# Finance scripts - Only members of the finance group
echo "Updating permissions for Finance scripts"
# Placeholder for command to update permissions

Sudo find  -iname '*finance*' -exec chown :finance {} +
Sudo find  -iname '*finance*' chmod -R g+rwx,o-rwx

echo "Permissions updated for Finance scripts." >> $REPORT_FILE
printf "\n" >> $REPORT_FILE


echo "Script execution completed. Check $REPORT_FILE for details."

