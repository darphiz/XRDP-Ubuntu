#!/bin/bash

# Function to prompt for username and password
prompt_credentials() {
    read -p "Enter the username: " USERNAME
    
    while true; do
        read -s -p "Enter the password: " PASSWORD
        echo
        read -s -p "Confirm the password: " PASSWORD_CONFIRM
        echo
        [ "$PASSWORD" = "$PASSWORD_CONFIRM" ] && break
        echo "Passwords do not match. Please try again."
    done
}

# Prompt for username and password
prompt_credentials

# Update the package list
sudo apt-get update -y

# Install required packages
sudo apt-get install -y xrdp xfce4 xfce4-goodies

# Create a user with the specified username and password
sudo useradd -m -s /bin/bash $USERNAME
echo "$USERNAME:$PASSWORD" | sudo chpasswd

# Add the user to the sudo group to give superuser privileges
sudo usermod -aG sudo $USERNAME

# Add user to the ssl-cert group required for XRDP
sudo adduser xrdp ssl-cert

# Set xfce4 as the session for XRDP
echo xfce4-session > /home/$USERNAME/.xsession
chown $USERNAME:$USERNAME /home/$USERNAME/.xsession

# Restart XRDP service
sudo systemctl restart xrdp

# Enable XRDP to start on boot
sudo systemctl enable xrdp

# Open the RDP port (3389) in the firewall if ufw is enabled
sudo ufw allow 3389/tcp

echo "XRDP setup complete. You can now connect via RDP using the username '$USERNAME'. The user has superuser privileges."
