
SPOOL D:\DBMS-lab\Assignment_01\Assignment_02.sql;
REM: Drop all TABLES
DROP TABLE Reservation;
DROP TABLE boat;
DROP TABLE sailors;
DROP TABLE tourists;

REM: CREATE TABLE WITH ALL CONSTRAINT
CREATE TABLE boat(
    boat_id VARCHAR(10) PRIMARY KEY CHECK(boat_id LIKE 'B%'), -- - Ensure that boat id begins with B (3.1)
    boat_name VARCHAR(10),
    boat_type VARCHAR(10) CHECK(boat_type in ('LUX','CAR','CRU')), -- - The type of boat can be LUX for Luxurious, CAR for Caravan, CRU for Cruiser (2)
    max_capa NUMBER(10),
    boat_price NUMBER(10),
    boat_color VARCHAR(10)
);

CREATE TABLE sailors(
    sailors_id VARCHAR(10) PRIMARY KEY CHECK(sailors_id LIKE 'S%'), -- - Ensure that sailors id begins with S (3.2)
    sailors_name VARCHAR(10),
    sailors_rating varchar(10) CHECK(sailors_rating in ('A','B','C','D')), -- - The rating for a sailor could be A, B or C. (4)
    sailors_dob DATE
);

CREATE TABLE tourists(
    tourists_id VARCHAR(10) PRIMARY KEY CHECK(tourists_id LIKE 'T%'), -- - Ensure that tourists id begins with T (3.3)
    tourists_name CHAR(10),
    tourists_address VARCHAR(10),
    tourists_dob DATE,
    tourists_phone NUMBER(10) UNIQUE-- - The phone number of the tourists should differ from each other.(5)
);


CREATE TABLE Reservation(
    boat_id VARCHAR(10),
    sailors_id VARCHAR(10),
    date_of_sail DATE,
    tourists_id VARCHAR(10) NOT NULL,
    date_of_reserve DATE,
    no_of_per NUMBER(10),
    CONSTRAINT PK_Person PRIMARY KEY (boat_id ,sailors_id, date_of_sail ),
    CONSTRAINT FK_boat_id FOREIGN KEY (boat_id) REFERENCES boat(boat_id),
    CONSTRAINT FK_sailors_id FOREIGN KEY (sailors_id) REFERENCES sailors(sailors_id),
    CONSTRAINT FK_tourists_id FOREIGN KEY (tourists_id) REFERENCES tourists(tourists_id),
    CONSTRAINT C_date CHECK ((date_of_sail - date_of_reserve) > 12) -- -  Advance booking can be done ahead of 12 days (6)
);

-- - tourists
INSERT INTO tourists VALUES('T202','mega','chennai','02-JAN-2003',9870654321);
INSERT INTO tourists VALUES('T303','karthik','chennai','13-APR-2003',9870654322);

-- - Reservation
INSERT INTO Reservation VALUES('B3','S100','15-JUN-2023', 'T202', '01-MAY-2023', 3);
INSERT INTO Reservation VALUES('B3','S100','22-JAN-2023', 'T202', '08-JAN-2023', 3);

-- - boat 
INSERT INTO boat VALUES('B1','boat1','LUX',3,400,'red');
INSERT INTO boat VALUES('B3','boat3','CRU',3,200,'blue');

-- - sailor
INSERT INTO sailors VALUES('S100','Raman','A','01-OCT-80', 27000);
INSERT INTO sailors VALUES('S200','Krishna','B','04-JUL-78',21000);
INSERT INTO sailors VALUES('S300','Gokul','C','05-FEB-75',16000);
INSERT INTO sailors VALUES('S400','Ravi','D','06-APR-78',10000);
INSERT INTO sailors VALUES('S500','James','A','07-MAY-78',25000);
INSERT INTO sailors VALUES('S600','Vasanth','B','20-MAY-87',20600);
INSERT INTO sailors VALUES('S700','Rahul','C','13-DEC-85',15500);
INSERT INTO sailors VALUES('S800','Vijay',NULL,'13-DEC-90',5000);
SELECT * FROM sailors;

