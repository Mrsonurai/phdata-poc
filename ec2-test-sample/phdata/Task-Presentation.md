<!-- BEGIN_TF_DOCS -->
# Task Requirements


## Challenge 1: Cloud Instance and MySQL Setup

## Asked

1. **Spin up a Micro Instance**  
   Choose your preferred cloud provider and create a Micro Instance.

2. **Enable SSH Access**  
   Restrict SSH access to your current Public IP Address.

3. **Install MySQL**  
   Install MySQL on the EC2 instance.

4. **Change MySQL Port**  
   Modify the MySQL port to `3307`.

5. **Create Admin Account**  
   Set up a new admin account in MySQL.

6. **Setup Employees Sample Database**  
   Install and configure the Employees Sample Database in MySQL.

7. **Install MySQL Workbench**  
   Install MySQL Workbench on your local machine and establish a connection to MySQL on port `3307`.

8. **Query Employee Data Set**  
   Perform queries on the Employee Data set.

9. **Create a Shell Script**  
   Write a shell script to connect to the MySQL database on port `3307` and query one of the employee data sets.

10. **Create a Repository**  
    Create a repository in your cloud DevOps environment and move your script code to the repository.

11. **Create a Pipeline**  
    Develop a pipeline that runs your script upon merging into the master or main branch.
    - Store the MySQL credentials in AWS Secrets Manager or Azure Key Vault.
    - In the pipeline, use the MySQL credentials obtained from the Vault.


## Challenge 2: Python Program

Write a Python program that prints the numbers from `1` to `100`. For multiples of three, print `"Black"` instead of the number. For multiples of five, print `"Red"`. For numbers that are multiples of both three and five, print `"BlackRed"`.

# Solution

## Challenge 1 Solution
1. **Spin up a Micro Instance**  
   Choose your preferred cloud provider and create a Micro Instance.
- Created a IaaC using the terraform and implemented module, workspace, state logic.


2. **Enable SSH Access**  
   Restrict SSH access to your current Public IP Address.
- Made the change in security group in terraform to whitelist the current public IP.


3. **Install MySQL**  
   Install MySQL on the EC2 instance.
- Created a shell script to install MySQL on EC2. So after creation we can run ```sh script_3_4.sh```

4. **Change MySQL Port**  
   Modify the MySQL port to `3307`.
- Used the same script to change the port to 3307 ```sh script_3_4.sh``` Line- 25-27

5. **Create Admin Account**  
   Set up a new admin account in MySQL.
- Used the same script to create a new user (admin) and grant all the PRIVILEGES ```sh script_3_4.sh``` Line- 35-38

6. **Setup Employees Sample Database**  
   Install and configure the Employees Sample Database in MySQL.
- Used the same script to install wget and fetch the dataset, unzip and go to the directory and load into our MySQL server ```sh script_3_4.sh``` Line- 40-52

7. **Install MySQL Workbench**  
   Install MySQL Workbench on your local machine and establish a connection to MySQL on port `3307`.
   
   - For this to work, you need to edit a file on the EC2 instance first. Uncomment the port in the config file and change the `bind-address` to use `0.0.0.0` instead of `localhost`. After making these changes, restart the MySQL service.

   ```bash
   # Manual change for Install MySQL Workbench on your local machine and establish a connection to
   # MySQL on port 3307.
   sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
   sudo systemctl restart mysql


8. **Query Employee Data Set**  
   Perform queries on the Employee Data set.
- After exec into the DB we can use some queries for conformation as the database is working as expected. Written some sample query as ``` query_for_task_8.txt ```

9. **Create a Shell Script**  
   Write a shell script to connect to the MySQL database on port `3307` and query one of the employee data sets.
- Create a script to connect to mysql database where passed all the sesitive data as env variable and queries one sample to get the average salary of each title. Script: ``` sh script_9.sh ```

10. **Create a Repository**  
    Create a repository in your cloud DevOps environment and move your script code to the repository.
- Created a repo in BitBucket with name ``` ec2-test-sample ``` and moved the code to the repo. Also created one public repo in personal github account and uploaded the code there.



11. **Create a Pipeline**  
    Develop a pipeline that runs your script upon merging into the master or main branch.
    - Store the MySQL credentials in AWS Secrets Manager or Azure Key Vault.
    - In the pipeline, use the MySQL credentials obtained from the Vault.
   - For solution of this, we created a BB CI pipeline in main directory ``` bitbucket-pipeline.yml ``` this will do all the steps where it stores the mysql creds in secret manager of aws and now while executing the sheel script to the EC2 it will use it and deploy the script ``` script_3_4.sh ```. 