#!/bin/bash

LOG_FILE="/var/log/user_activity.log"

if [ ! -f "$LOG_FILE" ]; then
    sudo touch "$LOG_FILE"
    sudo chmod 600 "$LOG_FILE"
    sudo chown root:root "$LOG_FILE"
fi

USER=$(whoami)
TIMESTAMP=$(date +"%Y-%m-%d %H:%M")
HOST=$(hostname)

HISTFILE="/home/$SUDO_USER/.bash_history"
COMMAND=$(tail -n 1 "$HISTFILE")
if [ -z "$COMMAND" ]; then COMMAND="No command found"; fi

echo "[$TIMESTAMP] | User:$USER | Host: $HOST | IP: $IP | Command: $COMMAND" | sudo tee -a "$LOG_FILE" > /dev/null
