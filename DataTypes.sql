Storing Text
VARCHAR
declare fixed length but more flexible

CHAR
has a fixed length
can be any value from 0 to 255
CHAR is faster for fixed length Text
Example. 
State: MD, CA, NY
Yes/No: Y/N
SEX: M/F 

If declare CHAR(5) and the value is less than the value declared, it will fill up the empty spaces with ' ' (spaces).
Ex. 
CHAR(5) 
value = 'ab'
CHAR(5) --> 'ab   ' --> ab and three spaces
-------------------------------------------------------------------------------
NUMBER 

INT = Whole NUMBER
DECIMAL = numbers that include demicals
DECIMAL has two arguments 
- the first argument is for total numbers of the digit including the decimal places
- the second argument is for numbers of the digit after the decimals or the dot(.)

Ex.
DECIMAL(5,2)
Result:
999.99
5 digits long and 2 digits after the decimals

Ex.
CREATE TABLE items (price DECIMAL(5,2));
INSERT INTO items(price) 
    VALUES
        (7), --> 7.00
        (43632434), --> 999.99
        (34.88), --> 34.88
        (298.999999), --> 299.00 (round up)
        (1.9999); --> 2.00 (round up)

-------------------------------------------------------------------------------
FLOAT and DOUBLE
PROS
Store larger numbers than DECIMAL and use less space

CONS
they are approximate, while DECIMAL is exact


dataType FLOAT memoryNeeded 4 bytes precisionIssues ~7 digits
dataType DOUBLE memoryNeeded 8 bytes precisionIssues  ~15 digits

Ex.
CREATE TABLE floatingNumbers (price FLOAT);

INSERT INTO floatingNumbers(price) VALUES (88.45),(8877.45),(8787673.45);

Result:
/*
+-------+-------+------+-----+---------+-------+
| Field | Type  | Null | Key | Default | Extra |
+-------+-------+------+-----+---------+-------+
| price | float | YES  |     | NULL    |       |
+-------+-------+------+-----+---------+-------+

+---------+
| price   |
+---------+
|   88.45 |
| 8877.45 |
| 8787670 |
+---------+
*/

-------------------------------------------------------------------------------
DATE 
Values with a Date but no TIME
format 
'YYYY-MM-DD'

TIME 
Values with a Time but no DATE
format
'HH:MM:SS'

DATETIME
Values with a DATE and TIME
format
'YYYY-MM-DD HH:MM:SS'

Ex.
CREATE TABLE peopleBD (
    name VARCHAR(100),
    birthDate DATE,
    birthTime TIME,
    birthDateTime DATETIME
);

INSERT INTO peopleBD (name, birthDate, birthTime, birthDateTime)
    VALUES ('Katniss', '2015-10-07', '05:55:08', '2015-10-08 05:55:08'),
    ('Sammy', '2008-05-12', '12:20:48', '2008-05-12 12:20:48'),
    ('Ringo', '2005-12-31', '18:30:45', '2005-12-31 18:30:45');
Result:
/*
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| name          | varchar(100) | YES  |     | NULL    |       |
| birthDate     | date         | YES  |     | NULL    |       |
| birthTime     | time         | YES  |     | NULL    |       |
| birthDateTime | datetime     | YES  |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
+---------+------------+-----------+---------------------+
| name    | birthDate  | birthTime | birthDateTime       |
+---------+------------+-----------+---------------------+
| Katniss | 2015-10-07 | 05:55:08  | 2015-10-08 05:55:08 |
| Sammy   | 2008-05-12 | 12:20:48  | 2008-05-12 12:20:48 |
| Ringo   | 2005-12-31 | 18:30:45  | 2005-12-31 18:30:45 |
+---------+------------+-----------+---------------------+
*/

-------------------------------------------------------------------------------
CURDATE()
gives current Date

CURTIME()
gives current Time

NOW()
gives current Date and Time

Ex.
SELECT CURDATE();
/*
+------------+
| CURDATE()  |
+------------+
| 2018-12-22 |
+------------+
*/

SELECT CURTIME();
/*
+-----------+
| CURTIME() |
+-----------+
| 00:03:08  |
+-----------+
*/

SELECT NOW();
/*
+---------------------+
| NOW()               |
+---------------------+
| 2018-12-22 00:03:14 |
+---------------------+
*/

Ex.
INSERT INTO peopleBD (name, birthDate, birthTime, birthDateTime)
VALUES ('New Born', CURDATE(), CURTIME(), NOW());
Result:
/*
+----------+------------+-----------+---------------------+
| name     | birthDate  | birthTime | birthDateTime       |
+----------+------------+-----------+---------------------+
| Katniss  | 2015-10-07 | 05:55:08  | 2015-10-08 05:55:08 |
| Sammy    | 2008-05-12 | 12:20:48  | 2008-05-12 12:20:48 |
| Ringo    | 2005-12-31 | 18:30:45  | 2005-12-31 18:30:45 |
| New Born | 2018-12-22 | 00:07:04  | 2018-12-22 00:07:04 |
+----------+------------+-----------+---------------------+
*/