Examples of Many To Many Relationship
Books <-> Authors 
-- Books can have many authors, and authors can have many books
Blog Post <-> Tags
Students <-> Classes

TV Show Reviewing Application Database

Reviewers Table
- id (PRIMARY KEY)
- first_name
- last_name

Series Table
- id (PRIMARY KEY)
- title
- released_year
- genre

Reviews Table
- id (PRIMARY KEY)
- rating
- series_id (FOREIGN KEY)
- reviewer_id (FOREIGN KEY)

CREATE TABLE reviewers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

CREATE TABLE series (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    released_year YEAR(4),
    genre VARCHAR(100)    
);

CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rating DECIMAL(2,1),
    series_id INT,
        FOREIGN KEY (series_id) 
            REFERENCES series(id)
            ON DELETE CASCADE,
    reviewer_id INT,
        FOREIGN KEY (reviewer_id) 
            REFERENCES reviewers(id)
            ON DELETE CASCADE
);

INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');

INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');


INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);

--------------------------------------------------------------------------
-- Print title and Rating
SELECT title, rating
FROM series
JOIN reviews
    ON series_id = series.id;
/*
+----------------------+--------+
| title                | rating |
+----------------------+--------+
| Archer               |    8.0 |
| Archer               |    7.5 |
| Archer               |    8.5 |
| Archer               |    7.7 |
| Archer               |    8.9 |
| Arrested Development |    8.1 |
| Arrested Development |    6.0 |
| Arrested Development |    8.0 |
| Arrested Development |    8.4 |
| Arrested Development |    9.9 |
| Bob's Burgers        |    7.0 |
| Bob's Burgers        |    7.5 |
| Bob's Burgers        |    8.0 |
| Bob's Burgers        |    7.1 |
| Bob's Burgers        |    8.0 |
| Bojack Horseman      |    7.5 |
| Bojack Horseman      |    7.8 |
| Bojack Horseman      |    8.3 |
| Bojack Horseman      |    7.6 |
| Bojack Horseman      |    8.5 |
| Breaking Bad         |    9.5 |
| Breaking Bad         |    9.0 |
| Breaking Bad         |    9.1 |
| Breaking Bad         |    9.3 |
| Breaking Bad         |    9.9 |
| Curb Your Enthusiasm |    6.5 |
| Curb Your Enthusiasm |    7.8 |
| Curb Your Enthusiasm |    8.8 |
| Curb Your Enthusiasm |    8.4 |
| Curb Your Enthusiasm |    9.1 |
| Fargo                |    9.1 |
| Fargo                |    9.7 |
| Freaks and Geeks     |    8.5 |
| Freaks and Geeks     |    7.8 |
| Freaks and Geeks     |    8.8 |
| Freaks and Geeks     |    9.3 |
| General Hospital     |    5.5 |
| General Hospital     |    6.8 |
| General Hospital     |    5.8 |
| General Hospital     |    4.3 |
| General Hospital     |    4.5 |
| Halt and Catch Fire  |    9.9 |
| Seinfeld             |    8.0 |
| Seinfeld             |    7.2 |
| Stranger Things      |    8.5 |
| Stranger Things      |    8.9 |
| Stranger Things      |    8.9 |
+----------------------+--------+
*/
--------------------------------------------------------------------------
-- Print title and average rating for each title
SELECT title, AVG(rating) AS average_rating
FROM series
JOIN reviews
    ON series_id = series.id
GROUP BY title
ORDER BY average_rating;
/*
+----------------------+----------------+
| title                | average_rating |
+----------------------+----------------+
| General Hospital     |        5.38000 |
| Bob's Burgers        |        7.52000 |
| Seinfeld             |        7.60000 |
| Bojack Horseman      |        7.94000 |
| Arrested Development |        8.08000 |
| Archer               |        8.12000 |
| Curb Your Enthusiasm |        8.12000 |
| Freaks and Geeks     |        8.60000 |
| Stranger Things      |        8.76667 |
| Breaking Bad         |        9.36000 |
| Fargo                |        9.40000 |
| Halt and Catch Fire  |        9.90000 |
+----------------------+----------------+
*/
--------------------------------------------------------------------------
-- Print firstname and lastname of all reviewers and all their ratings
SELECT first_name, last_name, rating
FROM reviewers
JOIN reviews
    ON reviewer_id = reviewers.id;
