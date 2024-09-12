# #!/bin/bash

### Uncommmen below if you need to run this script from local, dont uncomment if BB pipeline is running this script..

# repoLocation=$(pwd)
# # Copy the key from home directory
# # cp -R sonu-test-bastion.pem $repoLocation

# # Define variables
# KEY_PATH="$repoLocation/sonu-test-bastion.pem"
# INSTANCE_IP="13.56.198.84"

# # Run commands on EC2 instance
# ssh -i "$KEY_PATH" ubuntu@"$INSTANCE_IP" << EOF
#   # Update system packages
#   sudo apt-get update -y
  
#   # Install MySQL server
#   sudo apt-get install -y mysql-server

#   # Start MySQL service
#   sudo systemctl start mysql
#   sudo systemctl enable mysql
  
#   # Wait for MySQL to start
#   until sudo systemctl is-active --quiet mysql; do
#     echo "Waiting for MySQL to start..."
#     sleep 5
#   done

#   # Change MySQL port to 3307
#   sudo sed -i 's/3306/3307/' /etc/mysql/mysql.conf.d/mysqld.cnf
#   sudo systemctl restart mysql

#   # Wait for MySQL to restart
#   until sudo systemctl is-active --quiet mysql; do
#     echo "Waiting for MySQL to restart..."
#     sleep 5
#   done

#   # Create new MySQL admin user
#   sudo mysql -u root -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'newpass76';"
#   sudo mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';"
#   sudo mysql -u root -e "FLUSH PRIVILEGES;"

#   # Install wget and unzip
#   sudo apt-get install -y wget unzip

#   # Download and unzip the Employees Sample Database
#   wget https://github.com/datacharmer/test_db/archive/refs/heads/master.zip -O test_db.zip
#   unzip test_db.zip
#   cd test_db-master/

#   # Import the Employees sample database into MySQL
#   sudo mysql -u root -P 3307 < employees.sql

#   # Verification: Show the list of databases
#   sudo mysql -u root -P 3307 -e "SHOW DATABASES;"
# EOF



# ## Manual change for Install MySQL Workbench on your local machine and establish a connection to
# # MySQL on port 3307.
# # sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
# # sudo systemctl restart mysql


# Comment below if you want to ran manually from this file directory and uncomment above
#!/bin/bash
# Update system packages
sudo apt-get update -y

# Install MySQL server
sudo apt-get install -y mysql-server

# Start MySQL service
sudo systemctl start mysql
sudo systemctl enable mysql

# Wait for MySQL to start
until sudo systemctl is-active --quiet mysql; do
  echo "Waiting for MySQL to start..."
  sleep 5
done

# Change MySQL port to 3307
sudo sed -i 's/3306/3307/' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql

# Wait for MySQL to restart
until sudo systemctl is-active --quiet mysql; do
  echo "Waiting for MySQL to restart..."
  sleep 5
done

# Create new MySQL admin user
sudo mysql -u root -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'newpass76';"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';"
sudo mysql -u root -e "FLUSH PRIVILEGES;"

# Install wget and unzip
sudo apt-get install -y wget unzip

# Download and unzip the Employees Sample Database
wget https://github.com/datacharmer/test_db/archive/refs/heads/master.zip -O test_db.zip
unzip test_db.zip
cd test_db-master/

# Import the Employees sample database into MySQL
sudo mysql -u root -P 3307 < employees.sql

# Verification: Show the list of databases
sudo mysql -u root -P 3307 -e "SHOW DATABASES;"



## Manual change for Install MySQL Workbench on your local machine and establish a connection to
# MySQL on port 3307.
# sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
# sudo systemctl restart mysql
