-- SELECT
--     CONCAT (
--         SUBSTRING(title, 1, 10),
--         '...'
--     ) AS 'short title'
-- FROM books;



-- SELECT
--     SUBSTRING(REPLACE(title, 'e', '3'), 1, 10)
--     AS 'weird string'
-- FROM books;



-- SELECT
--     CONCAT (
--         author_lname, " is ", CHAR_LENGTH(author_lname), " characters long"
--     ) as 'lastname length'
-- FROM books;



SELECT
    CONCAT (
        'MY FAVORITE BOOK IS THE ', UPPER(title)
    )
FROM books;