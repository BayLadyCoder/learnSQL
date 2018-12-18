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