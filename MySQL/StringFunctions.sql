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
+---------------+
| short title   |
+---------------+
| The Namesa... |
| Norse Myth... |
| American G... |
| Interprete... |
| A Hologram... |
| The Circle... |
| The Amazin... |
| Just Kids...  |
| A Heartbre... |
| Coraline...   |
| What We Ta... |
| Where I'm ... |
| White Nois... |
| Cannery Ro... |
| Oblivion: ... |
| Consider t... |
+---------------+
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
+-----------------------------------------------------+
| REPLACE(title, 'e', '3')                            |
+-----------------------------------------------------+
| Th3 Nam3sak3                                        |
| Nors3 Mythology                                     |
| Am3rican Gods                                       |
| Int3rpr3t3r of Maladi3s                             |
| A Hologram for th3 King: A Nov3l                    |
| Th3 Circl3                                          |
| Th3 Amazing Adv3ntur3s of Kavali3r & Clay           |
| Just Kids                                           |
| A H3artbr3aking Work of Stagg3ring G3nius           |
| Coralin3                                            |
| What W3 Talk About Wh3n W3 Talk About Lov3: Stori3s |
| Wh3r3 I'm Calling From: S3l3ct3d Stori3s            |
| Whit3 Nois3                                         |
| Cann3ry Row                                         |
| Oblivion: Stori3s                                   |
| Consid3r th3 Lobst3r                                |
+-----------------------------------------------------+  
*/


--------------------------------------------------------------------
combine REPLACE with SUBSTRING

Ex.
SELECT
    SUBSTRING(REPLACE(title, 'e', '3'), 1, 10)
    AS 'weird string'
FROM books;

Result:
/*
+--------------+
| weird string |
+--------------+
| Th3 Nam3sa   |
| Nors3 Myth   |
| Am3rican G   |
| Int3rpr3t3   |
| A Hologram   |
| Th3 Circl3   |
| Th3 Amazin   |
| Just Kids    |
| A H3artbr3   |
| Coralin3     |
| What W3 Ta   |
| Wh3r3 I'm    |
| Whit3 Nois   |
| Cann3ry Ro   |
| Oblivion:    |
| Consid3r t   |
+--------------+
*/

--------------------------------------------------------------------
REVERSE
reverse string

Format
SELECT REVERSE('String that we want to reverse');

Ex.
SELECT REVERSE('Hello World');

Result:
/*
+------------------------+
| REVERSE('Hello World') |
+------------------------+
| dlroW olleH            |
+------------------------+
*/

Ex.
SELECT REVERSE(author_fname) FROM books;

Result:
/*
+-----------------------+
| REVERSE(author_fname) |
+-----------------------+
| apmuhJ                |
| lieN                  |
| lieN                  |
| apmuhJ                |
| evaD                  |
| evaD                  |
| leahciM               |
| ittaP                 |
| evaD                  |
| lieN                  |
| dnomyaR               |
| dnomyaR               |
| noD                   |
| nhoJ                  |
| divaD                 |
| divaD                 |
+-----------------------+
*/
--------------------------------------------------------------------
combine REVERSE with CONCAT

Ex.
SELECT CONCAT('woof', REVERSE('woof'));
result:
/*
+---------------------------------+
| CONCAT('woof', REVERSE('woof')) |
+---------------------------------+
| wooffoow                        |
+---------------------------------+
*/

Ex.
SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;
result:
/*
+---------------------------------------------+
| CONCAT(author_fname, REVERSE(author_fname)) |
+---------------------------------------------+
| JhumpaapmuhJ                                |
| NeillieN                                    |
| NeillieN                                    |
| JhumpaapmuhJ                                |
| DaveevaD                                    |
| DaveevaD                                    |
| MichaelleahciM                              |
| PattiittaP                                  |
| DaveevaD                                    |
| NeillieN                                    |
| RaymonddnomyaR                              |
| RaymonddnomyaR                              |
| DonnoD                                      |
| JohnnhoJ                                    |
| DaviddivaD                                  |
| DaviddivaD                                  |
+---------------------------------------------+

*/

--------------------------------------------------------------------
CHAR_LENGTH
count characters in String

Ex.
SELECT CHAR_LENGTH('Hello World');
result:
/*
+----------------------------+
| CHAR_LENGTH('Hello World') |
+----------------------------+
|                         11 |
+----------------------------+
*/

Ex.
SELECT author_lname, CHAR_LENGTH(author_lname) AS length FROM books;
REsult:
/*
+----------------+--------+
| author_lname   | length |
+----------------+--------+
| Lahiri         |      6 |
| Gaiman         |      6 |
| Gaiman         |      6 |
| Lahiri         |      6 |
| Eggers         |      6 |
| Eggers         |      6 |
| Chabon         |      6 |
| Smith          |      5 |
| Eggers         |      6 |
| Gaiman         |      6 |
| Carver         |      6 |
| Carver         |      6 |
| DeLillo        |      7 |
| Steinbeck      |      9 |
| Foster Wallace |     14 |
| Foster Wallace |     14 |
+----------------+--------+

*/

--------------------------------------------------------------------
combine CHAR_LENGTH with CONCAT

Ex.
SELECT
    CONCAT (
        author_lname, " is ", CHAR_LENGTH(author_lname), " characters long"
    ) as 'lastname length'
FROM books;

