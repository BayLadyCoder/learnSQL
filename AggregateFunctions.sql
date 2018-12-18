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
