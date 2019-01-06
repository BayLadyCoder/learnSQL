1. What is a good use for CHAR?
States in the USA (MD, VA, NY)

2. Fill in the blanks
CREATE TABLE inventory (
    item_name ________,
    price _________, (price is always less than 1,000,000)
    quantity _______
);

CREATE TABLE inventory (
    item_name VARCHAR(100),
    price DECIMAL(8, 2),  
    quantity INT
);

INSERT INTO inventory (item_name, price, quantity)
    VALUES('cat box', 19.95, 250);

/*
+-----------+-------+----------+
| item_name | price | quantity |
+-----------+-------+----------+
| cat box   | 19.95 |      250 |
+-----------+-------+----------+
*/

3. What is the difference between DATETIME and TIMESTAMP
DATETIME can store a lot more range of time than TIMESTAMP

4. Print out the current time, just the time
Implementation:
SELECT CURTIME();
/*
| CURTIME() |
+-----------+
| 00:00:00  |
+-----------+
*/

5. Print out the current date, just the date
Implementation:
SELECT CURDATE();
/*
+------------+
| CURDATE()  |
+------------+
| 2018-12-28 |
+------------+
*/

6. Print out the current day of the week (the number)
Implementation:
SELECT CURDATE(), DAYOFWEEK(CURDATE());
/*
+------------+----------------------+
| CURDATE()  | DAYOFWEEK(CURDATE()) |
+------------+----------------------+
| 2018-12-28 |                    6 |
+------------+----------------------+
*/

7. Print out the current day of week (the day name)
Implementation:
SELECT CURDATE(), DAYNAME(CURDATE());
/*
+------------+--------------------+
| CURDATE()  | DAYNAME(CURDATE()) |
+------------+--------------------+
| 2018-12-28 | Friday             |
+------------+--------------------+
*/

8. Print out the current day and time using this format (mm/dd/yyyy)
Implementation:
SELECT NOW(), DATE_FORMAT(NOW(), '%m/%d/%Y');
/*
+---------------------+--------------------------------+
| NOW()               | DATE_FORMAT(NOW(), '%m/%d/%Y') |
+---------------------+--------------------------------+
| 2018-12-28 00:04:19 | 12/28/2018                     |
+---------------------+--------------------------------+
*/

9. Print out the current day and time using this format
'January 2nd at 3:15'
'April 1st at 10:18'
Implementation:
SELECT NOW(), DATE_FORMAT(NOW(), '%M %D at %k:%i') as 'date and time';
/*
+---------------------+-----------------------+
| NOW()               | date and time         |
+---------------------+-----------------------+
| 2018-12-28 00:26:29 | December 28th at 0:26 |
+---------------------+-----------------------+
*/

10. Create a tweets TABLE that stores
- the tweet content (text 140 chars)
- A Username (text 20 chars)
- Time it was created

Implementation:
CREATE TABLE tweets (
    content VARCHAR(140),
    username VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO tweets (username, content) 
    VALUES (
        'Katniss', 'Hi, Sammy!'
    );

INSERT INTO tweets (username, content) 
    VALUES (
        'Sammy', 'Go away!'
    );

INSERT INTO tweets (username, content) 
    VALUES (
        'Katniss', 'T~T'
    );

SELECT * FROM tweets;
/*
+------------+----------+---------------------+
| content    | username | created_at          |
+------------+----------+---------------------+
| Hi, Sammy! | Katniss  | 2018-12-28 00:14:21 |
| Go away!   | Sammy    | 2018-12-28 00:14:59 |
| T~T        | Katniss  | 2018-12-28 00:15:31 |
+------------+----------+---------------------+
*/