Q1)Create Employee table with following constraints:
 Make EmpNo as Primary key.
 Do not allow EmpName, Gender, Salary and Address to have null values.
 Allow Gender to have one of the two values: ‘M’, ‘F’


CREATE TABLE EMPLOYEE(EmpNo NUMBER(3), EmpName VARCHAR(15), Gender VARCHAR(1), Salary NUMBER(7), Address VARCHAR(20), DNo NUMBER(2));
alter table EMPLOYEE modify EmpNo NUMBER(3) PRIMARY KEY;
alter table EMPLOYEE modify EmpName varchar(15) not null;
alter table EMPLOYEE modify Gender varchar(1) not null;
alter table EMPLOYEE modify Salary number(7) not null;
alter table EMPLOYEE modify Address varchar(20) not null;
alter table EMPLOYEE add check(Gender in ('M','F'));

Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPNO                                     NOT NULL NUMBER(3)
 EMPNAME                                   NOT NULL VARCHAR2(15)
 GENDER                                    NOT NULL VARCHAR2(1)
 SALARY                                    NOT NULL NUMBER(7)
 ADDRESS                                   NOT NULL VARCHAR2(20)
 DNO                                                NUMBER(2)



Q2)Create Employee table with following constraints:
 Make EmpNo as Primary key.
 Do not allow EmpName, Gender, Salary and Address to have null values.
 Allow Gender to have one of the two values: ‘M’, ‘F’



CREATE TABLE Department(DeptNo number(3), DeptName varchar(13), Location varchar(10));
alter table Department modify DeptNo number(3) PRIMARY KEY;
alter table Department modify DeptName varchar(13) unique;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DEPTNO                                    NOT NULL NUMBER(3)
 DEPTNAME                                           VARCHAR2(13)
 LOCATION                                           VARCHAR2(10)



Q3)Make DNo of Employee as foreign key which refers to DeptNo of Department



 ALTER TABLE Employee ADD CONSTRAINT fk_employee FOREIGN KEY (DNo) REFERENCES Department(DeptNo);



Q4) Insert few tuples into Employee and Department which satisfies the above constraints



insert into Department values(1,'CSE', 'Manipal');
insert into Department values(2,'ECE', 'Udupi');
insert into Department values(3,'BME', 'Bgp');
insert into Department values(4,'MECHANICAL', 'Kop');
insert into Department values(5,'PETROLEUM', 'Mum');
insert into Employee values(1,'ABC','M',300000, 'Budhwar Peth', 1);
insert into Employee values(2,'BCD','F',360000, 'Mangalwar Peth', 1);
insert into Employee values(3,'SUP','M',460000, 'Shivaji Peth', 2);
insert into Employee values(4,'SSP','M',469000, 'Bapat Camp', 3);
insert into Employee values(5,'BBP','F',969777, 'Ruikar', 4);



Q5)Try to insert few tuples into Employee and Department which violates some of the 
above constraints


insert into Employee values(5,'rrr','F',969777, 'Ruikar', 4)
*
ERROR at line 1:
ORA-00001: unique constraint (DBL46.SYS_C00183492) violated



insert into Department values(5,'ZZZZ', 'FFF')
*
ERROR at line 1:
ORA-00001: unique constraint (DBL46.SYS_C00183679) violated



Q6)Try to insert few tuples into Employee and Department which violates some of the 
above constraints



 SELECT * from Employee;

     EMPNO EMPNAME         G     SALARY ADDRESS                     DNO
---------- --------------- - ---------- -------------------- ----------
         1 ABC             M     300000 Budhwar Peth                  1
         2 BCD             F     360000 Mangalwar Peth                1
         3 SUP             M     460000 Shivaji Peth                  2
         4 SSP             M     469000 Bapat Camp                    3
         5 BBP             F     969777 Ruikar                        4
         6 ppk             M     167777 Ruikar                        4

delete from Department where DeptNo=4
*
ERROR at line 1:
ORA-02292: integrity constraint (DBL46.FK_EMPLOYEE) violated - child record
found



Q7)Modify the foreign key constraint of Employee table such that whenever a department 
tuple is deleted, the employees belonging to that department will also be deleted




alter table EMPLOYEE DROP CONSTRAINT FK_EMPLOYEE;



Q8)Create a named constraint to set the default salary to 10000 and test the constraint by 
 inserting a new record.



insert into Employee values(7,'rys','M',1677, 'Ruor', 4)
*
ERROR at line 1:
ORA-02290: check constraint (DBL46.SALARYCHECK) violated







