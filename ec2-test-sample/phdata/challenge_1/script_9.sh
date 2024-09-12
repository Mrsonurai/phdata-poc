#!/bin/bash

# Update the public IP each time in env variable..
# Source environment variables
source '$repoLocation/db_credentials.env'

# Query the MySQL database
mysql -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASSWORD -e "
USE employees;
SELECT t.title, AVG(s.salary) AS avg_salary
FROM titles t
JOIN salaries s ON t.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
AND t.to_date = '9999-01-01'
GROUP BY t.title;
"
