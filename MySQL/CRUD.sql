CRUD (Create, Read, Update, Delete)

Read - How do we retrieve and search data?  --> Use SELECT
SELECT * FROM cats; --> Give me ALL columns (everything) in the cats Table
Which column do you want to see?

Ex. 
SELECT name FROM cats;
SELECT age FROM cats;

SELECT MULTIPLE columns //Orders of columns are matter
Ex. 
SELECT name, age FROM cats;
SELECT cat_id, breed, age, name FROM cats;

-------------------------------------------------------------------------------

WHERE --> get more specific data

Ex.
SELECT * FROM cats WHERE age=4;
--> Only select data from cats where cat's age equals four

SELECT * FROM cats WHERE name='Egg'; // case insensitive, 'EGG' will find 'Egg' as well

-------------------------------------------------------------------------------
SELECT Challenge

Write the SQL that selects the following:
1. select cat_id of all cats
2. select name and breed of all cats
3. select name and age of cats who have breed Tabby
4. select cat_id and age of cats whose cat_id and age are the same 

Implementation:

SELECT cat_id FROM cats;
SELECT name, breed FROM cats;
SELECT name, age FROM cats WHERE breed='Tabby';
SELECT cat_id, age FROM cats WHERE cat_id=age;

-------------------------------------------------------------------------------
ALIASES
use AS to create new variable name of that column for the retrived data 
only show the new name in the retrieved data, it does not change the table column header names 

Ex. 
SELECT cat_is AS id, name FROM cats;
SELECT name AS 'cat name', breed 'kitty breed' FROM cats;
DESC cats;

-------------------------------------------------------------------------------

Update
How do we update the existing data?

Ex.
UPDATE cats SET breed='Shorthair'
WHERE breed='Tabby';

Ex.
UPDATE cats SET age=14
WHERE name='Misty';

*** Try SELECTing before you UPDATE/DELETE to check that you Select the right data to update ***
*** There is no undo ***

-------------------------------------------------------------------------------
UPDATE Exercise
1. Change Jackson s name to Jack
2. Change Ringo breed to "British Shorthair"
3. Update both Main Coons ages to be 12

Implementation: 

UPDATE cats SET name ="Jack" WHERE name="Jackson";
UPDATE cats SET breed="British Shorthair" WHERE name="Ringo";
UPDATE cats SET age=12 WHERE breed="Maine Coon";

-------------------------------------------------------------------------------

DELETE

Ex.
DELETE FROM cats WHERE name='Egg';

When you delete a data the ID will not change, it stays the same, so it will skip the data that is deleted

*** Try SELECTing before you UPDATE/DELETE to check that you Select the right data to update ***
*** There is no undo ***
-------------------------------------------------------------------------------

DELETE Challenge
1. delete all 4 years old cats
2. delete cats whose age is the same as thier cat_id
3. delete all cats

Implementation:

DELETE FROM cats WHERE age=4;
DELETE FROM cats WHERE age=cat_id;
DELETE FROM cats;

-------------------------------------------------------------------------------

CRUD Challenges

Spring Cleaning
The Annual Closet Inventory
1. Create a new database "shirts_db"
2. create a new table called "shirts"
3. Table headers 
> shirt_id, INT, NOT NULL, Primary Key, AUTO_INCREMENT
> article, VARCHAR
> color, VARCHAR
> shirt_size, VARCHAR(1)
> last_worn, INT

Add 8 shirts as a default (code from the slide)

Then, add a new shirt
> purple polo shirt, size M, last worn 50 days ago

Then, SELECT all shirts, but ONly print out Article and color

Then, SELECT all MEDIUM shirts, print out EVERYTHING but shirt_id

Then, UPDATE all polo shirts, change their size to L 

Then, UPDATE the shirts that last worn 15 days ago, change last worn to 0

Then, UPDATE all white shirts, change size to 'XS', and color to 'off white'

Then, DELETE all old shirt that last worn 200 days ago

Then, DELETE all tank tops

Then, DELETE all shirts

Then, DROP the entire shirts table


Implementation:

CREATE DATABASE shirts_db;
CREATE TABLE shirts (
    shirt_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    article VARCHAR(25),
    color VARCHAR(20),
    shirt_size VARCHAR(1),
    last_worn INT
);

INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ('polo shirt', 'purple', 'M', 50);


