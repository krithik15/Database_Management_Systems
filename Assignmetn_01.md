# Assignment 
## Schema Diagram
![image](https://user-images.githubusercontent.com/91019132/228002386-4f4924a7-d8b8-4a90-bb9f-2eeb7833f047.png)

## Create Boat DB
```sql:
CREATE TABLE boat(
	boat_no VARCHAR(10) PRIMARY KEY,
	boat_name VARCHAR(10),
	boat_type VARCHAR(10),
	max_capa NUMBER(10),
	boat_price NUMBER(10),
	boat_color VARCHAR(10)
);
```
## Create Sailors DB
```sql:
CREATE TABLE sailors(
	sailors_no NUMBER(10) PRIMARY KEY,
	sailors_name VARCHAR(10),
	sailors_rating varchar(10),
	sailors_dob VARCHAR(10)
);
```
## Create tourists DB
```sql:
CREATE TABLE tourists(
	tourists_no NUMBER(10) PRIMARY KEY,
	tourists_name VARCHAR(10),
	tourists_address VARCHAR(10),
	tourists_dob VARCHAR(10),
	tourists_phone NUMBER(10)
);
```
## Create Reservation DB
```sql:
CREATE TABLE Reservation(
	boat_no VARCHAR(10),
	sailors_no NUMBER(10),
	date_of_sail DATE,
	tourists_no NUMBER(10) NOT NULL,
	date_of_reserve DATE,
	no_on_per NUMBER(10),
	CONSTRAINT PK_Person PRIMARY KEY (boat_no ,sailors_no, date_of_sail ),
	CONSTRAINT FK_boat_no FOREIGN KEY (boat_no) REFERENCES Boat(boat_no),
	CONSTRAINT FK_sailors_no FOREIGN KEY (sailors_no) REFERENCES Sailors(sailors_no),
	CONSTRAINT FK_tourists_no FOREIGN KEY (tourists_no) REFERENCES Tourists(tourists_no),
	CONSTRAINT C_date CHECK ((date_of_sail - date_of_reserve)<12)
);
```

## insert Data into Table
```sql:
INSERT INTO boat VALUES('B1','boat1','LUX',3,400,'red');
INSERT INTO boat VALUES('B2','boat2','CAR',3,300,'white');
INSERT INTO boat VALUES('B3','boat3','CRU',3,200,'blue');
INSERT INTO boat VALUES('B4','boat4','CRU',3,440,'pink');
INSERT INTO boat VALUES('B5','boat5','LUX',3,480,'orange');

INSERT INTO sailors VALUES(10,'sam','A','2003-02-13');
INSERT INTO sailors VALUES(20,'som','B','2007-12-23');
INSERT INTO sailors VALUES(30,'ram','C','2002-06-03');
INSERT INTO sailors VALUES(40,'ramesh','B','2014-04-16');
INSERT INTO sailors VALUES(50,'suresh','A','2004-09-11');

INSERT INTO tourists VALUES(100,'magesh','chennai','2003-03-13',1234506789);
INSERT INTO tourists VALUES(200,'mega','chennai','2003-03-13',9870654321);
INSERT INTO tourists VALUES(300,'karthik','chennai','2003-03-13',6846207512);
INSERT INTO tourists VALUES(400,'lakshmi','chennai','2003-03-13',9361850374);
INSERT INTO tourists VALUES(500,'rahul','chennai','2003-03-13',1856233425);
INSERT INTO tourists VALUES(600,'raghu','chennai','2003-03-13',8769786794);

```

## insert Reservation DB data

```sql:
INSERT INTO Reservation values('B2',10,to_date('2023-10-12','YYYY-MM-DD'),100,to_date('2023-10-29','YYYY-MM-DD'),3);
INSERT INTO Reservation values('B3',20,to_date('2023-10-12','YYYY-MM-DD'),100,to_date('2023-10-13','YYYY-MM-DD'),3);
```
