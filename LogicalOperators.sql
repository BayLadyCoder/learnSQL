The Power of Logical Operators

NOT EQUAL !=
SELECT everything except something(!=)

Ex.
SELECT title, released_year FROM books
WHERE released_year != 2017;
/*
+-----------------------------------------------------+---------------+
| title                                               | released_year |
+-----------------------------------------------------+---------------+
| The Namesake                                        |          2003 |
| Norse Mythology                                     |          2016 |
| American Gods                                       |          2001 |
| Interpreter of Maladies                             |          1996 |
| A Hologram for the King: A Novel                    |          2012 |
| The Circle                                          |          2013 |
| The Amazing Adventures of Kavalier & Clay           |          2000 |
| Just Kids                                           |          2010 |
| A Heartbreaking Work of Staggering Genius           |          2001 |
| Coraline                                            |          2003 |
| What We Talk About When We Talk About Love: Stories |          1981 |
| Where I'm Calling From: Selected Stories            |          1989 |
| White Noise                                         |          1985 |
| Cannery Row                                         |          1945 |
| Oblivion: Stories                                   |          2004 |
| Consider the Lobster                                |          2005 |
| 10% Happier                                         |          2014 |
| fake_book                                           |          2001 |
+-----------------------------------------------------+---------------+
*/

Ex.
SELECT title, author_lname FROM books
WHERE author_lname != 'Harris';
/*
+-----------------------------------------------------+----------------+
| title                                               | author_lname   |
+-----------------------------------------------------+----------------+
| The Namesake                                        | Lahiri         |
| Norse Mythology                                     | Gaiman         |
| American Gods                                       | Gaiman         |
| Interpreter of Maladies                             | Lahiri         |
| A Hologram for the King: A Novel                    | Eggers         |
| The Circle                                          | Eggers         |
| The Amazing Adventures of Kavalier & Clay           | Chabon         |
| Just Kids                                           | Smith          |
| A Heartbreaking Work of Staggering Genius           | Eggers         |
| Coraline                                            | Gaiman         |
| What We Talk About When We Talk About Love: Stories | Carver         |
| Where I'm Calling From: Selected Stories            | Carver         |
| White Noise                                         | DeLillo        |
| Cannery Row                                         | Steinbeck      |
| Oblivion: Stories                                   | Foster Wallace |
| Consider the Lobster                                | Foster Wallace |
| Lincoln In The Bardo                                | Saunders       |
+-----------------------------------------------------+----------------+
*/

-------------------------------------------------------------------------------
NOT LIKE
match all pattern except thisn patter(NOT LIKE)

Ex. -- Select books with titles that don't start with 'W'
SELECT title FROM books
WHERE title NOT LIKE 'W%';
/*
+-------------------------------------------+
| title                                     |
+-------------------------------------------+
| The Namesake                              |
| Norse Mythology                           |
| American Gods                             |
| Interpreter of Maladies                   |
| A Hologram for the King: A Novel          |
| The Circle                                |
| The Amazing Adventures of Kavalier & Clay |
| Just Kids                                 |
| A Heartbreaking Work of Staggering Genius |
| Coraline                                  |
| Cannery Row                               |
| Oblivion: Stories                         |
| Consider the Lobster                      |
| 10% Happier                               |
| fake_book                                 |
| Lincoln In The Bardo                      |
+-------------------------------------------+
*/
-------------------------------------------------------------------------------
GREATER THAN >

Ex. -- Select books that released after year 2000
SELECT title, released_year FROM books
WHERE released_year > 2000;
/*
+-------------------------------------------+---------------+
| title                                     | released_year |
+-------------------------------------------+---------------+
| The Namesake                              |          2003 |
| Norse Mythology                           |          2016 |
| American Gods                             |          2001 |
| A Hologram for the King: A Novel          |          2012 |
| The Circle                                |          2013 |
| Just Kids                                 |          2010 |
| A Heartbreaking Work of Staggering Genius |          2001 |
| Coraline                                  |          2003 |
| Oblivion: Stories                         |          2004 |
| Consider the Lobster                      |          2005 |
| 10% Happier                               |          2014 |
| fake_book                                 |          2001 |
| Lincoln In The Bardo                      |          2017 |
+-------------------------------------------+---------------+
*/

