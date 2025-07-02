create database bhushan;
drop database bhushan;

-- create database -- bro fundamental var kaam kar 
-- khup pudh jashil -- more focus on micro micro things imporove knowledge

CREATE DATABASE company;

drop table employee;
CREATE TABLE employee(
 	employee_id SERIAL 	PRIMARY KEY , 
	name VARCHAR(100) NOT NULL, 
	position VARCHAR(50), 
	DEPARTMENT VARCHAR(50), 
	hire_date DATE, 
	salary NUMERIC(10,2)
);

   SELECT * FROM employee;

 INSERT INTO employee(name, position , department, hire_date, salary)
 VALUES( 'BHUSHAN TILE','CEO','MANAGEMENT', '2022-06-23',1000000.00),
 ('Tanvi Barve','MD', 'Management','2022-06-23',900000.00),
 ('siddhesh ugale','manager','Managment','2023-07-2',900000.00);

-- INSERT INTO EMPLOYEE VALUES (21, "BHUSHAN" ,'CEO' , 'Management', 21-09-2003 ,100000.00);



-- how to update colomn name 
ALTER TABLE employee 
RENAME COLUMN postion TO position ;




-- Truncate  command 


Truncate table employee; 
-- hya mule serail no resart hota 
-- apn jar donda trucate kel tar serila no update hoat nahi  khalchya command mule toh issue resolve hoto 
Truncate table employee RESTART IDENTITY;



-- how to delete rows and columns from table 

