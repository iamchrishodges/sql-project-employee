# sql-project-employee

The following projects demonstrates 3 queries against a relational database.

# Contents
* SQL_Samplesql.sql : Location of all three queries. Each query is separated with a comment explaining their usage.
* bak
# Prompt 

## Problem Spec
### Model
Model the following problem using a relational schema to track a company's employees and projects using DDL or a schema diagram:
An employee has a name, a social security number, and a manager (except the highest employee in the org chart, who will have no manager).
Projects have a name.
Each project will have zero or many employees assigned to it. An employee can be assigned to many projects.

### Queries
Write queries against your schema to retrieve the following:
* Return a list of employees' names, and their manager's names (except the highest level employee who will have no manager - his or her manager should show "NULL" or empty).
* Return a list of projects, and how many people are assigned to them
* Return the most senior person on the org chart assigned to a given project