/*
+------------+-----------+--------+
| first_name | last_name | rating |
+------------+-----------+--------+
| Thomas     | Stoneman  |    8.0 |
| Thomas     | Stoneman  |    8.1 |
| Thomas     | Stoneman  |    7.0 |
| Thomas     | Stoneman  |    7.5 |
| Thomas     | Stoneman  |    9.5 |
| Wyatt      | Skaggs    |    7.5 |
| Wyatt      | Skaggs    |    7.6 |
| Wyatt      | Skaggs    |    9.3 |
| Wyatt      | Skaggs    |    6.5 |
| Wyatt      | Skaggs    |    8.4 |
| Wyatt      | Skaggs    |    9.1 |
| Wyatt      | Skaggs    |    7.8 |
| Wyatt      | Skaggs    |    5.5 |
| Wyatt      | Skaggs    |    8.5 |
| Kimbra     | Masters   |    8.5 |
| Kimbra     | Masters   |    8.0 |
| Kimbra     | Masters   |    7.1 |
| Kimbra     | Masters   |    7.8 |
| Kimbra     | Masters   |    9.0 |
| Kimbra     | Masters   |    7.8 |
| Kimbra     | Masters   |    6.8 |
| Kimbra     | Masters   |    8.0 |
| Kimbra     | Masters   |    8.9 |
| Domingo    | Cortes    |    7.7 |
| Domingo    | Cortes    |    6.0 |
| Domingo    | Cortes    |    8.0 |
| Domingo    | Cortes    |    8.3 |
| Domingo    | Cortes    |    9.1 |
| Domingo    | Cortes    |    8.8 |
| Domingo    | Cortes    |    8.5 |
| Domingo    | Cortes    |    5.8 |
| Domingo    | Cortes    |    7.2 |
| Domingo    | Cortes    |    8.9 |
| Colt       | Steele    |    8.9 |
| Colt       | Steele    |    9.9 |
| Colt       | Steele    |    8.0 |
| Colt       | Steele    |    8.5 |
| Colt       | Steele    |    9.9 |
| Colt       | Steele    |    9.1 |
| Colt       | Steele    |    9.7 |
| Colt       | Steele    |    9.3 |
| Colt       | Steele    |    4.5 |
| Colt       | Steele    |    9.9 |
| Pinkie     | Petit     |    8.4 |
| Pinkie     | Petit     |    7.5 |
| Pinkie     | Petit     |    8.8 |
| Pinkie     | Petit     |    4.3 |
+------------+-----------+--------+
*/
--------------------------------------------------------------------------
-- Print unreviewed series
SELECT title AS 'unreviewed series'
FROM series
LEFT JOIN reviews
    ON series_id = series.id
WHERE rating IS NULL;
/*
+-----------------------+
| unreviewed series     |
+-----------------------+
| Malcolm In The Middle |
| Pushing Daisies       |
+-----------------------+
*/
--------------------------------------------------------------------------
-- Print genre and their average rating of each genre
SELECT genre, AVG(rating) AS avg_rating
FROM series
JOIN reviews
    ON series_id = series.id
GROUP BY genre;
/*
+-----------+------------+
| genre     | avg_rating |
+-----------+------------+
| Animation |    7.86000 |
| Comedy    |    8.16250 |
| Drama     |    8.04375 |
+-----------+------------+
*/

SELECT genre, ROUND(AVG(rating), 2) AS avg_rating
FROM series
JOIN reviews
    ON series_id = series.id
GROUP BY genre;
/*
+-----------+------------+
| genre     | avg_rating |
+-----------+------------+
| Animation |       7.86 |
| Comedy    |       8.16 |
| Drama     |       8.04 |
+-----------+------------+
*/

--------------------------------------------------------------------------
-- Challenge 6
SELECT 
    first_name, 
    last_name, 
    COUNT(rating) AS COUNT, 
    IFNULL(MIN(rating), '0.0') AS MIN, 
    IFNULL(MAX(rating), '0.0') AS MAX, 
    IFNULL(AVG(rating), '0.00000') AS AVG,
CASE 
    WHEN COUNT(rating) = 0 THEN 'INACTIVE'
    ELSE 'ACTIVE'
    END AS STATUS
FROM reviewers
LEFT JOIN reviews
    ON reviewer_id = reviewers.id
