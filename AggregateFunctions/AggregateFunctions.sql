COUNT 
count something from the database

Ex. --> How many books are in the database?
SELECT COUNT(*) FROM books;
Result:
/*
+----------+
| COUNT(*) |
+----------+
|       19 |
+----------+
*/

Ex. --> How many author_fname in this database?
SELECT COUNT(author_fname) FROM books;
Result:
/*
+---------------------+
| COUNT(author_fname) |
+---------------------+
|                  19 |
+---------------------+
*/

Ex. --> How many author_fname in this database? DISTINCT
SELECT COUNT(DISTINCT author_fname) FROM books;
Result:
/*
+------------------------------+
| COUNT(DISTINCT author_fname) |
+------------------------------+
|                           12 | *** no duplicated value
+------------------------------+
*/

--------------------------------------------------------------------

Ex. --> How many author_fname in this database? DISTINCT
SELECT COUNT(DISTINCT author_lname) FROM books;
Result:
--> *** two authors have same lastname but it counts to one in this case (not correct way to find DISTINCT authors)
/*
+------------------------------+
| COUNT(DISTINCT author_lname) |
+------------------------------+
|                           11 | 
+------------------------------+
*/

Here is the correct way to find DISTINCT authors by their firstname and lastname
Ex.
SELECT COUNT(DISTINCT author_fname, author_lname) FROM books;
Result: --> Now we have 12 different authors
/*
+--------------------------------------------+
| COUNT(DISTINCT author_fname, author_lname) |
+--------------------------------------------+
|                                         12 |
+--------------------------------------------+
*/


--------------------------------------------------------------------
COUNT with WHERE and LIKE

How many titles that contain "the"?
Ex.
SELECT COUNT(title) FROM books WHERE title Like '%the%';
OR
SELECT COUNT(*) FROM books WHERE title Like '%the%';
Result:
/*
+--------------+
| COUNT(title) |
+--------------+
|            6 |
+--------------+

+----------+
| COUNT(*) |
+----------+
|        6 |
+----------+
*/

--------------------------------------------------------------------
GROUP BY 
summarizes or aggregates identical data into single rows.

--> Count books on each group by authors' lastnames
Ex.
SELECT author_lname, COUNT(*)
FROM books GROUP BY author_lname;
REsult:
/*
+----------------+----------+
| author_lname   | COUNT(*) |
+----------------+----------+
| Lahiri         |        2 |
| Gaiman         |        3 |
| Eggers         |        3 |
| Chabon         |        1 |
| Smith          |        1 |
| Carver         |        2 |
| DeLillo        |        1 |
| Steinbeck      |        1 |
| Foster Wallace |        2 |
| Harris         |        2 |
| Saunders       |        1 |
+----------------+----------+
*/

Ex.
SELECT author_fname, author_lname, COUNT(*)
FROM books GROUP BY author_lname, author_fname;
Result:
/*
+--------------+----------------+----------+
| author_fname | author_lname   | COUNT(*) |
+--------------+----------------+----------+
| Jhumpa       | Lahiri         |        2 |
| Neil         | Gaiman         |        3 |
| Dave         | Eggers         |        3 |
| Michael      | Chabon         |        1 |
| Patti        | Smith          |        1 |
| Raymond      | Carver         |        2 |
| Don          | DeLillo        |        1 |
| John         | Steinbeck      |        1 |
| David        | Foster Wallace |        2 |
| Dan          | Harris         |        1 |*** duplucated lastname
| Freida       | Harris         |        1 |*** duplucated lastname
| George       | Saunders       |        1 |
+--------------+----------------+----------+
*/

Ex. 
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;
Result:
/*
+---------------+----------+
| released_year | COUNT(*) |
+---------------+----------+
|          2003 |        2 |
|          2016 |        1 |
|          2001 |        3 |
|          1996 |        1 |
|          2012 |        1 |
|          2013 |        1 |
|          2000 |        1 |
|          2010 |        1 |
|          1981 |        1 |
|          1989 |        1 |
|          1985 |        1 |
|          1945 |        1 |
|          2004 |        1 |
|          2005 |        1 |
|          2014 |        1 |
|          2017 |        1 |
+---------------+----------+
*/

