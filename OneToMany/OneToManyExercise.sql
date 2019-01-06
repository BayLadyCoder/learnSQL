Write this schema

Student Table
- id (PRIMARY KEY)
- first_name

Papers Table
- title
- grade
- student_id (FOREIGN KEY)

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100)
);

CREATE TABLE papers (
    title VARCHAR(100), 
    grade INT, 
    student_id INT,
    FOREIGN KEY(student_id) REFERENCES students(id)
        ON DELETE CASCADE
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

-- Print INNER JOIN
SELECT first_name, title, grade
FROM students
JOIN papers
    ON student_id = students.id
ORDER BY grade DESC;
/*
+------------+---------------------------------------+-------+
| first_name | title                                 | grade |
+------------+---------------------------------------+-------+
| Samantha   | De Montaigne and The Art of The Essay |    98 |
| Samantha   | Russian Lit Through The Ages          |    94 |
| Carlos     | Borges and Magical Realism            |    89 |
| Caleb      | My Second Book Report                 |    75 |
| Caleb      | My First Book Report                  |    60 |
+------------+---------------------------------------+-------+
*/

-- Print LEFT JOIN
SELECT first_name, title, grade
FROM students
LEFT JOIN papers
    ON student_id = students.id;
/*
+------------+---------------------------------------+-------+
| first_name | title                                 | grade |
+------------+---------------------------------------+-------+
| Caleb      | My First Book Report                  |    60 |
| Caleb      | My Second Book Report                 |    75 |
| Samantha   | Russian Lit Through The Ages          |    94 |
| Samantha   | De Montaigne and The Art of The Essay |    98 |
| Raj        | NULL                                  |  NULL |
| Carlos     | Borges and Magical Realism            |    89 |
| Lisa       | NULL                                  |  NULL |
+------------+---------------------------------------+-------+
*/

-- Print LEFT JOIN and change grade from NULL to 0, and NULL title to 'MISSING'
SELECT first_name, IFNULL(title, 'MISSING'), IFNULL(grade, 0)
FROM students
LEFT JOIN papers
    ON student_id = students.id;
/*
+------------+---------------------------------------+------------------+
| first_name | IFNULL(title, 'MISSING')              | IFNULL(grade, 0) |
+------------+---------------------------------------+------------------+
| Caleb      | My First Book Report                  |               60 |
| Caleb      | My Second Book Report                 |               75 |
| Samantha   | Russian Lit Through The Ages          |               94 |
| Samantha   | De Montaigne and The Art of The Essay |               98 |
| Raj        | MISSING                               |                0 |
| Carlos     | Borges and Magical Realism            |               89 |
| Lisa       | MISSING                               |                0 |
+------------+---------------------------------------+------------------+
*/

-- Print average grades of every student
SELECT first_name, IFNULL(AVG(grade), '0') AS average
FROM students
LEFT JOIN papers
 ON student_id = students.id
GROUP BY students.id
ORDER BY AVG(grade) DESC;
/*
+------------+---------+
| first_name | average |
+------------+---------+
| Samantha   | 96.0000 |
| Carlos     | 89.0000 |
| Caleb      | 67.5000 |
| Raj        | 0       |
| Lisa       | 0       |
+------------+---------+
*/

-- Print passing status if grade is over 75
SELECT first_name, IFNULL(AVG(grade), '0') AS average,
CASE
    WHEN AVG(grade) >= 75 THEN 'PASSING'
    ELSE 'FAILING'
    END AS passing_status
FROM students
LEFT JOIN papers
 ON student_id = students.id
GROUP BY students.id
ORDER BY AVG(grade) DESC;
/*
+------------+---------+----------------+
| first_name | average | passing_status |
+------------+---------+----------------+
| Samantha   | 96.0000 | PASSING        |
| Carlos     | 89.0000 | PASSING        |
| Caleb      | 67.5000 | FAILING        |
| Lisa       | 0       | FAILING        |
| Raj        | 0       | FAILING        |
+------------+---------+----------------+
*/