REM: Display the name and salary of sailors earning more than $10000. (2)
SELECT sailors_name,salary FROM sailors WHERE salary>10000;

REM: Display the unique ratings of sailor from the SAILOR relation (3)
SELECT DISTINCT sailors_rating FROM sailors; 

REM:  Display sailor name, hike salary by 10% and label the columns as Sailor Name and New Salary respectively. (4)
UPDATE sailors 
SET salary = salary + (salary * 10/100);
SELECT sailors_name, salary FROM sailors;

REM: List sailor id, name, salary of all sailor(s) who was not rated yet (5)
SELECT sailors_id, sailors_name, salary FROM sailors WHERE sailors_rating IS NULL;

REM:  Show all data for sailors whose name starts with R and born before the year 1985(6)
SELECT * FROM sailors WHERE sailors_name LIKE 'R%' AND sailors_dob < '01-JAN-1985';

REM:  Display name, rating, salary of all sailors whose rating is A or B and whose salary is not equal to $21000 and $25000. (7)
SELECT sailors_name,sailors_rating,salary FROM sailors WHERE (sailors_rating = 'A' OR sailors_rating = 'B') AND (salary != 21000 AND salary != 25000);

REM:  Modify the query in 2 to display the name and salary of all sailors whose salary is not in the range of $10000 to $16000.(8)
SELECT sailors_name,salary FROM sailors WHERE salary NOT BETWEEN 10000 AND 16000;

REM: . List the sailors who was born between Jan 1985 and Dec 1985.(9)
SELECT * FROM sailors WHERE sailors_dob BETWEEN '01-Jan-1985' AND '31-DEC-1985';

-- - error -- -
REM:  Show the name of sailors together with their age in number of years and months [E.g., 18 Yrs 4 Months].(10)
SELECT SYSDATE FROM dual;
SELECT sailors_name,
       TRUNC(MONTHS_BETWEEN(SYSDATE, sailors_dob) / 12) AS year,
       MOD(TRUNC(MONTHS_BETWEEN(SYSDATE, sailors_dob)), 12) AS months
FROM sailors;

REM: Display the sailor id and name of a sailor whose name has second letter a. Sort the result by name in descending order.(11)
SELECT sailors_name FROM sailors WHERE sailors_name LIKE '_a%' ORDER BY sailors_name;

REM: Show those sailors whose name starts with J, K, or R(12)
SELECT * FROM sailors WHERE sailors_name LIKE 'R%' OR sailors_name LIKE 'J%' OR sailors_name LIKE 'K%';

REM:  How many sailors have a name that ends with letter l.(13)
SELECT * FROM sailors WHERE sailors_name LIKE '%l';

REM: Display highest, lowest, sum and average salary earned by the sailors in rating-wise. Label the columns as Max, Min, Sum, and Avg respectively. Round your results to the nearest whole number. Sort your result by alphabetical order of rating. (14)
SELECT MAX(salary) AS MAX_SALARY,
    MIN(salary) AS MIN_SALARY,
    SUM(salary) AS SUM_SALARY,
    AVG(salary) AS AVG_SALARY
FROM sailors;
SELECT ROUND(MAX(salary), -3) AS ROUND_MAX,
    ROUND(MIN(salary), -3) AS ROUND_MIN,
    ROUND(SUM(salary), -3) AS ROUND_SUM,
    ROUND(AVG(salary), -3) AS ROUND_AVG
FROM sailors;
SELECT * FROM sailors ORDER BY sailors_rating DESC;

REM: Display the total salary for each rating. Exclude the ratings where the total salary is less than $25000.(15)
SELECT sailors_rating, COUNT(sailors_rating),SUM(salary) as total
FROM sailors 
GROUP BY sailors_rating
HAVING SUM(salary) >25000 ;

REM: Display the rating and salary of the lowest paid sailor in each rating. Exclude anyone whose rating is not known. Exclude any groups where the minimum salary is $15000 or less. Sort the output in descending order of salary. (16)








