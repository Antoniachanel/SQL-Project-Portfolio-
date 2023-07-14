SELECT firstname,lastname
FROM customers
WHERE lastname= 'NELSON'

SELECT initcap(firstname),initcap (lastname)
FROM customers;

SELECT DISTINCT zip, SUBSTR(zip, 1,3),SUBSTR(zip, -3,2)
FROM customers
WHERE SUBSTR(zip,-3,2)<30

SELECT name, instr(name,',') "First comma",
instr(name,',',10)"Start read position 10",
instr(name,',',1,2)"Second comma"
FROM contacts;

SELECT DISTINCT LENGTH (address),address
FROM customers
ORDER BY LENGTH (address) DESC;

SELECT firstname,LPAD(firstname,12,' '),LPAD(firstname, 12,'*')
FROM customers
WHERE firstname like 'J%';

SELECT lastname, address,LTRIM(address, 'P.O. BOX')
FROM customers
WHERE state='FL';

SELECT address, REPLACE(address,'P.O.','Post Office')
FROM customers
WHERE state='FL';

SELECT name,TRANSLATE(name,',','-'), translate (name,'A','-a')
from contacts;

SELECT firstname,lastname,
CONCAT('Customer number:', customer#) "Number"
FROM customers
WHERE state='FL';

select title, retail, ROUND(retail,0), ROUND(retail,1),ROUND (retail,-1)
from books;

select title, retail, TRUNC (retail,1),TRUNC (retail,0),TRUNC(retail,-1)
FROM books;

select 235/16
FROM dual;

SELECT TRUNC(235/16,0) LBS, MOD(235,16) OZ
from dual;

SELECT pubdate,SYSDATE,ROUND(pubdate-SYSDATE)"Days",
    ABS(ROUND(pubdate-SYSDATE)) "ABS Days"
FROM books
WHERE category='CHILDREN';

SELECT order#,shipdate,orderdate,(shipdate-orderdate) DELAY
FROM orders
WHERE order#=1004;

SELECT title, MONTHS_BETWEEN(orderdate,pubdate)MTHS
FROM books JOIN orderitems USING (isbn)
    JOIN orders USING (order#)
WHERE order#=1004;

SELECT title, pubdate, ADD_MONTHS('01-DEC-08',18) "Renegotiate Date", 
    ADD_MONTHS(pubdate, 84) "Drop Date"
FROM books
WHERE category ='COMPUTER'
ORDER BY "Renegotiate Date";

SELECT order#,orderdate, NEXT_DAY(orderdate, 'MONDAY')
FROM orders
WHERE order#=1018;

SELECT order#, orderdate,shipdate
FROM orders
WHERE orderdate =TO_DATE('March 31, 2009', 'Month,DD,YYYY');

SELECT pubdate, ROUND(pubdate, 'MONTH'), ROUND(pubdate,'YEAR')
FROM books;

SELECT *
FROM suppliers
WHERE REGEXP_LIKE(description, '[0-9]{3}[-.][0-9]{3}[-.][0-9]{4}');

SELECT order#,orderdate,shipdate,
    nvl(shipdate,'06-APR-09')-orderdate "SHIP DAYS"
 FROM orders
 WHERE orderdate>= '03-APR-09';
 
 SELECT order#,orderdate,
    nvl2(shipdate,'Shipped','Not Shipped') "Status"
    FROM orders
    WHERE orderdate>= '03-APR-09';
    
SELECT o.customer#,order#, isbn, oi.paideach,b.retail,
    nullif(oi.paideach,b.retail)
FROM orders o JOIN orderitems oi
    USING (order#)
    JOIN books b USING (isbn)
WHERE order# IN (1001,1007)
ORDER BY order#;

SELECT title,
    TO_CHAR(pubdate,'MONTH DD, YYYY') "Publication Date",
    TO_CHAR(retail,'$999.99')"Retail Price"
FROM books
WHERE isbn= 0401140733;

SELECT customer#,state,
    DECODE (state,'CA',.08,
                 'FL',.07,
                        0) "Sales Tax Rate"
FROM customers
WHERE state IN ('CA','FL','GA','TX');

SELECT customer#,lastname,firstname
FROM customers
WHERE SOUNDEX(lastname)=SOUNDEX('smyth');

SELECT title,pubdate,
    TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))-TO_NUMBER(TO_CHAR(pubdate,'YYYY'))
    "Yrs"
FROM books
WHERE category='COMPUTER';

SELECT round(4769.43,-2), LENGTH ('Hello')
FROM dual; 