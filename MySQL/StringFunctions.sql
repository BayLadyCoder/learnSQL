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
