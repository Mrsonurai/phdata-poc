#!/bin/bash

# Update system packages
sudo apt-get update -y

# Wait for system update
sleep 40

# Install MySQL server
sudo apt-get install -y mysql-server


# Wait for MySQL to install fully
sleep 3m

# Start MySQL service
sudo systemctl start mysql
sudo systemctl enable mysql

# Change MySQL port to 3307
sudo sed -i 's/3306/3307/' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql

# Wait for MySQL to start fully
sleep 20

# Create new MySQL admin user
sudo mysql -u root -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'newpass76';"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';"
sudo mysql -u root -e "FLUSH PRIVILEGES;"

# Install wget and unzip if not already installed
sudo apt-get install -y wget unzip


# Wait for MySQL to start fully
sleep 30

# Download the Employees Sample Database from GitHub
wget https://github.com/datacharmer/test_db/archive/refs/heads/master.zip -O test_db.zip


# Wait for Wget to download fully
sleep 2m

# Unzip the downloaded file
unzip test_db.zip
sleep 1m
cd test_db-master/

# Optionally, modify the storage engine in employees.sql (Uncomment if needed)
# sed -i 's/set storage_engine = InnoDB;/set storage_engine = MyISAM;/' employees.sql

# Import the Employees sample database into MySQL
sudo mysql -u root -P 3307 < employees.sql

# Wait for load completely
sleep 4m

# Verification: Show the list of databases to ensure Employees DB is imported
sudo mysql -u root -P 3307 -e "SHOW DATABASES;"



## Manual change for Install MySQL Workbench on your local machine and establish a connection to
# MySQL on port 3307 and making it to 0.0.0.0
# sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
# sudo systemctl restart mysql


## sudo mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' IDENTIFIED BY 'sonutest76';"


# sudo mysql -u root -e "CREATE USER 'admin'@'%' IDENTIFIED WITH mysql_native_password BY 'sonutest76';"
# sudo mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';"
# sudo mysql -u root -e "FLUSH PRIVILEGES;"



# sudo mysql -u root -e "ALTER USER 'admin'@'%' IDENTIFIED WITH mysql_native_password BY 'newpass76';"
# sudo mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';"
# sudo mysql -u root -e "FLUSH PRIVILEGES;"



# Edit the SSH configuration file:

# bash

# sudo nano /etc/ssh/sshd_config

# Add or modify the following settings:

# plaintext

# ClientAliveInterval 300
# ClientAliveCountMax 2
# sudo systemctl restart ssh


## Manual change the port to listen to 3307 from below command 
#  sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
#  sudo systemctl restart mysql