Ex. -- Return 1 = True
SELECT 99 > 1;
/*
+--------+
| 99 > 1 |
+--------+
|      1 |
+--------+
*/

Ex. -- Return 0 = False
SELECT 1 > 99;
/*
+--------+
| 1 > 99 |
+--------+
|      0 |
+--------+
*/

GREATER THAN OR EQUAL TO >=

Ex.
SELECT title, stock_quantity FROM books
WHERE stock_quantity >= 100;
/*
+-------------------------------------------+----------------+
| title                                     | stock_quantity |
+-------------------------------------------+----------------+
| A Hologram for the King: A Novel          |            154 |
| A Heartbreaking Work of Staggering Genius |            104 |
| Coraline                                  |            100 |
| Oblivion: Stories                         |            172 |
| fake_book                                 |            287 |
| Lincoln In The Bardo                      |           1000 |
+-------------------------------------------+----------------+
*/

Exercise:
SELECT 100 > 5; --True
SELECT -15 > 15; --False
SELECT 9 > -10; --True
SELECT 1 > 1; --False
SELECT 'a' > 'b'; --False // 'a' < 'b' is True // a comes before b
SELECT 'A' > 'a'; --False // 'A' = 'a' is True // case doesn't matter in SQL

-------------------------------------------------------------------------------
LESS THAN <

Ex. -- Select books released BEFORE the year 2000
SELECT title, released_year FROM books
WHERE released_year < 2000;
/*
+-----------------------------------------------------+---------------+
| title                                               | released_year |
+-----------------------------------------------------+---------------+
| Interpreter of Maladies                             |          1996 |
| What We Talk About When We Talk About Love: Stories |          1981 |
| Where I'm Calling From: Selected Stories            |          1989 |
| White Noise                                         |          1985 |
| Cannery Row                                         |          1945 |
+-----------------------------------------------------+---------------+
*/

LESS THAN OR EQUAL TO <=

Ex. -- year 2000 is inclusive
SELECT title, released_year FROM books
WHERE released_year <= 2000;
/*
+-----------------------------------------------------+---------------+
| title                                               | released_year |
+-----------------------------------------------------+---------------+
| Interpreter of Maladies                             |          1996 |
| The Amazing Adventures of Kavalier & Clay           |          2000 |
| What We Talk About When We Talk About Love: Stories |          1981 |
| Where I'm Calling From: Selected Stories            |          1989 |
| White Noise                                         |          1985 |
| Cannery Row                                         |          1945 |
+-----------------------------------------------------+---------------+
*/

Exercise:
SELECT 3 < -10; --False
SELECT -10 < -9; --True
SELECT 42 <= 42; --True
SELECT 'h' < 'p'; --True
SELECT 'Q' <= 'q'; --True
-------------------------------------------------------------------------------

AND &&
Only return when every condition is True
Can either use the word 'AND' or use '&&'

Ex. -- AND
SELECT title, author_lname, released_year FROM books
WHERE author_lname = 'Eggers' AND
released_year > 2000;
/*
+-------------------------------------------+--------------+---------------+
| title                                     | author_lname | released_year |
+-------------------------------------------+--------------+---------------+
| A Hologram for the King: A Novel          | Eggers       |          2012 |
| The Circle                                | Eggers       |          2013 |
| A Heartbreaking Work of Staggering Genius | Eggers       |          2001 |
+-------------------------------------------+--------------+---------------+
*/

Ex. -- &&
SELECT title, author_lname, released_year FROM books
WHERE author_lname = 'Eggers' &&
released_year > 2010;
/*
+----------------------------------+--------------+---------------+
| title                            | author_lname | released_year |
+----------------------------------+--------------+---------------+
| A Hologram for the King: A Novel | Eggers       |          2012 |
| The Circle                       | Eggers       |          2013 |
+----------------------------------+--------------+---------------+
*/

Exercise:
SELECT 1 < 5 && 7 = 9; --False / 7 is not equal to 9
SELECT -10 > -20 && 0 <= 0; --True / both conditions are true
SELECT -40 <= -0 && 10 > 40; --False / 10 is not greater than 40
SELECT 54 <= 54 && 'a' = 'A'; --True / both conditions are true

