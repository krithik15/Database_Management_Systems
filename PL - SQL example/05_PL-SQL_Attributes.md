# PL/SQL Attributes
PL/SQL variables and cursors have attributes, which are properties that let you reference the
datatype and structure of an item without repeating its definition. A percent sign (%) serves as the
attribute indicator.

```sql
CREATE TABLE employees (
   employee_id   NUMBER,
   last_name     VARCHAR2(50),
   salary        NUMBER
);


INSERT INTO employees VALUES (100, 'Smith', 5000);
INSERT INTO employees VALUES (200, 'Muthu', 9000);
INSERT INTO employees VALUES (300, 'Sam', 5500);
INSERT INTO employees VALUES (400, 'Anbu', 6000);
INSERT INTO employees VALUES (500, 'Rahul', 7520);
```
## %TYPE
The %TYPE attribute provides the data type of a variable.
```sql

DECLARE
   emp_name employees.last_name%TYPE; -- %TYPE allow you to find a data type of the column.
   emp_salary employees.salary%TYPE; -- as previous section we used "x NUMBER(3)" similarly hear 
										-- "emp_salary employees.salary%TYPE" emp_salary is variable name column name employees.salary ""%TYPE" return the type of the column.
BEGIN
   SELECT last_name, salary INTO emp_name, emp_salary FROM employees WHERE employee_id = 400;

   dbms_output.put_line('Employee Name: ' || emp_name);
   dbms_output.put_line('Employee Salary: ' || emp_salary);
END;
```



