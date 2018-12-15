add three new books
INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);


--------------------------------------------------------------------
DISTINCT
only return the unique selection (no duplicated values)

Ex.
SELECT DISTINCT author_lname FROM books;
Result:
/*
+----------------+
| author_lname   |
+----------------+
| Lahiri         |
| Gaiman         |
| Eggers         |
| Chabon         |
| Smith          |
| Carver         |
| DeLillo        |
| Steinbeck      |
| Foster Wallace |
| Harris         |
| Saunders       |
+----------------+
*/

--------------------------------------------------------------------
combine DISTINCT with CONCAT

Ex.
SELECT
    DISTINCT
        CONCAT(author_fname, ' ' , author_lname)
     AS 'full name'
FROM books;
Result:
/*
+----------------------+
| full name            |
+----------------------+
| Jhumpa Lahiri        |
| Neil Gaiman          |
| Dave Eggers          |
| Michael Chabon       |
| Patti Smith          |
| Raymond Carver       |
| Don DeLillo          |
| John Steinbeck       |
| David Foster Wallace |
| Dan Harris           |
| Freida Harris        |
| George Saunders      |
+----------------------+
*/

This one will distinct both columns same as above
Dont need to be concatinated before distinct.
Ex.
SELECT
    DISTINCT author_fname, author_lname
FROM books;
Result:
/*
+--------------+----------------+
| author_fname | author_lname   |
+--------------+----------------+
| Jhumpa       | Lahiri         |
| Neil         | Gaiman         |
| Dave         | Eggers         |
| Michael      | Chabon         |
| Patti        | Smith          |
| Raymond      | Carver         |
| Don          | DeLillo        |
| John         | Steinbeck      |
| David        | Foster Wallace |
| Dan          | Harris         |
| Freida       | Harris         |
| George       | Saunders       |
+--------------+----------------+
*/

--------------------------------------------------------------------
ORDER BY
sorting our results (ASCENDING by default)

Alphabetical order
Ex.
SELECT author_lname FROM books ORDER BY author_lname;
Result:
/*
+----------------+
| author_lname   |
+----------------+
| Carver         |
| Carver         |
| Chabon         |
| DeLillo        |
| Eggers         |
| Eggers         |
| Eggers         |
| Foster Wallace |
| Foster Wallace |
| Gaiman         |
| Gaiman         |
| Gaiman         |
| Harris         |
| Harris         |
| Lahiri         |
| Lahiri         |
| Saunders       |
| Smith          |
| Steinbeck      |
+----------------+
*/

Ex.
SELECT title FROM books ORDER BY title;
Result:
/*
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
| 10% Happier                                         |
| A Heartbreaking Work of Staggering Genius           |
| A Hologram for the King: A Novel                    |
| American Gods                                       |
| Cannery Row                                         |
| Consider the Lobster                                |
| Coraline                                            |
| fake_book                                           |
| Interpreter of Maladies                             |
| Just Kids                                           |
| Lincoln In The Bardo                                |
| Norse Mythology                                     |
| Oblivion: Stories                                   |
| The Amazing Adventures of Kavalier & Clay           |
| The Circle                                          |
| The Namesake                                        |
| What We Talk About When We Talk About Love: Stories |
| Where I'm Calling From: Selected Stories            |
| White Noise                                         |
+-----------------------------------------------------+
*/

--------------------------------------------------------------------
ORDER BY 
Descending (DESC)

Ex.
SELECT author_lname FROM books ORDER BY author_lname DESC;
Result:
/*
+----------------+
| author_lname   |
+----------------+
| Steinbeck      |
| Smith          |
| Saunders       |
| Lahiri         |
| Lahiri         |
| Harris         |
| Harris         |
| Gaiman         |
| Gaiman         |
| Gaiman         |
| Foster Wallace |
| Foster Wallace |
| Eggers         |
| Eggers         |
| Eggers         |
| DeLillo        |
| Chabon         |
| Carver         |
| Carver         |
+----------------+
*/

Ex.
SELECT released_year FROM books ORDER BY released_year DESC;
Result:
/*
+---------------+
| released_year |
+---------------+
|          2017 |
|          2016 |
|          2014 |
|          2013 |
|          2012 |
|          2010 |
|          2005 |
|          2004 |
|          2003 |
|          2003 |
|          2001 |
|          2001 |
|          2001 |
|          2000 |
|          1996 |
|          1989 |
|          1985 |
|          1981 |
|          1945 |
+---------------+
*/

Ex.
SELECT title, pages, released_year FROM books 
ORDER BY released_year DESC;
Result:
/*
+-----------------------------------------------------+-------+---------------+
| title                                               | pages | released_year |
+-----------------------------------------------------+-------+---------------+
| Lincoln In The Bardo                                |   367 |          2017 |
| Norse Mythology                                     |   304 |          2016 |
| 10% Happier                                         |   256 |          2014 |
| The Circle                                          |   504 |          2013 |
| A Hologram for the King: A Novel                    |   352 |          2012 |
| Just Kids                                           |   304 |          2010 |
| Consider the Lobster                                |   343 |          2005 |
| Oblivion: Stories                                   |   329 |          2004 |
| The Namesake                                        |   291 |          2003 |
| Coraline                                            |   208 |          2003 |
| American Gods                                       |   465 |          2001 |
| A Heartbreaking Work of Staggering Genius           |   437 |          2001 |
| fake_book                                           |   428 |          2001 |
| The Amazing Adventures of Kavalier & Clay           |   634 |          2000 |
| Interpreter of Maladies                             |   198 |          1996 |
| Where I'm Calling From: Selected Stories            |   526 |          1989 |
| White Noise                                         |   320 |          1985 |
| What We Talk About When We Talk About Love: Stories |   176 |          1981 |
| Cannery Row                                         |   181 |          1945 |
+-----------------------------------------------------+-------+---------------+
*/