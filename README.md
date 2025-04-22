A lightweight Linux logger that records user command activity to `/var/log/user_activity.log`. The logger is installed and managed via a `systemd` service.

## 📥 Installation

1. Clone or download the repository.

2. Run the installer script:

```bash
chmod +x install_user_logger.sh
./install_user_logger.sh

## 🔍 Log File
You can view the logged activities by running:
sudo cat /var/log/user_activity.log

## ⚙️ How It Works

    Logs the user’s command, IP address, time, and host

    Writes logs to /var/log/user_activity.log

    Managed as a systemd service (userlogger.service)

## 🧪 Status Commands

Check the status of the service:
sudo systemctl status userlogger.service

Restart the service if needed:
sudo systemctl restart userlogger.service

## 📂 Files

    user_activity_logger.sh — The logging script

    install_user_logger.sh — The installer and systemd setup script

