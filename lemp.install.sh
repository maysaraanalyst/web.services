
#!/bin/bash

# Update package lists
sudo dnf update -y

# Enable EPEL repository for additional packages
sudo dnf install epel-release -y

# Install Nginx web server
sudo dnf install nginx -y

# Start and enable Nginx service
sudo systemctl start nginx
sudo systemctl enable nginx

# Install MariaDB database server
sudo dnf install mariadb-server mariadb-client -y

# Secure MariaDB installation (prompts for root password)
sudo mysql_secure_installation

# Start and enable MariaDB service
sudo systemctl start mariadb
sudo systemctl enable mariadb

# Install PHP and common modules
sudo dnf install php php-fpm php-mysqlnd php-gd php-mbstring php-xml -y

# Enable PHP-FPM service
sudo systemctl start php-fpm
sudo systemctl enable php-fpm

# Test PHP functionality
sudo echo "<?php phpinfo(); ?>" > /var/www/html/info.php

# Open firewall ports (adjust as needed)
sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --permanent --add-port=443/tcp (if using HTTPS)
sudo firewall-cmd --reload

# (Optional) Set ownership and permissions for web content directory
sudo chown -R apache:apache /var/www/html
sudo chmod 644 /var/www/html/info.php

echo "LEMP stack installation complete!"

echo "Access the test PHP page at http://your_server_ip/info.php"
echo "(Replace 'your_server_ip' with the actual IP address of your server)"
