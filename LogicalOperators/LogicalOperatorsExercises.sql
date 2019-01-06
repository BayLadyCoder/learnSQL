1. Eveluate the following
SELECT 10 != 10; -- False
SELECT 15 > 14 && 99 - 5 <= 94; -- True
SELECT 1 IN (5,3) || 8 AND 10; -- True

2. Select all books written before 1980 (non inclusive)
SELECT title, released_year FROM books WHERE released_year < 1980;
/*
+-------------+---------------+
| title       | released_year |
+-------------+---------------+
| Cannery Row |          1945 |
+-------------+---------------+
*/

3. Select all books written by Eggers or Chabon
SELECT title, author_lname FROM books
WHERE author_lname IN ('Eggers', 'Chabon');
/*
+-------------------------------------------+--------------+
| title                                     | author_lname |
+-------------------------------------------+--------------+
| A Hologram for the King: A Novel          | Eggers       |
| The Circle                                | Eggers       |
| The Amazing Adventures of Kavalier & Clay | Chabon       |
| A Heartbreaking Work of Staggering Genius | Eggers       |
+-------------------------------------------+--------------+
*/

4. Select all books written by Lahiri, published after 2000
SELECT title, author_lname, released_year FROM books
WHERE author_lname = 'Lahiri' && released_year > 2000;
/*
+--------------+--------------+---------------+
| title        | author_lname | released_year |
+--------------+--------------+---------------+
| The Namesake | Lahiri       |          2003 |
+--------------+--------------+---------------+
*/

5. Select all books with the page counts between 100 and 200
SELECT title, pages FROM books
WHERE pages BETWEEN 100 AND 200;
/*
+-----------------------------------------------------+-------+
| title                                               | pages |
+-----------------------------------------------------+-------+
| Interpreter of Maladies                             |   198 |
| What We Talk About When We Talk About Love: Stories |   176 |
| Cannery Row                                         |   181 |
+-----------------------------------------------------+-------+
*/

6. Select all books where author_lname starts with a 'C' or an 'S'

SELECT title, author_lname FROM books
WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';

-- OR

SELECT title, author_lname FROM books
WHERE SUBSTR(author_lname, 1, 1) IN ('C', 'S');
/*
+-----------------------------------------------------+--------------+
| title                                               | author_lname |
+-----------------------------------------------------+--------------+
| The Amazing Adventures of Kavalier & Clay           | Chabon       |
| Just Kids                                           | Smith        |
| What We Talk About When We Talk About Love: Stories | Carver       |
| Where I'm Calling From: Selected Stories            | Carver       |
| Cannery Row                                         | Steinbeck    |
| Lincoln In The Bardo                                | Saunders     |
+-----------------------------------------------------+--------------+
*/

7. 
- If title contains 'stories' then TYPE = Short Stories
- If title contains 'Just Kids' or 'A Heart Breaking Work' then TYPE = Memoir
- Everything else, TYPE = Novel
SELECT title, author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN title LIKE 'Just Kids%' || title LIKE 'A Heartbreaking Work%' THEN 'Memoir'
        ELSE 'Novel'
    END AS TYPE
FROM books;
/*
+-----------------------------------------------------+----------------+---------------+
| title                                               | author_lname   | TYPE          |
+-----------------------------------------------------+----------------+---------------+
| The Namesake                                        | Lahiri         | Novel         |
| Norse Mythology                                     | Gaiman         | Novel         |
| American Gods                                       | Gaiman         | Novel         |
| Interpreter of Maladies                             | Lahiri         | Novel         |
| A Hologram for the King: A Novel                    | Eggers         | Novel         |
| The Circle                                          | Eggers         | Novel         |
| The Amazing Adventures of Kavalier & Clay           | Chabon         | Novel         |
| Just Kids                                           | Smith          | Memoir        |
| A Heartbreaking Work of Staggering Genius           | Eggers         | Memoir        |
| Coraline                                            | Gaiman         | Novel         |
| What We Talk About When We Talk About Love: Stories | Carver         | Short Stories |
| Where I'm Calling From: Selected Stories            | Carver         | Short Stories |
| White Noise                                         | DeLillo        | Novel         |
| Cannery Row                                         | Steinbeck      | Novel         |
| Oblivion: Stories                                   | Foster Wallace | Short Stories |
| Consider the Lobster                                | Foster Wallace | Novel         |
| 10% Happier                                         | Harris         | Novel         |
| fake_book                                           | Harris         | Novel         |
| Lincoln In The Bardo                                | Saunders       | Novel         |
+-----------------------------------------------------+----------------+---------------+
*/

8.
SELECT author_fname, author_lname,
CASE
    WHEN COUNT(*) = 1 THEN '1 book'
    ELSE CONCAT(COUNT(*), ' books')
END AS 'COUNT'
FROM books GROUP BY author_fname, author_lname ORDER BY author_lname;
/*
+----------------+---------+
| author_lname   | COUNT   |
+----------------+---------+
| Carver         | 2 books |
| Chabon         | 1 book  |
| DeLillo        | 1 book  |
| Eggers         | 3 books |
| Foster Wallace | 2 books |
| Gaiman         | 3 books |
| Harris         | 1 book  |
| Harris         | 1 book  |
| Lahiri         | 2 books |
| Saunders       | 1 book  |
| Smith          | 1 book  |
| Steinbeck      | 1 book  |
+----------------+---------+
*/
