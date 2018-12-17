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


--------------------------------------------------------------------
ORDER BY (number)

Ex.
SELECT title, author_fname, author_lname
FROM books ORDER BY 2;
--> ORDER BY 2 means order by the second variable from the selected list
--> In this case, it means "author_fname"
Result:
/*
+-----------------------------------------------------+--------------+----------------+
| title                                               | author_fname | author_lname   |
+-----------------------------------------------------+--------------+----------------+
| 10% Happier                                         | Dan          | Harris         |
| A Hologram for the King: A Novel                    | Dave         | Eggers         |
| The Circle                                          | Dave         | Eggers         |
| A Heartbreaking Work of Staggering Genius           | Dave         | Eggers         |
| Oblivion: Stories                                   | David        | Foster Wallace |
| Consider the Lobster                                | David        | Foster Wallace |
| White Noise                                         | Don          | DeLillo        |
| fake_book                                           | Freida       | Harris         |
| Lincoln In The Bardo                                | George       | Saunders       |
| The Namesake                                        | Jhumpa       | Lahiri         |
| Interpreter of Maladies                             | Jhumpa       | Lahiri         |
| Cannery Row                                         | John         | Steinbeck      |
| The Amazing Adventures of Kavalier & Clay           | Michael      | Chabon         |
| Norse Mythology                                     | Neil         | Gaiman         |
| American Gods                                       | Neil         | Gaiman         |
| Coraline                                            | Neil         | Gaiman         |
| Just Kids                                           | Patti        | Smith          |
| What We Talk About When We Talk About Love: Stories | Raymond      | Carver         |
| Where I'm Calling From: Selected Stories            | Raymond      | Carver         |
+-----------------------------------------------------+--------------+----------------+
*/


Ex.
SELECT title, author_fname, released_year
FROM books ORDER BY 3;
--> order by released_year
Result:
/*
+-----------------------------------------------------+--------------+---------------+
| title                                               | author_fname | released_year |
+-----------------------------------------------------+--------------+---------------+
| Cannery Row                                         | John         |          1945 |
| What We Talk About When We Talk About Love: Stories | Raymond      |          1981 |
| White Noise                                         | Don          |          1985 |
| Where I'm Calling From: Selected Stories            | Raymond      |          1989 |
| Interpreter of Maladies                             | Jhumpa       |          1996 |
| The Amazing Adventures of Kavalier & Clay           | Michael      |          2000 |
| American Gods                                       | Neil         |          2001 |
| A Heartbreaking Work of Staggering Genius           | Dave         |          2001 |
| fake_book                                           | Freida       |          2001 |
| The Namesake                                        | Jhumpa       |          2003 |
| Coraline                                            | Neil         |          2003 |
| Oblivion: Stories                                   | David        |          2004 |
| Consider the Lobster                                | David        |          2005 |
| Just Kids                                           | Patti        |          2010 |
| A Hologram for the King: A Novel                    | Dave         |          2012 |
| The Circle                                          | Dave         |          2013 |
| 10% Happier                                         | Dan          |          2014 |
| Norse Mythology                                     | Neil         |          2016 |
| Lincoln In The Bardo                                | George       |          2017 |
+-----------------------------------------------------+--------------+---------------+
*/

--------------------------------------------------------------------
ORDER BY priority1, priority2
--> This command will ORDER BY the first priority first, 
--> then if the first priority values are duplicated
--> it will ORDER BY the second priority

Ex.
SELECT author_fname, author_lname FROM books
ORDER BY author_lname, author_fname;
Result:
/*
+--------------+----------------+
| author_fname | author_lname   |
+--------------+----------------+
| Raymond      | Carver         |
| Raymond      | Carver         |
| Michael      | Chabon         |
| Don          | DeLillo        |
| Dave         | Eggers         |
| Dave         | Eggers         |
| Dave         | Eggers         |
| David        | Foster Wallace |
| David        | Foster Wallace |
| Neil         | Gaiman         |
| Neil         | Gaiman         |
| Neil         | Gaiman         |
| Dan          | Harris         |***** Dan comes before Freida
| Freida       | Harris         |***** when they have the same last name
| Jhumpa       | Lahiri         |
| Jhumpa       | Lahiri         |
| George       | Saunders       |
| Patti        | Smith          |
| John         | Steinbeck      |
+--------------+----------------+
*/
--------------------------------------------------------------------
LIMIT
set the limit of the selected results

Ex. --> Five most recent released books
SELECT title, released_year FROM books
ORDER BY  released_year DESC LIMIT 5;
Result:
/*
+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| Lincoln In The Bardo             |          2017 |
| Norse Mythology                  |          2016 |
| 10% Happier                      |          2014 |
| The Circle                       |          2013 |
| A Hologram for the King: A Novel |          2012 |
+----------------------------------+---------------+
*/