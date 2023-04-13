REM: Create data base.
CREATE TABLE continents(
    ContId NUMBER(3) CONSTRAINT continents_PK_ContId PRIMARY KEY,
    Continent VARCHAR(25)
);

CREATE TABLE countries(
    CountryId NUMBER(3) CONSTRAINT countrues_PK_CountryId PRIMARY KEY,
    CountryName VARCHAR(25),
    Continent NUMBER(3),
    CONSTRAINT countries_FK_Continent FOREIGN KEY (Continent) REFERENCES continents(contId)
);

CREATE TABLE carmakers(
    makerId NUMBER(3) CONSTRAINT carname_PK_makerId PRIMARY KEY,
    Maker NUMBER(3),
    MakeDescription VARCHAR(50),
    FullName VARCHAR(50),
    Country NUMBER(3),
    CONSTRAINT carname_FK_Country FOREIGN KEY (Country) REFERENCES countries(CountryId)
);
car-details

            Id : unique identifier of the car make (see car-names.Id)
           MPG : milage per gallon
     Cylinders : number of cylinders
        Edispl : engine displacement volume in cubic inches
    Horsepower : power of the engine in horsepowers
        Weight : weight of the car in lbs
    Accelerate : time to accelerate from 0 to 60mph in seconds
          Year : year the car was made


CREATE TABLE Modeldetils(
    
);

CREATE TABLE carname(
    makerId NUMBER(3) CONSTRAINT carname_PK_makerId PRIMARY KEY,
    Model NUMBER(3),
    MakeDescription VARCHAR(50),
    CONSTRAINT carname_FK_MakeDescription FOREIGN KEY (MakeDescription) REFERENCES carname(MakeDescription)
);





















