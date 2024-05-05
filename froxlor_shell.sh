#!/bin/bash

# Install necessary packages for adding APT repository
sudo apt -y install gnupg2 apt-transport-https lsb-release curl ca-certificates

# Add Froxlor APT repository key
curl -sSLo /usr/share/keyrings/deb.froxlor.org-froxlor.gpg https://deb.froxlor.org/froxlor.gpg

# Add Froxlor APT repository
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.froxlor.org-froxlor.gpg] https://deb.froxlor.org/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/froxlor.list'

# Update package lists
sudo apt update

# Install Froxlor server management panel
sudo apt install froxlor -y

# Start MySQL service
sudo systemctl start mysql

# Create MySQL user for Froxlor
sudo mysql <<EOF
CREATE USER 'froxroot'@'localhost' IDENTIFIED BY 'Str0ngfroxPassw0rd';
GRANT ALL PRIVILEGES ON *.* TO 'froxroot'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EXIT;
EOF

# Install PHP GNUPG and restart Apache
sudo apt install php-gnupg -y
sudo systemctl restart apache2

# Prompt the user to access Froxlor
echo "Froxlor installation is complete. Access Froxlor via http://ServerIP_or_FQDN/froxlor"
echo -e "\e[1;35mThank you for installing Froxlor! Check out our YouTube channel for more Linux networking tutorials: \e[0m"
echo -e "\e[1;35mYouTube: \e[4mhttps://www.youtube.com/@linuxnetworkinghelp\e[0m"

    
