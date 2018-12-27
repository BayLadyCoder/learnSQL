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
-------------------------------------------------------------------------------
Formatting DATES
mySQL DateTime Functions in mySQL reference website
-- https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_to-days

DAY() = Extract the date part of a date or datetime expression
Ex.
SELECT name, birthDate, DAY(birthDate) FROM peopleBD;
/*
+----------+------------+----------------+
| name     | birthDate  | DAY(birthDate) |
+----------+------------+----------------+
| Katniss  | 2015-10-07 |              7 |
| Sammy    | 2008-05-12 |             12 |
| Ringo    | 2005-12-31 |             31 |
| New Born | 2018-12-22 |             22 |
+----------+------------+----------------+
*/

DAYNAME() = Return the name of the weekday
Ex.
SELECT name, birthDate, DAYNAME(birthDate) FROM peopleBD;
/*
+----------+------------+--------------------+
| name     | birthDate  | DAYNAME(birthDate) |
+----------+------------+--------------------+
| Katniss  | 2015-10-07 | Wednesday          |
| Sammy    | 2008-05-12 | Monday             |
| Ringo    | 2005-12-31 | Saturday           |
| New Born | 2018-12-22 | Saturday           |
+----------+------------+--------------------+
*/

DAYOFYEAR() = Return the day of the year (1-366)
Ex.
SELECT name, birthDate, DAYOFYEAR(birthDate) FROM peopleBD;
/*
+----------+------------+----------------------+
| name     | birthDate  | DAYOFYEAR(birthDate) |
+----------+------------+----------------------+
| Katniss  | 2015-10-07 |                  280 |
| Sammy    | 2008-05-12 |                  133 |
| Ringo    | 2005-12-31 |                  365 |
| New Born | 2018-12-22 |                  356 |
+----------+------------+----------------------+
*/

MONTHNAME() = Return the name of the month
Ex.
SELECT name, birthDate, MONTHNAME(birthDate) FROM peopleBD;
/*
+----------+------------+----------------------+
| name     | birthDate  | MONTHNAME(birthDate) |
+----------+------------+----------------------+
| Katniss  | 2015-10-07 | October              |
| Sammy    | 2008-05-12 | May                  |
| Ringo    | 2005-12-31 | December             |
| New Born | 2018-12-22 | December             |
+----------+------------+----------------------+
*/

-------------------------------------------------------------------------------
DATE_FORMAT() 
Format date as specified
-- https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_date-format

--> also have TIME_FORMAT()
-- https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_time-format

Ex.
mysql> SELECT DATE_FORMAT('2009-10-04 22:23:00', '%W %M %Y');
        --> 'Sunday October 2009'
mysql> SELECT DATE_FORMAT('2007-10-04 22:23:00', '%H:%i:%s');
        --> '22:23:00'
mysql> SELECT DATE_FORMAT('1900-10-04 22:23:00',
    ->                 '%D %y %a %d %m %b %j');
        --> '4th 00 Thu 04 10 Oct 277'
mysql> SELECT DATE_FORMAT('1997-10-04 22:23:00',
    ->                 '%H %k %I %r %T %S %w');
        --> '22 22 10 10:23:00 PM 22:23:00 00 6'
mysql> SELECT DATE_FORMAT('1999-01-01', '%X %V');
        --> '1998 52'
mysql> SELECT DATE_FORMAT('2006-06-00', '%d');
        --> '00'

Ex.
SELECT DATE_FORMAT(birthDate, '%W %M %Y') FROM peopleBD;
/*
+------------------------------------+
| DATE_FORMAT(birthDate, '%W %M %Y') |
+------------------------------------+
| Wednesday October 2015             |
| Monday May 2008                    |
| Saturday December 2005             |
| Saturday December 2018             |
+------------------------------------+
*/

Ex.
SELECT DATE_FORMAT(birthDate, '%W-%e-%M-%Y') FROM peopleBD;
/*
+---------------------------------------+
| DATE_FORMAT(birthDate, '%W-%e-%M-%Y') |
+---------------------------------------+
| Wednesday-7-October-2015              |
| Monday-12-May-2008                    |
| Saturday-31-December-2005             |
| Saturday-22-December-2018             |
+---------------------------------------+
*/

Ex.
SELECT DATE_FORMAT(birthDate, 'Was born on %W, %M %e, %Y') FROM peopleBD;
/*
+-----------------------------------------------------+
| DATE_FORMAT(birthDate, 'Was born on %W, %M %e, %Y') |
+-----------------------------------------------------+
| Was born on Wednesday, October 7, 2015              |
| Was born on Monday, May 12, 2008                    |
| Was born on Saturday, December 31, 2005             |
| Was born on Saturday, December 22, 2018             |
+-----------------------------------------------------+
*/

Ex.
SELECT DATE_FORMAT(birthDate, '%m/%d/%Y') FROM peopleBD;
/*
+------------------------------------+
| DATE_FORMAT(birthDate, '%m/%d/%Y') |
+------------------------------------+
| 10/07/2015                         |
| 05/12/2008                         |
| 12/31/2005                         |
| 12/22/2018                         |
+------------------------------------+
*/

-------------------------------------------------------------------------------
DATE MATH
How long ago?
--> https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html


DATEDIFF()
Ex.
SELECT name, birthDate, DATEDIFF(NOW(), birthDate) from peopleBD;
/*
+----------+------------+----------------------------+
| name     | birthDate  | DATEDIFF(NOW(), birthDate) |
+----------+------------+----------------------------+
| Katniss  | 2015-10-07 |                       1177 |
| Sammy    | 2008-05-12 |                       3881 |
| Ringo    | 2005-12-31 |                       4744 |
| New Born | 2018-12-22 |                          5 |
+----------+------------+----------------------------+
*/

