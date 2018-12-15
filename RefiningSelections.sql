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