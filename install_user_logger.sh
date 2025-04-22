#!/bin/bash

echo "Installing User Activity Logger..."

#Copy script to /usr/local/bin
sudo cp user_activity_logger.sh /usr/local/bin/user_activity_logger
sudo chmod +x /usr/local/bin/user_activity_logger

#Create log file
sudo touch /var/log/user_activity.log
sudo chmod 600 /var/log/user_activity.log
sudo chown root:root /var/log/user_activity.log

#Create systemd service
SERVICE_FILE=/etc/systemd/system/userlogger.service

sudo bash -c "cat > $SERVICE_FILE" <<EOF
[Unit]
Description=User Activity Logger Service
After=network.target

[Service]
ExecStart=/usr/local/bin/user_activity_logger
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOF

#Reload systemd and start service
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable userlogger.service
sudo systemctl start userlogger.service

echo "Logger installed and running as a service!"
echo "Check logs: sudo cat /var/log/user_activity.log"
echo "Service status: sudo systemctl status userlogger.service"
