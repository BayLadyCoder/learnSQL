Learn SQL -MySQL

SQL is the language we use to “talk” to our database
“Find all users”
“Add a  new User with Name Bay”
“Find all users who are 18 years old”


Quick Preview
“Find all users who are 18 or older”
==>> SELECT * FROM Users WHERE Age >= 18;

MySQL is Database Management System
Relational Databases
(MySQL, SQLite, PostgreSQL, Oracle, Many others) ==> All Use SQL

Two Takeaways
Once you learn SQL, it’s pretty easy to switch to another DB that uses SQL.
What makes database (DBMS) unique are the features they offer, not the language.


How to use mySQL
Turn on the server in System Preference -> mySQL -> Start Server
In Terminal, paste --> export PATH=$PATH:/usr/local/mysql/bin
Then type --> mysql -u root -p
Then type password that I created for mySQL


in Terminal, to close out of mySQL press control+d


In mySQL (inside Terminal)

SHOW databases
show databases; //showing all databases in the DB server

CREATE a Databases
CREATE DATABASE <name>;  //creating a new database
Ex. CREATE DATABASE soap_store; //Can use underscore
Ex. CREATE DATABASE DogApp; //or CamalCase


DELETE a Database
DROP DATABASE <name>;
Ex. DROP DATABASE soap_store;
Ex. DROP DATABASE DogApp;


USE a database
USE <database name>;
Ex. USE DogApp;

SELECT database
SELECT database();  //Checking which database is used right now


Data Types (for now)
Numeric Types : INT (a whole number with max value of 4294967295 <-- UNSIGNED INT MAXIMUM)
StringTypes: VARCHAR (a Variable-Length String between 1 and 255 characters)

VARCHAR(100) <<-- must specify the maximum length, in this case is 100


Basic Data Types Challenge 
Draw a Tweets Table
- A username (Max 15 chars)
- The Tweet Content (max 150 chars)
- Numbers of favorites

  VARCHAR(15) VARCHAR(150)       INT
  Username  /   Content  /   Favorites
  'Katniss' /   'Hello'  /      18
  'Sammy'   /   'YO!'	/       22


CREATE TABLE
CREATE TABLE tablename
( 
  column_name data_type,
  column_name data_type
);

Ex. 
CREATE TABLE cats 
(
    name VARCHAR(100),
    age INT
);


SHOW
SHOW TABLES;
SHOW COLUMNS FROM <tablename>;  OR --> DESC <tablename>; //do the same thing in this context

Ex. SHOW COLUMNS FROM cats;
Ex. DESC cats;  // Describe...

DELETE TABLES
DROP TABLE <tablename>; 

Ex. DROP TABLE cats;  //deleting this table permanently!!



Create a Pastries Table Challenge
- it should include 2 columns: name and quantity.
- Name is 50 characters max.
- Inspect your table/columns in the Terminal.
- Delete your table.

Implementation:

CREATE TABLE pastries (
    name VARCHAR(50),
    quantity INT
);

DESC pastries;
DROP TABLE pastries;

-------------------------------------------------------------------------------

INSERT
Adding data to Tables

Ex.
INSERT INTO cats(name, age)
VALUES ('Jetson', 7);

Ex.
INSERT INTO cats (age, name)
VALUES (7, "Jetson");


MULTIPLE INSERT
Ex. 
INSERT INTO cats (name, age)
VALUES ('Cat1', 10),
        ('Cat2', 12),
        ('Cat3', 5);

SELECT
SELECT * FROM cats;  //To view all the data in the table

INSERT Challenge
1. Create a people table
2. Columns 
--> first_name (20 char limit)
--> last_name (20 char limit)
--> age
3. Insert first person --> Tina Belcher 13 (First, Last, Age)
4. Insert second person --> Belcher Bob 42 (Last, First, Age)
5. Multiple insert
--> Linda Belcher 45 (First, Last, Age)
--> Phillip Frond 38 (First, Last, Age)
--> Calvin Fischoeder 70 (First, Last, Age)