We can use AND && with more than TWO conditions
Ex.
SELECT title, author_lname, released_year FROM books
WHERE author_lname = 'Eggers' &&
released_year > 2010 AND
title LIKE '%novel%';
/*
+----------------------------------+--------------+---------------+
| title                            | author_lname | released_year |
+----------------------------------+--------------+---------------+
| A Hologram for the King: A Novel | Eggers       |          2012 |
+----------------------------------+--------------+---------------+
*/

-------------------------------------------------------------------------------
OR ||
at least ONE condition must be True

Ex. -- get all books by 'Eggers' (including year before 2010) and all books that release after 2010
SELECT title, author_lname, released_year FROM books
WHERE author_lname = 'Eggers' ||
released_year > 2010;
/*
+-------------------------------------------+--------------+---------------+
| title                                     | author_lname | released_year |
+-------------------------------------------+--------------+---------------+
| Norse Mythology                           | Gaiman       |          2016 |
| A Hologram for the King: A Novel          | Eggers       |          2012 |
| The Circle                                | Eggers       |          2013 |
| A Heartbreaking Work of Staggering Genius | Eggers       |          2001 |
| 10% Happier                               | Harris       |          2014 |
| Lincoln In The Bardo                      | Saunders     |          2017 |
+-------------------------------------------+--------------+---------------+
*/

Ex. -- use 'OR' and '||' with more than TWO conditions
SELECT title, author_lname, stock_quantity, released_year FROM books
WHERE author_lname = 'Eggers' ||
released_year > 2010 OR
stock_quantity > 100;
/*
+-------------------------------------------+----------------+----------------+---------------+
| title                                     | author_lname   | stock_quantity | released_year |
+-------------------------------------------+----------------+----------------+---------------+
| Norse Mythology                           | Gaiman         |             43 |          2016 |
| A Hologram for the King: A Novel          | Eggers         |            154 |          2012 |
| The Circle                                | Eggers         |             26 |          2013 |
| A Heartbreaking Work of Staggering Genius | Eggers         |            104 |          2001 |
| Oblivion: Stories                         | Foster Wallace |            172 |          2004 |
| 10% Happier                               | Harris         |             29 |          2014 |
| fake_book                                 | Harris         |            287 |          2001 |
| Lincoln In The Bardo                      | Saunders       |           1000 |          2017 |
+-------------------------------------------+----------------+----------------+---------------+
*/

Exercise:
SELECT 40 <= 100 || -2 > 0; --True / 40 <= 100 is true
SELECT 10 > 5 || 5 = 5; --True / both conditions are true
SELECT 'a' = 5 || 3000 > 2000; --True / 3000 > 2000 is true
SELECT 'a' = 'b' || 3000 < 200; --False / both conditions are false
-------------------------------------------------------------------------------

BETWEEN

format:
BETWEEN x AND y;

Ex. -- Select books published between 2004-2015 (2004 and 2015 are inclusive)
SELECT title, released_year FROM books
WHERE released_year BETWEEN 2004 AND 2015;
/*
+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| A Hologram for the King: A Novel |          2012 |
| The Circle                       |          2013 |
| Just Kids                        |          2010 |
| Oblivion: Stories                |          2004 |
| Consider the Lobster             |          2005 |
| 10% Happier                      |          2014 |
+----------------------------------+---------------+
*/

-------------------------------------------------------------------------------

NOT BETWEEN

Ex. -- Select books that are not published between 2004-2015 (2004 and 2015 are inclusive)
SELECT title, released_year FROM books
WHERE released_year NOT BETWEEN 2004 AND 2015;
/*
+-----------------------------------------------------+---------------+
| title                                               | released_year |
+-----------------------------------------------------+---------------+
| The Namesake                                        |          2003 |
| Norse Mythology                                     |          2016 |
| American Gods                                       |          2001 |
| Interpreter of Maladies                             |          1996 |
| The Amazing Adventures of Kavalier & Clay           |          2000 |
| A Heartbreaking Work of Staggering Genius           |          2001 |
| Coraline                                            |          2003 |
| What We Talk About When We Talk About Love: Stories |          1981 |
| Where I'm Calling From: Selected Stories            |          1989 |
| White Noise                                         |          1985 |
| Cannery Row                                         |          1945 |
| fake_book                                           |          2001 |
| Lincoln In The Bardo                                |          2017 |
+-----------------------------------------------------+---------------+
*/
-------------------------------------------------------------------------------
CAST
Convert from one datatype to another

