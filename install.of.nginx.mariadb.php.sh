
#!/bin/bash

# Update system packages
dnf -y update

# Enable EPEL repository for additional packages
dnf -y install epel-release

# Install Nginx web server
dnf -y install nginx

# Enable and start Nginx
systemctl enable nginx
systemctl start nginx

# Install MariaDB database server
dnf -y install mariadb-server mariadb

# Secure MariaDB with initial setup script
mysql_secure_installation

# Start and enable MariaDB
systemctl enable mariadb
systemctl start mariadb

# Install PHP and PHP-FPM (FastCGI Process Manager)
dnf -y install php php-fpm

# Enable and start PHP-FPM
systemctl enable php-fpm
systemctl start php-fpm

# Configure PHP-FPM to work with Nginx
# Change user/group to nginx
sed -i 's/user = apache/user = nginx/g' /etc/php-fpm/php-fpm.d/www.conf
sed -i 's/group = apache/group = nginx/g' /etc/php-fpm/php-fpm.d/www.conf

# Restart Nginx and PHP-FPM after configuration changes
systemctl restart nginx
systemctl restart php-fpm

# Test PHP installation (create a test.php file)
echo "<?php phpinfo(); ?>" > /var/www/html/test.php

# Open test.php in your browser (http://localhost/test.php or http://your_server_ip/test.php)
# You should see the PHP information page if successful

# (Optional) Secure Nginx with a firewall

echo "LEMP stack installation complete!"
