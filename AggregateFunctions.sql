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