-- Casting String to DATE
Ex.
SELECT CAST('2018-01-31' AS DATETIME);
/*
+--------------------------------+
| CAST('2018-01-31' AS DATETIME) |
+--------------------------------+
| 2018-01-31 00:00:00            |
+--------------------------------+
*/

-- Comparing DATE or TIME values
Ex.
SELECT * FROM peoplebd
WHERE birthDATETIME BETWEEN 
CAST('2008-01-01' AS DATETIME) AND 
CAST('2019-01-01' AS DATETIME);
/*
+----------+------------+-----------+---------------------+
| name     | birthDate  | birthTime | birthDateTime       |
+----------+------------+-----------+---------------------+
| Katniss  | 2015-10-07 | 05:55:08  | 2015-10-08 05:55:08 |
| Sammy    | 2008-05-12 | 12:20:48  | 2008-05-12 12:20:48 |
| New Born | 2018-12-22 | 00:07:04  | 2018-12-22 00:07:04 |
+----------+------------+-----------+---------------------+
*/
-------------------------------------------------------------------------------
IN 

-- Select books written by 'Carver' or 'Lahiri' or 'Smith'
Ex.
SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
/*
+-----------------------------------------------------+--------------+
| title                                               | author_lname |
+-----------------------------------------------------+--------------+
| The Namesake                                        | Lahiri       |
| Interpreter of Maladies                             | Lahiri       |
| Just Kids                                           | Smith        |
| What We Talk About When We Talk About Love: Stories | Carver       |
| Where I'm Calling From: Selected Stories            | Carver       |
+-----------------------------------------------------+--------------+
*/

Ex.
SELECT title, released_year FROM books
WHERE released_year IN (2017, 1985);
/*
+----------------------+---------------+
| title                | released_year |
+----------------------+---------------+
| White Noise          |          1985 |
| Lincoln In The Bardo |          2017 |
+----------------------+---------------+
*/

-------------------------------------------------------------------------------
NOT IN

-- Select books that are not publish in these years (2000, 2002, 2004, 2008, ...)
Ex.1 -- OK way to do if you have specific years that don't want to include
SELECT title, released_year FROM books
WHERE released_year >= 2000 &&
released_year NOT IN (2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016, 2018);
/*
+-------------------------------------------+---------------+
| title                                     | released_year |
+-------------------------------------------+---------------+
| The Namesake                              |          2003 |
| American Gods                             |          2001 |
| The Circle                                |          2013 |
| A Heartbreaking Work of Staggering Genius |          2001 |
| Coraline                                  |          2003 |
| Consider the Lobster                      |          2005 |
| fake_book                                 |          2001 |
| Lincoln In The Bardo                      |          2017 |
+-------------------------------------------+---------------+
*/

MODULUS %
give the remainder after division

-- Select books that are not publish in even number years (2000, 2002, 2004, 2008, ...)
Ex. -- Better way to not include the even number year
SELECT title, released_year FROM books
WHERE released_year >= 2000 &&
released_year % 2 != 0 ORDER BY released_year;
/*
+-------------------------------------------+---------------+
| title                                     | released_year |
+-------------------------------------------+---------------+
| American Gods                             |          2001 |
| A Heartbreaking Work of Staggering Genius |          2001 |
| fake_book                                 |          2001 |
| The Namesake                              |          2003 |
| Coraline                                  |          2003 |
| Consider the Lobster                      |          2005 |
| The Circle                                |          2013 |
| Lincoln In The Bardo                      |          2017 |
+-------------------------------------------+---------------+
*/

-------------------------------------------------------------------------------
CASE STATEMENTS

Ex.
SELECT title, released_year,
    CASE
        WHEN released_year >= 2000 THEN 'Modern Lit'
        ELSE '20th Century Lit'
    END AS Genre
