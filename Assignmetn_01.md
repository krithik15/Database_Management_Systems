# Create Boat DB
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
# Create Sailors DB
```sql:
CREATE TABLE sailors(
	sailors_no NUMBER(10) PRIMARY KEY,
	sailors_name VARCHAR(10),
	sailors_rating varchar(10),
	sailors_dob VARCHAR(10)
);
```
# Create tourists DB
```sql:
CREATE TABLE tourists(
	tourists_no NUMBER(10) PRIMARY KEY,
	tourists_name VARCHAR(10),
	tourists_address VARCHAR(10),
	tourists_dob VARCHAR(10),
	tourists_phone NUMBER(10)
);
```
# Create Reservation DB
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