--------------------------------------------------------------------
GROUP BY with CONCAT()

Ex.
SELECT
    CONCAT('In ', released_year , ' ', COUNT(*), ' book(s) released')
    AS year 
    FROM books
GROUP BY released_year;
Result:
/*
| year                       |
+----------------------------+
| In 2003 2 book(s) released |
| In 2016 1 book(s) released |
| In 2001 3 book(s) released |
| In 1996 1 book(s) released |
| In 2012 1 book(s) released |
| In 2013 1 book(s) released |
| In 2000 1 book(s) released |
| In 2010 1 book(s) released |
| In 1981 1 book(s) released |
| In 1989 1 book(s) released |
| In 1985 1 book(s) released |
| In 1945 1 book(s) released |
| In 2004 1 book(s) released |
| In 2005 1 book(s) released |
| In 2014 1 book(s) released |
| In 2017 1 book(s) released |
+----------------------------+
*/

--------------------------------------------------------------------
MIN and MAX
Find minimum and maximum values on the table or in the GROUP(GROUP BY)

without GROUP BY
find the minimum released_year on the table
Ex.
SELECT MIN(released_year) FROM books;
Result:
/*
+--------------------+
| MIN(released_year) |
+--------------------+
|               1945 |
+--------------------+
*/

Ex.
Ex.
SELECT MAX(pages) FROM books;
Result:
/*
+------------+
| MAX(pages) |
+------------+
|        634 |
+------------+
*/

--------------------------------------------------------------------
PROBLEM WHEN WE TRY TO PRINT TITLE with MIN() or MAX()
Ex.
SELECT MAX(pages), title, FROM books;
Result:
/*
It will give errors or show the wrong result
*/

Solution (using sub query)
SELECT title, pages FROM books
WHERE pages = (SELECT MAX(pages) FROM books);
Result:
/*
+-------------------------------------------+-------+
| title                                     | pages |
+-------------------------------------------+-------+
| The Amazing Adventures of Kavalier & Clay |   634 |
+-------------------------------------------+-------+
*/

OR (using ORDER BY)
Ex.
SELECT title, pages FROM books
ORDER BY pages DESC LIMIT 1; // FOR MAX
Result:
/*
+-------------------------------------------+-------+
| title                                     | pages |
+-------------------------------------------+-------+
| The Amazing Adventures of Kavalier & Clay |   634 |
+-------------------------------------------+-------+
*/

Ex.
SELECT title, pages FROM books
ORDER BY pages ASC LIMIT 1; // FOR MIN
Result:
/*
+-----------------------------------------------------+-------+
| title                                               | pages |
+-----------------------------------------------------+-------+
| What We Talk About When We Talk About Love: Stories |   176 |
+-----------------------------------------------------+-------+
*/

--------------------------------------------------------------------
MIN() and MAX() with GROUP BY

Find the year each author published their first book
Ex.
SELECT author_fname, author_lname, MIN(released_year) FROM books GROUP BY author_lname, author_fname;
Result:
/*
+--------------+----------------+--------------------+
| author_fname | author_lname   | MIN(released_year) |
+--------------+----------------+--------------------+
| Jhumpa       | Lahiri         |               1996 |
| Neil         | Gaiman         |               2001 |
| Dave         | Eggers         |               2001 |
| Michael      | Chabon         |               2000 |
| Patti        | Smith          |               2010 |
| Raymond      | Carver         |               1981 |
| Don          | DeLillo        |               1985 |
| John         | Steinbeck      |               1945 |
| David        | Foster Wallace |               2004 |
| Dan          | Harris         |               2014 |
| Freida       | Harris         |               2001 |
| George       | Saunders       |               2017 |
+--------------+----------------+--------------------+
*/

Find the longest page count for each author
Ex.
SELECT author_fname, author_lname, MAX(pages) FROM books
    GROUP BY author_lname, author_fname;
