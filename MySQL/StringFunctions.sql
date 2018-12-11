Running SQL file

Ex. if you are in the same directory with this file in your Terminal
source file_name.sql;

Ex. when your file is inside another folder (testing folder)
source testing/insert.sql

Loading Book Data from Colt
CREATE DATABASE book_shop;
USE book_shop;
source book_shop/book-data.sql; -- now we have books table
DESC books;
SELECT * FROM books;

--------------------------------------------------------------------

CONCAT
Combine Data for Cleaner Output, combine string

Search on google "mysql string functions" for reference

CONCAT (column, anotherColumn) 


Ex.
CONCAT (fistname, lastname) --> TaylorSwift

Ex.
CONCAT (fistname, ' ', lastname) --> Taylor Swift

*** need to use with SELECT ... FROM ... ***
Ex.
SELECT
    CONCAT (author_fname, ' ', author_lname) 
FROM books;

Ex.
SELECT
    CONCAT (author_fname, ' ', author_lname) AS 'full name'
FROM books;

Ex.
SELECT
    author_fname AS first, author_lname AS last,
    CONCAT (author_fname, ' ', author_lname) AS full
FROM books;

Ex.
SELECT
    CONCAT (author_fname, ' ', author_lname) AS full1, 
    CONCAT (author_fname, ', ', author_lname) AS full2 
FROM books;