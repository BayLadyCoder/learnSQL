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

--------------------------------------------------------------------

CONCAT with Separator 
CONCAT_WS
-- automatically add the separator between the variables that we want to CONCAT

Ex. 
SELECT
CONCAT_WS('-', title, author_fname, author_lname)
FROM books;

result: title-author_fname-author_lname

--------------------------------------------------------------------
SUBSTRING
workig with parts of string

*** in SQL the index starts with 1 (not zero like programming languages)

--> If SUBSTRING doesn't work, use SUBSTR instead

Case: 1 - String with two more arguments
SELECT SUBSTRING('String', startingIndexInt, length)
SELECT SUBSTR('String', startingIndexInt, length)
Ex.
SELECT SUBSTRING('Hello World', 1, 4);  --> Result: 'Hell'
SELECT SUBSTR('Hello World', 1, 4);  --> Result: 'Hell'

case: 2 - String with one argument (positive integer)
SELECT SUBSTRING('String', startFromThisIndexToTheEndOfTheString)
SELECT SUBSTR('String', startFromThisIndexToTheEndOfTheString)
Ex.
SELECT SUBSTRING('Hello World', 7);  --> Result: 'World'
SELECT SUBSTR('Hello World', 7);  --> Result: 'World'

case: 3 - String with one argument (negative integer)
SELECT SUBSTRING('Hello World', numberOfIndexCountingFromTheEndOfTheStringNegativeInt)
SELECT SUBSTR('Hello World', numberOfIndexCountingFromTheEndOfTheStringNegativeInt)
Ex. 
SELECT SUBSTRING('Hello World', -3); --> Result: 'rld'
SELECT SUBSTR('Hello World', -3); --> Result: 'rld'

case: 4 - String that contain '' or ""
Ex.
SELECT SUBSTR('I'm a cat', 3); --> it will give an error since we have a ' inside the ''
Solution: SUBSTR("I'm a cat", 3);

case: 5 - variableString
Ex.
SELECT SUBSTR(title, 1, 10) FROM books;
Ex.
SELECT SUBSTR(title, 1, 10) as 'short title' FROM books;

--------------------------------------------------------------------
combine SUBSTRING with CONCAT

--> SELECT SUBSTRING title index 1-10 and CONCAT '...' after each title.
Ex.
SELECT
    CONCAT (
        SUBSTRING(title, 1, 10),
        '...'
    ) AS 'short title'
FROM books;

Result:
/*
The Namesa...                         |
| Norse Myth...                         |
| American G...                         |
| Interprete...                         |
| A Hologram...                         |
| The Circle...                         |
| The Amazin...                         |
| Just Kids...                          |
| A Heartbre...                         |
| Coraline...                           |
| What We Ta...                         |
| Where I'm ...                         |
| White Nois...                         |
| Cannery Ro...                         |
| Oblivion: ...                         |
| Consider t... 
*/


--------------------------------------------------------------------
REPLACE
replace parts of string 

Format
SELECT REPLACE('String', 'partThatWantToBeReplace', 'ReplaceItWithThisString');

Ex.
SELECT REPLACE('Hello World', 'Hell', '1234');
Result:
'1234o World'

Ex.
SELECT REPLACE('Hello World', 'l', '7');
Result:
'He77o Wor7d'

Ex.
SELECT REPLACE('cheese bread coffee milk', ' ', ' and ');
Result:
'cheese and bread and coffee and milk'

Ex.
SELECT REPLACE(title, 'e', '3') FROM books;
Result:
/*
 Th3 Nam3sak3                                        |
| Nors3 Mythology                                     |
| Am3rican Gods                                       |
| Int3rpr3t3r of Maladi3s   
*/