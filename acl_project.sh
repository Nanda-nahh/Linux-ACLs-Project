#!/bin/bash

# Create groups
sudo groupadd hrgroup
sudo groupadd financegroup
sudo groupadd itgroup

# Create users
sudo useradd -m -G hrgroup john
sudo useradd -m -G financegroup sara
sudo useradd -m -G itgroup mike

# Create directory structure
sudo mkdir -p /company/hr
sudo mkdir -p /company/finance
sudo mkdir -p /company/it

# Set ownership
sudo chown root:hrgroup /company/hr
sudo chown root:financegroup /company/finance
sudo chown root:itgroup /company/it

# Set permissions
sudo chmod 770 /company/hr
sudo chmod 770 /company/finance
sudo chmod 770 /company/it

# Create department files
sudo touch /company/hr/payroll.txt
sudo touch /company/finance/report.txt
sudo touch /company/it/logs.txt

# Configure ACLs

# Sara gets read access to payroll file
sudo setfacl -m u:sara:r-- /company/hr/payroll.txt

# Mike gets read/write access to finance report
sudo setfacl -m u:mike:rw- /company/finance/report.txt

# Default ACL for new files in HR directory
sudo setfacl -d -m u:sara:r-- /company/hr

# Verify ACLs
getfacl /company/hr/payroll.txt
getfacl /company/finance/report.txt



