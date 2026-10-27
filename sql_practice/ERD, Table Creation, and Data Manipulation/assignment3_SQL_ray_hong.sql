/* 
Name: Ray Hong
Assignment: 3
Date: 10-12-2026
Description: This file shows my understanding of the knowledge
I required in Module 3.
*/

--1 Business Rule

/*
A villager can only live in one village.
A village can have many villagers.
*/

--2 Entity Relationship Diagram (ERD)

/*
Uploaded in the PDF file.
*/


--3 Constraints

/*
NOT NULL CONSTRAINTS:
1. In the Tourist Site table, site_name cannot be null 
because every tourist site has a name. 
2. In the Villager table, first_name and last_name cannot be null 
because every villager must have an identifiable legal name.
3. In the Village table, village_name cannot be null 
because every village must have a name.
CHECK CONSTRAINTS:
1. Age must be greater than or equal to 18 in the Villager table
2. Entry fee must be greater than or equal to zero in the Tourist site table.
3. End date must be greater than or equal to the start date in Visit_Log.
4. Annual_income must be a value greater than or equal to zero.
*/

--4 CREATE

CREATE TABLE Village (
village_id NUMERIC(6,0) NOT NULL,
village_name VARCHAR(30) NOT NULL,
street_address VARCHAR(50),
postal_code VARCHAR(30),
state_province VARCHAR(30),
country VARCHAR(15),
CONSTRAINT village_idPK
PRIMARY KEY (village_id)
);

CREATE TABLE Villager (
villager_id NUMERIC(10,0) NOT NULL,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
age NUMERIC(3,0),
gender CHAR(6),
annual_income NUMERIC(14,0),
village_id NUMERIC(6,0) NOT NULL,
CONSTRAINT villager_idPK
PRIMARY KEY (villager_id),
CONSTRAINT village_idFK
FOREIGN KEY (village_id)
REFERENCES Village(village_id),
CONSTRAINT age_validation
CHECK (age >= 18),
CONSTRAINT annual_income_validation
CHECK (annual_income >= 0)
);

CREATE TABLE Tourists_Site (
site_id NUMERIC(10,0) NOT NULL,
site_name VARCHAR(15) NOT NULL,
city VARCHAR(15) NOT NULL,
country VARCHAR(15) NOT NULL,
entry_fee NUMERIC(6,0),
category VARCHAR(30),
CONSTRAINT site_idPK
PRIMARY KEY (site_id),
CONSTRAINT entry_fee_validation
CHECK (entry_fee >= 0)
);

CREATE TABLE Visit_Log (
log_id NUMERIC(15,0) NOT NULL,
villager_id NUMERIC(10,0) NOT NULL,
site_id NUMERIC(10,0) NOT NULL,
start_date DATE,
end_date DATE,
CONSTRAINT log_idPK
PRIMARY KEY (log_id),
CONSTRAINT villager_idFK
FOREIGN KEY (villager_id)
REFERENCES Villager(villager_id),
CONSTRAINT site_idFK
FOREIGN KEY (site_id)
REFERENCES Tourists_Site(site_id),
CONSTRAINT date_validation
CHECK (end_date >= start_date)
);

--5 ADD

INSERT INTO Village (village_id, village_name, street_address, postal_code, state_province, country)
VALUES
(100001, 'Red River Village', '319 Elgin Ave', 'R3A 0K4', 'Manitoba', 'Canada'),
(100002, 'Attawa', 'Village Atawa, Sector 42', '160036', 'Punjab', 'India'),
(100003, 'Westview', '2800 Sherwood Drive', 'NJ 08801', ' New Jersey', 'US'),
(100004, 'Bled', 'Grajska cesta 61', '4260', 'Upper Carniola', 'Slovenia'),
(100005, 'Wuzhen', 'No. 18 South Shifo Road', '314501', 'Zhejiang', 'China');

INSERT INTO Villager (villager_id, first_name, last_name,age, gender, annual_income, village_id)
VALUES
(1000000001, 'Ray', 'Hong', 25, 'Male', 12000, 100001),
(1000000002, 'Pawan', 'Earnest', 31, 'Male', 100000, 100002),
(1000000003, 'Jiansen', 'Huang', 27, 'Male', 30000, 100003),
(1000000004, 'Jincheng', 'Shi', 26, 'Male', 40000, 100004),
(1000000005, 'Mina', 'Liang', 24, 'Female', 50000, 100005);

INSERT INTO Tourists_Site (site_id, site_name, city, country, entry_fee, category)
VALUES
(2000000001, 'Colosseum', 'Rome', 'Italy', 25, 'Ancient Ruins'),
(2000000002, 'Acropolis', 'Athens', 'Greece', 25, 'Ancient Ruins'),
(2000000003, 'Hagia Sophia', 'Istanbul', 'Turkey', 35, 'Religious Architecture'),
(2000000004, 'Cologne Dome', 'Cologne', 'Germany', 0, 'Religious Architecture'),
(2000000005, 'Sanxingdui', 'Guanghan', 'China', 15, 'Ancient Ruins');

INSERT INTO Visit_Log (log_id, villager_id, site_id, start_date, end_date)
VALUES
(300000000000001, 1000000001, 2000000001, '2026-05-10', '2026-05-15'),
(300000000000002, 1000000002, 2000000002, '2026-06-01', '2026-06-07'),
(300000000000003, 1000000003, 2000000003, '2026-07-12', '2026-07-12'),
(300000000000004, 1000000004, 2000000004, '2026-08-20', '2026-08-25'),
(300000000000005, 1000000005, 2000000005, '2026-09-05', '2026-09-09');

--6 TEST

INSERT INTO Villager (villager_id, first_name, last_name,age, gender, annual_income, village_id)
VALUES (1000000006, 'Tom', 'Holland', 10, 'Male', 12000000, 100001);

INSERT INTO Villager (villager_id, first_name, last_name,age, gender, annual_income, village_id)
VALUES (1000000007, 'Tom', 'Holland', 30, 'Male', -12000000, 100001);

INSERT INTO Tourists_Site (site_id, site_name, city, country, entry_fee, category)
VALUES (2000000006, 'Forbidden City', 'Beijing', 'China', -25, 'Ancient Ruins');

INSERT INTO Visit_Log (log_id, villager_id, site_id, start_date, end_date)
VALUES
(300000000000006, 1000000001, 2000000001, '2026-07-10', '2026-05-15');

--7 UPDATE

UPDATE Villager 
SET age = 99, annual_income = 150000000, village_id = 100003
WHERE villager_id = 1000000001;

UPDATE Tourists_Site 
SET entry_fee = entry_fee + 50
WHERE category = 'Ancient Ruins';

--8 DELETE

DROP TABLE Visit_Log;
DROP TABLE Villager;
DROP TABLE Tourists_Site;
DROP TABLE Village;

COMMIT;