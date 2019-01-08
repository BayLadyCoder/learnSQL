
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

-- -------------------------------------------------------------
-- photos table
CREATE TABLE photos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(100),
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- adding data to photos table
INSERT INTO photos (image_url, user_id) VALUES
('/cat1', 1),
('/catToys', 2),
('/catFood', 2);
/*
+----+-----------+---------+---------------------+
| id | image_url | user_id | created_at          |
+----+-----------+---------+---------------------+
|  1 | /cat1     |       1 | 2019-01-08 00:59:15 |
|  2 | /catToys  |       2 | 2019-01-08 00:59:15 |
|  3 | /catFood  |       2 | 2019-01-08 00:59:15 |
+----+-----------+---------+---------------------+
*/

-- Select image_url with username who post it
SELECT photos.image_url, users.username
FROM photos
JOIN users
    ON user_id = users.id;
/*
+-----------+----------+
| image_url | username |
+-----------+----------+
| /cat1     | Katniss  |
| /catToys  | Sammy    |
| /catFood  | Sammy    |
+-----------+----------+
*/