result:
/*
+--------------------------------------+
| lastname length                      |
+--------------------------------------+
| Lahiri is 6 characters long          |
| Gaiman is 6 characters long          |
| Gaiman is 6 characters long          |
| Lahiri is 6 characters long          |
| Eggers is 6 characters long          |
| Eggers is 6 characters long          |
| Chabon is 6 characters long          |
| Smith is 5 characters long           |
| Eggers is 6 characters long          |
| Gaiman is 6 characters long          |
| Carver is 6 characters long          |
| Carver is 6 characters long          |
| DeLillo is 7 characters long         |
| Steinbeck is 9 characters long       |
| Foster Wallace is 14 characters long |
| Foster Wallace is 14 characters long |
+--------------------------------------+
*/

--------------------------------------------------------------------
UPPER() and LOWER()
change a String case (to upper case or to lower case)

Ex.
SELECT UPPER('Hello World');
Result:
/*
+----------------------+
| UPPER('Hello World') |
+----------------------+
| HELLO WORLD          |
+----------------------+
*/

Ex.
SELECT LOWER('Hello World');
Result:
/*
+----------------------+
| LOWER('Hello World') |
+----------------------+
| hello world          |
+----------------------+
*/

Ex.
SELECT UPPER(title) FROM books;
Result:
/*
+-----------------------------------------------------+
| UPPER(title)                                        |
+-----------------------------------------------------+
| THE NAMESAKE                                        |
| NORSE MYTHOLOGY                                     |
| AMERICAN GODS                                       |
| INTERPRETER OF MALADIES                             |
| A HOLOGRAM FOR THE KING: A NOVEL                    |
| THE CIRCLE                                          |
| THE AMAZING ADVENTURES OF KAVALIER & CLAY           |
| JUST KIDS                                           |
| A HEARTBREAKING WORK OF STAGGERING GENIUS           |
| CORALINE                                            |
| WHAT WE TALK ABOUT WHEN WE TALK ABOUT LOVE: STORIES |
| WHERE I'M CALLING FROM: SELECTED STORIES            |
| WHITE NOISE                                         |
| CANNERY ROW                                         |
| OBLIVION: STORIES                                   |
| CONSIDER THE LOBSTER                                |
+-----------------------------------------------------+
*/

--------------------------------------------------------------------
combine UPPER() with CONCAT

Ex.
SELECT
    CONCAT (
        'MY FAVORITE BOOK IS ', UPPER(title)
    )
    AS "MY FAVORITE BOOK"
FROM books;

Result:
/*
+-------------------------------------------------------------------------+
| MY FAVORITE BOOK                                                        |
+-------------------------------------------------------------------------+
| MY FAVORITE BOOK IS THE NAMESAKE                                        |
| MY FAVORITE BOOK IS NORSE MYTHOLOGY                                     |
| MY FAVORITE BOOK IS AMERICAN GODS                                       |
| MY FAVORITE BOOK IS INTERPRETER OF MALADIES                             |
| MY FAVORITE BOOK IS A HOLOGRAM FOR THE KING: A NOVEL                    |
| MY FAVORITE BOOK IS THE CIRCLE                                          |
| MY FAVORITE BOOK IS THE AMAZING ADVENTURES OF KAVALIER & CLAY           |
| MY FAVORITE BOOK IS JUST KIDS                                           |
| MY FAVORITE BOOK IS A HEARTBREAKING WORK OF STAGGERING GENIUS           |
| MY FAVORITE BOOK IS CORALINE                                            |
| MY FAVORITE BOOK IS WHAT WE TALK ABOUT WHEN WE TALK ABOUT LOVE: STORIES |
| MY FAVORITE BOOK IS WHERE I'M CALLING FROM: SELECTED STORIES            |
| MY FAVORITE BOOK IS WHITE NOISE                                         |
| MY FAVORITE BOOK IS CANNERY ROW                                         |
| MY FAVORITE BOOK IS OBLIVION: STORIES                                   |
| MY FAVORITE BOOK IS CONSIDER THE LOBSTER                                |
+-------------------------------------------------------------------------+
*/

Ex.
SELECT
    CONCAT (
        'MY FAVORITE BOOK IS ', LOWER(title)
    )
    AS "MY FAVORITE BOOK"
FROM books;
Result:
/*
+-------------------------------------------------------------------------+
| MY FAVORITE BOOK                                                        |
+-------------------------------------------------------------------------+
| MY FAVORITE BOOK IS the namesake                                        |
| MY FAVORITE BOOK IS norse mythology                                     |
| MY FAVORITE BOOK IS american gods                                       |
| MY FAVORITE BOOK IS interpreter of maladies                             |
| MY FAVORITE BOOK IS a hologram for the king: a novel                    |
| MY FAVORITE BOOK IS the circle                                          |
| MY FAVORITE BOOK IS the amazing adventures of kavalier & clay           |
| MY FAVORITE BOOK IS just kids                                           |
| MY FAVORITE BOOK IS a heartbreaking work of staggering genius           |
| MY FAVORITE BOOK IS coraline                                            |
| MY FAVORITE BOOK IS what we talk about when we talk about love: stories |
| MY FAVORITE BOOK IS where i'm calling from: selected stories            |
| MY FAVORITE BOOK IS white noise                                         |
| MY FAVORITE BOOK IS cannery row                                         |
| MY FAVORITE BOOK IS oblivion: stories                                   |
| MY FAVORITE BOOK IS consider the lobster                                |
+-------------------------------------------------------------------------+
*/

--------------------------------------------------------------------

NOTES 

This WORKS:
SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS "full name in caps"
FROM books;

While this DOES NOT:
SELECT CONCAT(UPPER(author_fname, ' ', author_lname)) AS "full name in caps" 
FROM books;

*** 
important: UPPER only takes one argument 
and CONCAT takes two or more arguments, 
so they can not be switched in that way. 
***

--------------------------------------------------------------------

