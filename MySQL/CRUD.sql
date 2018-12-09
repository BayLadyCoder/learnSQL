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
