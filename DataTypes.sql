Storing Text
VARCHAR
declare fixed length but more flexible

CHAR
has a fixed length
can be any value from 0 to 255
CHAR is faster for fixed length Text
Example. 
State: MD, CA, NY
Yes/No: Y/N
SEX: M/F 

If declare CHAR(5) and the value is less than the value declared, it will fill up the empty spaces with ' ' (spaces).
Ex. 
CHAR(5) 
value = 'ab'
CHAR(5) --> 'ab   ' --> ab and three spaces
-------------------------------------------------------------------------------
NUMBER 

INT = Whole NUMBER
DECIMAL = numbers that include demicals
DECIMAL has two arguments 
- the first argument is for total numbers of the digit including the decimal places
- the second argument is for numbers of the digit after the decimals or the dot(.)

Ex.
DECIMAL(5,2)
Result:
999.99
5 digits long and 2 digits after the decimals

Ex.
CREATE TABLE items (price DECIMAL(5,2));
INSERT INTO items(price) 
    VALUES
        (7), --> 7.00
        (43632434), --> 999.99
        (34.88), --> 34.88
        (298.999999), --> 299.00 (round up)
        (1.9999); --> 2.00 (round up)