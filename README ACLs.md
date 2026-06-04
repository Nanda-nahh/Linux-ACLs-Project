# Linux ACL-Based Company Access Control System

## Overview

This project demonstrates a Linux system administration use case focused on implementing and managing file and directory access using Access Control Lists (ACLs). It simulates a real-world enterprise environment where multiple departments require controlled and secure access to shared system resources.

The project highlights how ACLs extend traditional Linux permission models to provide fine-grained access control without modifying ownership or primary group configurations.

## Objective

The primary objectives of this project are:

* To create a structured multi-department Linux environment
* To implement secure default permissions using standard Linux file permissions
* To configure and manage Access Control Lists (ACLs) for specific user access
* To enable controlled cross-department file access
* To implement default ACL inheritance for newly created files
* To validate and troubleshoot permission behavior in a Linux system

## Environment Structure

The system is organized into the following directory hierarchy:

/company/
├── hr/
│   └── payroll.txt
├── finance/
│   └── report.txt
└── it/
    └── logs.txt

## Users
The following users are created for testing access control:

* mike (IT department user)
* sara (Finance department user)
* john (HR department user)

## Implementation Steps
1. Create Directory Structure
mkdir -p /company/hr /company/finance /company/it
2. Create Users
useradd mike
useradd sara
useradd john
3. Configure Directory Permissions
Each department directory is restricted to its respective group using standard Linux permissions:
chmod 770 /company/hr
chmod 770 /company/finance
chmod 770 /company/it
4. Create Department Files
touch /company/hr/payroll.txt
touch /company/finance/report.txt
touch /company/it/logs.txt

## ACL Configuration
*Grant Cross-Department Access
*Finance user (sara) is granted read-only access to HR payroll file:
 setfacl -m u:sara:r-- /company/hr/payroll.txt
*IT user (mike) is granted read and write access to the finance report file:
 setfacl -m u:mike:rw- /company/finance/report.txt
*Default ACL Inheritance
*To ensure that all new files created inside the HR directory automatically grant read access to sara:
 setfacl -d -m u:sara:r-- /company/hr

## Verification
*ACL configurations can be verified using:
 getfacl /company/hr/payroll.txt
 getfacl /company/finance/report.txt

## Troubleshooting Scenario
- Problem
A user has been granted ACL permissions but is still unable to perform expected operations.
Example Output
user:sara:rwx
mask::r--
- Root Cause
The effective permissions are restricted by the ACL mask, which defines the maximum allowed permissions for named users and groups.
- Resolution
Update the mask to allow the required permissions:
setfacl -m m:rwx /company/hr/payroll.txt

## Key Concepts Covered

* Linux file and directory permissions
* Access Control Lists (ACL)
* Default ACL inheritance
* Permission masking and effective rights
* Cross-user access control without ownership modification
* Real-world system administration troubleshooting

## Commands Used

* mkdir
* useradd
* chmod
* touch
* setfacl
* getfacl

## Author

Nandana Mohan J
