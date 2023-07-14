/** Store Items 
Skirt (50)
Shirt (75)
Dress (25)
Jacket (34)
**/

CREATE TABLE StoreItems (id INTEGER PRIMARY KEY, name TEXT, quantity INTEGER, material TEXT, price INTEGER);

INSERT INTO storeitems VALUES ( 1, "Skirt" , 50, "Leather", 25);
INSERT INTO storeitems VALUES (2,"Shirt", 75, "Cotton", 10);
INSERT INTO storeitems VALUES (3, "Dress", 25, " Satin", 32);
INSERT INTO storeitems VALUES (4,"Jacket", 34, "Denim", 28);

SELECT* FROM storeitems;
SELECT * FROM storeitems WHERE price ORDER BY price;
