# Example AWS terraform

Contains an example for deploy compute and data store infrastructure.
Many of the ideas were borrowed from the book Terraform Up & Running by Yevgeniy Brikman.

### Assumptions

Assuming application will be a web application with traditional 3 tier architecture, web, application, and database.
Application will be running in one region, in one availability zone.

### Design decisions
For simplicity decided to use ec2 + RDS for mysql.
Decided to split the components as much as possible into modules so code can be reused. This will make it easier to deploy different environments. For example, to deploy a development, staging, and production environment you could use the same modules for each environment but will need to pass in different variables.

The webserver is the main module and calls other modules, except database. Database module will need to called individually. 
