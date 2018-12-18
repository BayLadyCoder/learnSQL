1. Select all titles that contain 'stories'
Implementation:
SELECT title FROM books
WHERE title LIKE '%stories%';
Result:
/*
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
| What We Talk About When We Talk About Love: Stories |
| Where I'm Calling From: Selected Stories            |
| Oblivion: Stories                                   |
+-----------------------------------------------------+
*/

2. Find the longest book, print out the title and the page count
Implementation:
SELECT title, pages FROM books
ORDER BY pages DESC LIMIT 1;
Result:
/*
+-------------------------------------------+-------+
| title                                     | pages |
+-------------------------------------------+-------+
| The Amazing Adventures of Kavalier & Clay |   634 |
+-------------------------------------------+-------+
*/

3. Print a summary containing the title and year, for three most recent book
in this format 'title - year'
Implementation:
SELECT 
    CONCAT(title, ' - ', released_year) as summary FROM books
    ORDER BY released_year DESC LIMIT 3;
Result:
/*
+-----------------------------+
| summary                     |
+-----------------------------+
| Lincoln In The Bardo - 2017 |
| Norse Mythology - 2016      |
| 10% Happier - 2014          |
+-----------------------------+
*/

4. Find all books that author lastname contains a space ' '
Implementation:
SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';
Result:
/*
+----------------------+----------------+
| title                | author_lname   |
+----------------------+----------------+
| Oblivion: Stories    | Foster Wallace |
| Consider the Lobster | Foster Wallace |
+----------------------+----------------+
*/

5. Find the 3 books with the lowest in stock, select title, year, and stock
Implementation:
SELECT title, released_year, stock_quantity FROM books
ORDER BY stock_quantity LIMIT 3;
Result
/*
+-----------------------------------------------------+---------------+----------------+
| title                                               | released_year | stock_quantity |
+-----------------------------------------------------+---------------+----------------+
| Where I'm Calling From: Selected Stories            |          1989 |             12 |
| American Gods                                       |          2001 |             12 |
| What We Talk About When We Talk About Love: Stories |          1981 |             23 |
+-----------------------------------------------------+---------------+----------------+
*/

6. Print title and author_lname, sorted first by author_lname and then by title
Implementation:
SELECT title, author_lname FROM books
ORDER BY author_lname, title;
Result:
/*
+-----------------------------------------------------+----------------+
| title                                               | author_lname   |
+-----------------------------------------------------+----------------+
| What We Talk About When We Talk About Love: Stories | Carver         |
| Where I'm Calling From: Selected Stories            | Carver         |
| The Amazing Adventures of Kavalier & Clay           | Chabon         |
| White Noise                                         | DeLillo        |
| A Heartbreaking Work of Staggering Genius           | Eggers         |
| A Hologram for the King: A Novel                    | Eggers         |
| The Circle                                          | Eggers         |
| Consider the Lobster                                | Foster Wallace |
| Oblivion: Stories                                   | Foster Wallace |
| American Gods                                       | Gaiman         |
| Coraline                                            | Gaiman         |
| Norse Mythology                                     | Gaiman         |
| 10% Happier                                         | Harris         |
| fake_book                                           | Harris         |
| Interpreter of Maladies                             | Lahiri         |
| The Namesake                                        | Lahiri         |
| Lincoln In The Bardo                                | Saunders       |
| Just Kids                                           | Smith          |
| Cannery Row                                         | Steinbeck      |
+-----------------------------------------------------+----------------+
*/

7. 
SELECT
    UPPER(
        CONCAT('MY FAVORITE AUTHOR IS ', author_fname, ' ', author_lname, '!')
    ) AS yell FROM books
    ORDER BY author_lname;
Result:
/*
+---------------------------------------------+
| yell                                        |
+---------------------------------------------+
| MY FAVORITE AUTHOR IS RAYMOND CARVER!       |
| MY FAVORITE AUTHOR IS RAYMOND CARVER!       |
| MY FAVORITE AUTHOR IS MICHAEL CHABON!       |
| MY FAVORITE AUTHOR IS DON DELILLO!          |
| MY FAVORITE AUTHOR IS DAVE EGGERS!          |
| MY FAVORITE AUTHOR IS DAVE EGGERS!          |
| MY FAVORITE AUTHOR IS DAVE EGGERS!          |
| MY FAVORITE AUTHOR IS DAVID FOSTER WALLACE! |
| MY FAVORITE AUTHOR IS DAVID FOSTER WALLACE! |
| MY FAVORITE AUTHOR IS NEIL GAIMAN!          |
| MY FAVORITE AUTHOR IS NEIL GAIMAN!          |
| MY FAVORITE AUTHOR IS NEIL GAIMAN!          |
| MY FAVORITE AUTHOR IS DAN HARRIS!           |
| MY FAVORITE AUTHOR IS FREIDA HARRIS!        |
| MY FAVORITE AUTHOR IS JHUMPA LAHIRI!        |
| MY FAVORITE AUTHOR IS JHUMPA LAHIRI!        |
| MY FAVORITE AUTHOR IS GEORGE SAUNDERS!      |
| MY FAVORITE AUTHOR IS PATTI SMITH!          |
| MY FAVORITE AUTHOR IS JOHN STEINBECK!       |
+---------------------------------------------+
*/