Implementation:

CREAT TABLE people (
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT
);

DESC people;

INSERT INTO people (first_name, last_name, age)
VALUES ('Tina', 'Belcher', 13);

INSERT INTO people (last_name, first_name, age)
VALUES ('Belcher', 'Bob', 42);

INSERT INTO people (first_name, last_name, age)
VALUES ('Linda', 'Belcher', 45),
        ('Phillip', 'Frond', 38),
        ('Calvin', 'Fischoeder', 70);

SELECT * FROM people;

DROP TABLE people;

SHOW TABLES;
-------------------------------------------------------------------------------

WARNINGS
We get warnings...
- When we input too many characters (more than the character limit that we declare)
- When we input wrong datatype Ex. input String in INT datatype

It will be like...
Ex. Query OK, 1 row affected, 1 warning(0.00 sec)

Then we can view the warnings by use this command
SHOW WARNINGS;
(This command will describe the warning problems)
*** only show when you use this command right after you get the warning. ***

-------------------------------------------------------------------------------
NULL == "The Value is not Known", it does NOT mean ZERO.

Permit to be NULL is a default value for all column headers.

So, if we insert just name but not insert a value for age the value for age will become NULL
Ex. INSERT INTO cats (name) VALUES ('Bob');
OR, Null for all.
Ex. INSERT INTO cats () VALUES ();

Checking default values in the table
DESC cats; 

TO PREVENT NULL VALUES
use NOT NULL when creating/declaring a table.

Ex. CREATE TABLE cats2
    (
        name VARCHAR(100) NOT NULL,
        age INT NOT NULL
    );

So, when we insert values incompletely...
if the empty value is an INT, it will set to a default value which is 0.
if the empty value is a VARCHAR, it will set to the default value which is '' (nothing).

-------------------------------------------------------------------------------

To Set Default values 1 (NULL is available to use as a value)
CREATE TABLE cats3
(
    name VARCHAR(100) DEFAULT 'unnamed',
    age INT DEFAULT 99
);

Ex.
INSERT INTO cats3 (name, age)
VALUES (NULL, 3); // Null is allowed in this case


To Set Default values 2 (NULL is NOT available to use as a value)
CREATE TABLE cats3
(
    name VARCHAR(100) NOT NULL DEFAULT 'unnamed',
    age INT NOT NULL DEFAULT 99
);

INSERT INTO cats3 (name, age)
VALUES (NULL, 3); // Null is NOT allowed in this case, it will give an error

-------------------------------------------------------------------------------

PRIMARY KEY
A Unique Identifier // cannot have duplicated value in the PRIMARY KEY
Usually use for ID or Username

Ex.
CREATE TABLE unique_cats (
    cat_id INT NOT NULL,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);

Ex.
INSERT INTO unique_cats (cat_id, name, age)
VALUES (1, "Lou", 8);

INSERT INTO unique_cats (cat_id, name, age)
VALUES (1, "Sam", 10); // Duplicated value for cat_id(Primary key), it will give you an error.


AUTO INCREMENT numbers for PRIMARY KEY
So, we don't have to manually type each ID when entry new data

Ex.
CREATE TABLE unique_cats2 (
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);

Ex.  // Automatically creating ID number 1, 2, 3, ...
INSERT INTO unique_cats2 (name, age)
VALUES ("Sam", 10);


-------------------------------------------------------------------------------
Exercise

Define an Employees Table, with the following fields:
1. id - number (automatically increments), mandatory, primary key
2. last_name - text, mandatory
3. first_name - text, mandatory
4. middle_name - text, not mandatory
5. age - number, mandatory
6.current_status - text, mandatory, defaults to 'employed'

Implementation:

CREATE TABLE employees (
    id INT NOT NULL AUTO_INCREMENT, // OR --> id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    age INT NOT NULL,
    current_status VARCHAR(20) NOT NULL DEFAULT 'employed',
    PRIMARY KEY (id)
    );

DESC employees;

