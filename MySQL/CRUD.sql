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

