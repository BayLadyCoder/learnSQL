
DROP DATABASE ig_clone;
CREATE DATABASE ig_clone;
USE ig_clone;

-- users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Adding data to users table
INSERT INTO users (username) VALUES
('Katniss'),
('Sammy'),
('Ringo'),
('Percy');

SELECT * FROM users;
/*
+----+----------+---------------------+
| id | username | created_at          |
+----+----------+---------------------+
|  1 | Katniss  | 2019-01-08 00:50:51 |
|  2 | Sammy    | 2019-01-08 00:50:51 |
|  3 | Ringo    | 2019-01-08 00:50:51 |
|  4 | Percy    | 2019-01-08 00:50:51 |
+----+----------+---------------------+
*/

