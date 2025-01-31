#!/bin/bash

# Variable for the report output file, choose a NEW output file name
REPORT_FILE="Hardening_Report_2_$(date '+%Y%m%d_%H%M%S')"

# Output the sshd configuration file
echo "Gathering details from sshd configuration file"

# Placeholder for command to get the sshd configuration file
echo "sshd configuration file:$(sudo cat /etc/ssh/sshd.config)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Update packages and services
Echo “Updating packages and services”

# Placeholder for command to update packages
sudo apt-get update

# Placeholder for command to upgrade packages
sudo apt-get upgrade
echo "Packages have been updated and upgraded" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Placeholder for command to list all installed packages
echo "Installed Packages:$(sudo apt --installed list)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE
echo “Printing out logging configuration data”

# Placeholder for command to display logging data
echo "journald.conf file data: $(sudo cat /etc/systemd/journald.conf)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Placeholder for command to display logrotate data
echo "logrotate.conf file data:$(sudo cat /etc/logorate.conf)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

echo "Script execution completed. Check $REPORT_FILE for details."