DATE_ADD()
--> Add dates or time
Ex.
SELECT birthDateTime, DATE_ADD(birthDateTime, INTERVAL 1 MONTH) FROM peopleBD;
/*
+---------------------+-------------------------------------------+
| birthDateTime       | DATE_ADD(birthDateTime, INTERVAL 1 MONTH) |
+---------------------+-------------------------------------------+
| 2015-10-08 05:55:08 | 2015-11-08 05:55:08                       |
| 2008-05-12 12:20:48 | 2008-06-12 12:20:48                       |
| 2005-12-31 18:30:45 | 2006-01-31 18:30:45                       |
| 2018-12-22 00:07:04 | 2019-01-22 00:07:04                       |
+---------------------+-------------------------------------------+
*/

Ex.
SELECT birthDateTime, DATE_ADD(birthDateTime, INTERVAL 10 SECOND) FROM peopleBD;
/*
+---------------------+---------------------------------------------+
| birthDateTime       | DATE_ADD(birthDateTime, INTERVAL 10 SECOND) |
+---------------------+---------------------------------------------+
| 2015-10-08 05:55:08 | 2015-10-08 05:55:18                         |
| 2008-05-12 12:20:48 | 2008-05-12 12:20:58                         |
| 2005-12-31 18:30:45 | 2005-12-31 18:30:55                         |
| 2018-12-22 00:07:04 | 2018-12-22 00:07:14                         |
+---------------------+---------------------------------------------+
*/

DATE with + OR -

ADD +
Ex.
SELECT birthDateTime, birthDateTime + INTERVAL 3 MONTH FROM peopleBD;
/*
+---------------------+----------------------------------+
| birthDateTime       | birthDateTime + INTERVAL 3 MONTH |
+---------------------+----------------------------------+
| 2015-10-08 05:55:08 | 2016-01-08 05:55:08              |
| 2008-05-12 12:20:48 | 2008-08-12 12:20:48              |
| 2005-12-31 18:30:45 | 2006-03-31 18:30:45              |
| 2018-12-22 00:07:04 | 2019-03-22 00:07:04              |
+---------------------+----------------------------------+
*/

SUBTRACT -
Ex.
SELECT birthDateTime, birthDateTime - INTERVAL 5 MINUTE FROM peopleBD;
/*
+---------------------+-----------------------------------+
| birthDateTime       | birthDateTime - INTERVAL 5 MINUTE |
+---------------------+-----------------------------------+
| 2015-10-08 05:55:08 | 2015-10-08 05:50:08               |
| 2008-05-12 12:20:48 | 2008-05-12 12:15:48               |
| 2005-12-31 18:30:45 | 2005-12-31 18:25:45               |
| 2018-12-22 00:07:04 | 2018-12-22 00:02:04               |
+---------------------+-----------------------------------+
*/

MULTIPLE + + - + -
Ex.
SELECT birthDateTime, birthDateTime + INTERVAL 5 MONTH + INTERVAL 15 MINUTE  as '+ +' FROM peopleBD;
/*
+---------------------+---------------------+
| birthDateTime       | + +                 |
+---------------------+---------------------+
| 2015-10-08 05:55:08 | 2016-03-08 06:10:08 |
| 2008-05-12 12:20:48 | 2008-10-12 12:35:48 |
| 2005-12-31 18:30:45 | 2006-05-31 18:45:45 |
| 2018-12-22 00:07:04 | 2019-05-22 00:22:04 |
+---------------------+---------------------+
*/

Ex.
SELECT birthDateTime, birthDateTime - INTERVAL 12 MONTH + INTERVAL 30 MINUTE  as '- +' FROM peopleBD;
/*
+---------------------+---------------------+
| birthDateTime       | - +                 |
+---------------------+---------------------+
| 2015-10-08 05:55:08 | 2014-10-08 06:25:08 |
| 2008-05-12 12:20:48 | 2007-05-12 12:50:48 |
| 2005-12-31 18:30:45 | 2004-12-31 19:00:45 |
| 2018-12-22 00:07:04 | 2017-12-22 00:37:04 |
+---------------------+---------------------+
*/

-------------------------------------------------------------------------------
-- TIMESTAMP

-- DATETIME VS TIMESTAMP
-- They both store DATE and TIME

-- DATETIME support range is '1000-01-01 00:00:00' to '9999-12-31 23:59:59' use more space in the memory
-- TIMESTAMP support range is '1970-01-01 00:00:01' to '2038-01-19 03-14-07' use less space in the  memory

-- Ex.
-- CREATE TABLE comments (
--         content VARCHAR(100),
--         created_at TIMESTAMP DEFAULT NOW()
-- );

-- INSERT INTO comments (content) VALUES('lol what a funny article');
-- INSERT INTO comments (content) VALUES('Hahaha');
-- INSERT INTO comments (content) VALUES('Hello World!');

-- SELECT * FROM comments;
-- /*
-- +--------------------------+---------------------+
-- | content                  | created_at          |
-- +--------------------------+---------------------+
-- | lol what a funny article | 2018-12-27 16:04:37 |
-- | Hahaha                   | 2018-12-27 16:05:15 |
-- | Hello World!             | 2018-12-27 16:05:30 |
-- +--------------------------+---------------------+
-- */
