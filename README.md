## LEMP Stack Installation on AlmaLinux

This document provides instructions for installing the LEMP stack (Nginx, MariaDB, PHP) on AlmaLinux using a shell script (`lemp_install.sh`).

**Requirements:**

* AlmaLinux system with root or sudo privileges
* Internet access

**Installation Steps:**

1. Save the provided script `lemp_install.sh` to your AlmaLinux server.
2. Make the script executable: `chmod +x lemp_install.sh`
3. Run the script with root privileges: `sudo ./lemp_install.sh`
  - The script will guide you through the installation process, including setting a root password for MariaDB.

**Testing the Installation:**

After the script completes, open a web browser and navigate to:


http://your_server_ip/info.php



Replace `your_server_ip` with the actual IP address of your server. You should see the PHP information page if the installation was successful.