GROUP BY first_name, last_name;
/*
+------------+-----------+-------+-----+-----+---------+----------+
| first_name | last_name | COUNT | MIN | MAX | AVG     | STATUS   |
+------------+-----------+-------+-----+-----+---------+----------+
| Thomas     | Stoneman  |     5 | 7.0 | 9.5 | 8.02000 | ACTIVE   |
| Wyatt      | Skaggs    |     9 | 5.5 | 9.3 | 7.80000 | ACTIVE   |
| Kimbra     | Masters   |     9 | 6.8 | 9.0 | 7.98889 | ACTIVE   |
| Domingo    | Cortes    |    10 | 5.8 | 9.1 | 7.83000 | ACTIVE   |
| Colt       | Steele    |    10 | 4.5 | 9.9 | 8.77000 | ACTIVE   |
| Pinkie     | Petit     |     4 | 4.3 | 8.8 | 7.25000 | ACTIVE   |
| Marlon     | Crafford  |     0 | 0.0 | 0.0 | 0.00000 | INACTIVE |
+------------+-----------+-------+-----+-----+---------+----------+
*/
--------------------------------------------------------------------------
-- Challenge 7
SELECT title, rating, CONCAT(first_name, ' ', last_name) AS reviewer 
FROM series
JOIN reviews
    ON series_id = series.id
JOIN reviewers
    ON reviewer_id = reviewers.id
ORDER BY title;
/*
+----------------------+--------+-----------------+
| title                | rating | reviewer        |
+----------------------+--------+-----------------+
| Archer               |    8.0 | Thomas Stoneman |
| Archer               |    8.9 | Colt Steele     |
| Archer               |    7.7 | Domingo Cortes  |
| Archer               |    8.5 | Kimbra Masters  |
| Archer               |    7.5 | Wyatt Skaggs    |
| Arrested Development |    8.4 | Pinkie Petit    |
| Arrested Development |    9.9 | Colt Steele     |
| Arrested Development |    8.1 | Thomas Stoneman |
| Arrested Development |    8.0 | Kimbra Masters  |
| Arrested Development |    6.0 | Domingo Cortes  |
| Bob's Burgers        |    7.5 | Pinkie Petit    |
| Bob's Burgers        |    8.0 | Colt Steele     |
| Bob's Burgers        |    8.0 | Domingo Cortes  |
| Bob's Burgers        |    7.1 | Kimbra Masters  |
| Bob's Burgers        |    7.0 | Thomas Stoneman |
| Bojack Horseman      |    8.3 | Domingo Cortes  |
| Bojack Horseman      |    7.6 | Wyatt Skaggs    |
| Bojack Horseman      |    8.5 | Colt Steele     |
| Bojack Horseman      |    7.5 | Thomas Stoneman |
| Bojack Horseman      |    7.8 | Kimbra Masters  |
| Breaking Bad         |    9.5 | Thomas Stoneman |
| Breaking Bad         |    9.0 | Kimbra Masters  |
| Breaking Bad         |    9.1 | Domingo Cortes  |
| Breaking Bad         |    9.9 | Colt Steele     |
| Breaking Bad         |    9.3 | Wyatt Skaggs    |
| Curb Your Enthusiasm |    7.8 | Kimbra Masters  |
| Curb Your Enthusiasm |    8.8 | Domingo Cortes  |
| Curb Your Enthusiasm |    8.4 | Wyatt Skaggs    |
| Curb Your Enthusiasm |    9.1 | Colt Steele     |
| Curb Your Enthusiasm |    6.5 | Wyatt Skaggs    |
| Fargo                |    9.1 | Wyatt Skaggs    |
| Fargo                |    9.7 | Colt Steele     |
| Freaks and Geeks     |    8.5 | Domingo Cortes  |
| Freaks and Geeks     |    7.8 | Wyatt Skaggs    |
| Freaks and Geeks     |    9.3 | Colt Steele     |
| Freaks and Geeks     |    8.8 | Pinkie Petit    |
| General Hospital     |    6.8 | Kimbra Masters  |
| General Hospital     |    5.8 | Domingo Cortes  |
| General Hospital     |    5.5 | Wyatt Skaggs    |
| General Hospital     |    4.5 | Colt Steele     |
| General Hospital     |    4.3 | Pinkie Petit    |
| Halt and Catch Fire  |    9.9 | Colt Steele     |
| Seinfeld             |    8.0 | Kimbra Masters  |
| Seinfeld             |    7.2 | Domingo Cortes  |
| Stranger Things      |    8.9 | Kimbra Masters  |
| Stranger Things      |    8.5 | Wyatt Skaggs    |
| Stranger Things      |    8.9 | Domingo Cortes  |
+----------------------+--------+-----------------+
*/