Result:
/*
+--------------+----------------+------------+
| author_fname | author_lname   | MAX(pages) |
+--------------+----------------+------------+
| Jhumpa       | Lahiri         |        291 |
| Neil         | Gaiman         |        465 |
| Dave         | Eggers         |        504 |
| Michael      | Chabon         |        634 |
| Patti        | Smith          |        304 |
| Raymond      | Carver         |        526 |
| Don          | DeLillo        |        320 |
| John         | Steinbeck      |        181 |
| David        | Foster Wallace |        343 |
| Dan          | Harris         |        256 |
| Freida       | Harris         |        428 |
| George       | Saunders       |        367 |
+--------------+----------------+------------+
*/

Clean up version
Ex.
SELECT
    CONCAT(author_fname, ' ', author_lname) AS author,
    MAX(pages) AS 'longest book'
    FROM books
    GROUP BY author_lname,
             author_fname;

--------------------------------------------------------------------
SUM()
Adds things together

Sum all pages in the entire database
Ex.
SELECT SUM(pages) FROM books;
Result:
/*
+------------+
| SUM(pages) |
+------------+
|       6623 |
+------------+
*/

Sum all released years in the entire database
Ex.
SELECT SUM(released_year) FROM books;
Result:
/*
+--------------------+
| SUM(released_year) |
+--------------------+
|              37996 |
+--------------------+
*/

--------------------------------------------------------------------
SUM() with GROUP BY

Sum all the pages each author has written
Ex.
SELECT author_fname, author_lname, SUM(pages) FROM books
    GROUP BY author_lname, author_fname;
Result:
/*
+--------------+----------------+------------+
| author_fname | author_lname   | SUM(pages) |
+--------------+----------------+------------+
| Jhumpa       | Lahiri         |        489 |
| Neil         | Gaiman         |        977 |
| Dave         | Eggers         |       1293 |
| Michael      | Chabon         |        634 |
| Patti        | Smith          |        304 |
| Raymond      | Carver         |        702 |
| Don          | DeLillo        |        320 |
| John         | Steinbeck      |        181 |
| David        | Foster Wallace |        672 |
| Dan          | Harris         |        256 |
| Freida       | Harris         |        428 |
| George       | Saunders       |        367 |
+--------------+----------------+------------+
*/

--------------------------------------------------------------------
AVG()
Find Average

Calculate the average released_year across all books
Ex.
SELECT AVG(released_year) FROM books;
Result:
/*
+--------------------+
| AVG(released_year) |
+--------------------+
|          1999.7895 |
+--------------------+
*/
--------------------------------------------------------------------
AVG() with GROUP BY

Calculate the average stock quantity for books released in the same year
Ex.
SELECT released_year, AVG(stock_quantity) FROM books
    GROUP BY released_year;
Result:
/*
+---------------+---------------------+
| released_year | AVG(stock_quantity) |
+---------------+---------------------+
|          2003 |             66.0000 |
|          2016 |             43.0000 |
|          2001 |            134.3333 |
|          1996 |             97.0000 |
|          2012 |            154.0000 |
|          2013 |             26.0000 |
|          2000 |             68.0000 |
|          2010 |             55.0000 |
|          1981 |             23.0000 |
|          1989 |             12.0000 |
|          1985 |             49.0000 |
|          1945 |             95.0000 |
|          2004 |            172.0000 |
|          2005 |             92.0000 |
|          2014 |             29.0000 |
|          2017 |           1000.0000 |
+---------------+---------------------+
*/

Find average pages for each author
Ex.
SELECT author_fname, author_lname, AVG(pages) FROM books
    GROUP BY author_lname, author_fname;
Result:
/*
+--------------+----------------+------------+
| author_fname | author_lname   | AVG(pages) |
+--------------+----------------+------------+
| Jhumpa       | Lahiri         |   244.5000 |
| Neil         | Gaiman         |   325.6667 |
| Dave         | Eggers         |   431.0000 |
| Michael      | Chabon         |   634.0000 |
| Patti        | Smith          |   304.0000 |
| Raymond      | Carver         |   351.0000 |
| Don          | DeLillo        |   320.0000 |
| John         | Steinbeck      |   181.0000 |
| David        | Foster Wallace |   336.0000 |
| Dan          | Harris         |   256.0000 |
| Freida       | Harris         |   428.0000 |
| George       | Saunders       |   367.0000 |
+--------------+----------------+------------+
*/