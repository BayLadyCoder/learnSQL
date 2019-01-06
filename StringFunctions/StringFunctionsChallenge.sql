
String Functions Challenges

1. Reverse and Uppercase the following sentence 
"Why does my cat look at me with such hatred?"
Implementation:
SELECT
    REVERSE(UPPER("Why does my cat look at me with such hatred?"));

2. What does this print out?
SELECT
  REPLACE
  (
  CONCAT('I', ' ', 'like', ' ', 'cats'),
  ' ',
  '-'
  );
Answer: before replce = 'I like cats' after replace = 'I-like-cats' 

3. Replace spaces in titles with '->'
Implementation:
SELECT
    REPLACE(title, ' ', '->') AS title
FROM books;

4. Print authors lastname spelling forward and backward
Implementation:
SELECT 
    author_lname AS forwards, REVERSE(author_lname) AS backwards
FROM books;

5. Print authors firstname and lastname combined and all uppercase
Implementation:
SELECT
    UPPER(CONCAT(author_fname, ' ', author_lname)) as 'full name in caps'
FROM books;

6. Print (title) was released in (released year) as blurb
Implementation:
SELECT
    CONCAT(title, ' was released in ', released_year)
FROM books;

7. Print book titles and the length of each title
Implementation:
SELECT
    title, CHAR_LENGTH(title) as 'character count'
FROM books;

8. Print 
short title (title index1-10 with '...' at the end of each title)
author(lastname, firstname)
quantity(stock_quantity 'in stock')
Implementation:
SELECT
    CONCAT(
        SUBSTRING(title, 1, 10), '...'
    ) as 'short title',
    CONCAT(author_lname, ', ', author_fname) as author,
    CONCAT(stock_quantity, ' in stock') as quantity
FROM books;