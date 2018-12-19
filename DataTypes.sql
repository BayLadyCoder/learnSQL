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