FROM books;
/*
+-----------------------------------------------------+---------------+------------------+
| title                                               | released_year | Genre            |
+-----------------------------------------------------+---------------+------------------+
| The Namesake                                        |          2003 | Modern Lit       |
| Norse Mythology                                     |          2016 | Modern Lit       |
| American Gods                                       |          2001 | Modern Lit       |
| Interpreter of Maladies                             |          1996 | 20th Century Lit |
| A Hologram for the King: A Novel                    |          2012 | Modern Lit       |
| The Circle                                          |          2013 | Modern Lit       |
| The Amazing Adventures of Kavalier & Clay           |          2000 | Modern Lit       |
| Just Kids                                           |          2010 | Modern Lit       |
| A Heartbreaking Work of Staggering Genius           |          2001 | Modern Lit       |
| Coraline                                            |          2003 | Modern Lit       |
| What We Talk About When We Talk About Love: Stories |          1981 | 20th Century Lit |
| Where I'm Calling From: Selected Stories            |          1989 | 20th Century Lit |
| White Noise                                         |          1985 | 20th Century Lit |
| Cannery Row                                         |          1945 | 20th Century Lit |
| Oblivion: Stories                                   |          2004 | Modern Lit       |
| Consider the Lobster                                |          2005 | Modern Lit       |
| 10% Happier                                         |          2014 | Modern Lit       |
| fake_book                                           |          2001 | Modern Lit       |
| Lincoln In The Bardo                                |          2017 | Modern Lit       |
+-----------------------------------------------------+---------------+------------------+
*/

Ex.
SELECT title, stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        WHEN stock_quantity BETWEEN 100 AND 150 THEN '***'
        ELSE '****'
    END AS STOCK
FROM books;
/*
+-----------------------------------------------------+----------------+-------+
| title                                               | stock_quantity | STOCK |
+-----------------------------------------------------+----------------+-------+
| The Namesake                                        |             32 | *     |
| Norse Mythology                                     |             43 | *     |
| American Gods                                       |             12 | *     |
| Interpreter of Maladies                             |             97 | **    |
| A Hologram for the King: A Novel                    |            154 | ****  |
| The Circle                                          |             26 | *     |
| The Amazing Adventures of Kavalier & Clay           |             68 | **    |
| Just Kids                                           |             55 | **    |
| A Heartbreaking Work of Staggering Genius           |            104 | ***   |
| Coraline                                            |            100 | **    |
| What We Talk About When We Talk About Love: Stories |             23 | *     |
| Where I'm Calling From: Selected Stories            |             12 | *     |
| White Noise                                         |             49 | *     |
| Cannery Row                                         |             95 | **    |
| Oblivion: Stories                                   |            172 | ****  |
| Consider the Lobster                                |             92 | **    |
| 10% Happier                                         |             29 | *     |
| fake_book                                           |            287 | ****  |
| Lincoln In The Bardo                                |           1000 | ****  |
+-----------------------------------------------------+----------------+-------+
*/

Ex.

Ex. -- A shorter version
SELECT title, stock_quantity,
    CASE
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        WHEN stock_quantity <= 150 THEN '***'
        ELSE '****'
    END AS STOCK
FROM books;
/*
+-----------------------------------------------------+----------------+-------+
| title                                               | stock_quantity | STOCK |
+-----------------------------------------------------+----------------+-------+
| The Namesake                                        |             32 | *     |
| Norse Mythology                                     |             43 | *     |
| American Gods                                       |             12 | *     |
| Interpreter of Maladies                             |             97 | **    |
| A Hologram for the King: A Novel                    |            154 | ****  |
| The Circle                                          |             26 | *     |
| The Amazing Adventures of Kavalier & Clay           |             68 | **    |
| Just Kids                                           |             55 | **    |
| A Heartbreaking Work of Staggering Genius           |            104 | ***   |
| Coraline                                            |            100 | **    |
| What We Talk About When We Talk About Love: Stories |             23 | *     |
| Where I'm Calling From: Selected Stories            |             12 | *     |
| White Noise                                         |             49 | *     |
| Cannery Row                                         |             95 | **    |
| Oblivion: Stories                                   |            172 | ****  |
| Consider the Lobster                                |             92 | **    |
| 10% Happier                                         |             29 | *     |
| fake_book                                           |            287 | ****  |
| Lincoln In The Bardo                                |           1000 | ****  |
+-----------------------------------------------------+----------------+-------+
*/