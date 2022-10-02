
Example02Sub03.sql
************************************************************************
SELECT *
FROM customers;



Example02Sub05.sql
************************************************************************
SELECT title
FROM books;



Example02Sub08.sql
************************************************************************
SELECT title, pubdate
FROM books;



Example02Sub09.sql
************************************************************************
SELECT title,pubdate FROM books;



Example02Sub12.sql
************************************************************************
SELECT title AS "Title of Books", category
FROM books;



Example02Sub13.sql
************************************************************************
SELECT title, retail price
FROM books;



Example02Sub14.sql
************************************************************************
SELECT title, retail-cost profit
FROM books;



Example02Sub15.sql
************************************************************************
SELECT DISTINCT state
FROM customers;



Example03Sub03.sql
************************************************************************
SELECT lastname, state
FROM customers
WHERE state = 'FL';



Example03Sub05.sql
************************************************************************
SELECT *
FROM customers
WHERE customerId = 1010




Example03Sub06.sql
************************************************************************
SELECT * 
FROM books
WHERE ISBN = 1915762492




Example03Sub07.sql
************************************************************************
SELECT * 
FROM books
WHERE pubdate = '21-JAN-01'




Example03Sub08.sql
************************************************************************
SELECT title, retail
FROM books
WHERE retail > 55




Example03Sub09.sql
************************************************************************
SELECT title
FROM books
WHERE title > 'ST'




Example03Sub11.sql
************************************************************************
SELECT title, retail-cost profit
FROM books
WHERE retail-cost < cost*.2




Example03Sub12.sql
************************************************************************
SELECT firstname, lastname, state
FROM customers
WHERE state <= 'GA'





Example03Sub13.sql
************************************************************************
SELECT firstname, lastname, state
FROM customers
WHERE state >= 'GA'





Example03Sub14.sql
************************************************************************
SELECT firstname, lastname
FROM customers
WHERE state <> 'GA'





Example03Sub15.sql
************************************************************************
SELECT title, pubid
FROM books
WHERE pubid BETWEEN 1 AND 3





Example03Sub16.sql
************************************************************************
SELECT title, pubid
FROM books
WHERE pubid IN (1, 2, 5)





Example03Sub17.sql
************************************************************************
SELECT lastname
FROM customers
WHERE lastname LIKE 'P%'





Example03Sub18.sql
************************************************************************
SELECT customerId, lastname, firstname
FROM customers
WHERE customerId LIKE '10_9'





Example03Sub19.sql
************************************************************************
SELECT isbn, title
FROM books
WHERE isbn LIKE '_4%0'





Example03Sub20.sql
************************************************************************
SELECT title, pubid, category
FROM books
WHERE pubid = 3
AND category = 'COMPUTER'



Example03Sub21.sql
************************************************************************
SELECT title, pubid, category
FROM books
WHERE pubid = 3
OR category = 'COMPUTER'





Example03Sub22.sql
************************************************************************
SELECT * FROM books
WHERE category = 'FAMILY LIFE'
OR pubid = 4
AND cost>15





Example03Sub23.sql
************************************************************************
SELECT * FROM books
WHERE (category = 'FAMILY LIFE'
OR pubid = 4)
AND cost>15





Example03Sub24.sql
************************************************************************
SELECT orderId
FROM orders
WHERE shipdate IS NULL





Example03Sub25.sql
************************************************************************
SELECT orderId
FROM orders
WHERE shipdate IS NOT NULL





Example03Sub27.sql
************************************************************************
SELECT *
FROM publisher
ORDER BY name





Example03Sub28.sql
************************************************************************
SELECT *
FROM publisher
ORDER BY name desc





Example03Sub29.sql
************************************************************************
SELECT  pubid, name "Publisher Name", contact, phone
FROM publisher
ORDER BY "Publisher Name"





Example03Sub30.sql
************************************************************************
SELECT  lastname, firstname, referred
FROM customers	
ORDER BY referred





Example03Sub32.sql
************************************************************************
SELECT  lastname, firstname, city, state
FROM customers	
ORDER BY state desc, city





Example03Sub33.sql
************************************************************************
SELECT  lastname, firstname, city, state
FROM customers
WHERE state = 'FL'
OR state = 'CA'	
ORDER BY state desc, city




Example04Sub07.sql
************************************************************************
SELECT title, name
FROM books, publisher
WHERE books.pubid = publisher.pubid




Example04Sub08.sql
************************************************************************
SELECT title, books.pubid, name
FROM publisher, books
WHERE publisher.pubid = books.pubid
AND publisher.pubid = 4




Example04Sub09.sql
************************************************************************
SELECT title, p.pubid, name
FROM publisher p, books b
WHERE p.pubid = b.pubid
AND (cost<15 OR b.pubid = 1)
ORDER BY title




Example04Sub12.sql
************************************************************************
SELECT title, pubid, name
FROM books JOIN publisher
USING (pubid)




Example04Sub13.sql
************************************************************************
SELECT title, name
FROM books b JOIN publisher p
ON b.pubid = p.pubid




Example04Sub14.sql
************************************************************************
SELECT title, books.pubid, name
FROM publisher JOIN books
ON books.pubid = publisher.pubid
WHERE books.pubid=4




Example04Sub15.sql
************************************************************************
SELECT *
FROM promotion




Example04Sub16.sql
************************************************************************
SELECT title, gift
FROM books, promotion
WHERE retail
BETWEEN minretail AND maxretail




Example04Sub17.sql
************************************************************************
SELECT title, gift
FROM books JOIN promotion
ON retail BETWEEN minretail AND maxretail




Example04Sub18.sql
************************************************************************
SELECT r.firstname, r.lastname, c.lastname referred
FROM customers c, customers r
WHERE c.referred=r.customerId




Example04Sub19.sql
************************************************************************
SELECT r.firstname, r.lastname, c.lastname referred
FROM customers c JOIN customers r
ON c.referred = r.customerId




Example04Sub20.sql
************************************************************************
SELECT lastname, firstname, orderId
FROM customers c, orders o
WHERE c.customerId = o.customerId
ORDER BY c.customerId




Example04Sub21.sql
************************************************************************
SELECT lastname, firstname, orderId
FROM customers c, orders o
WHERE c.customerId = o.customerId(+)
ORDER BY c.customerId




Example04Sub22.sql
************************************************************************
SELECT lastname, firstname, orderId
FROM customers c LEFT OUTER JOIN orders o
ON c.customerId = o.customerId
ORDER BY c.customerId




Example04Sub23.sql
************************************************************************
SELECT lastname, firstname, orderId
FROM customers c RIGHT OUTER JOIN orders o
ON c.customerId = o.customerId
ORDER BY c.customerId




Example04Sub25.sql
************************************************************************
SELECT customerId FROM customers
UNION
SELECT customerId FROM orders




Example04Sub26.sql
************************************************************************
SELECT customerId FROM customers
UNION ALL
SELECT customerId FROM orders




Example04Sub27.sql
************************************************************************
SELECT customerId FROM customers
INTERSECT
SELECT customerId FROM orders




Example04Sub28.sql
************************************************************************
SELECT customerId FROM customers
MINUS
SELECT customerId FROM orders




Example04Sub29.sql
************************************************************************
SELECT title, firstname, lastname
FROM customers, orders, orderitems, books
WHERE customers.customerId = orders.customerId
AND orders.orderId=orderitems.orderId
AND orderitems.isbn = books.isbn
ORDER BY title




Example04Sub30.sql
************************************************************************
SELECT title, firstname, lastname
FROM customers JOIN orders ON customers.customerId = orders.customerId
JOIN orderitems ON orders.orderId=orderitems.orderId
JOIN books ON orderitems.isbn = books.isbn
ORDER BY title




Example04Sub31.sql
************************************************************************
SELECT firstname, lastname
FROM customers, orders, orderitems
WHERE customers.CustomerId = orders.CustomerId
AND orders.ORDERId = orderitems.ORDERId
ORDER BY lastname




Example05Sub02.sql
************************************************************************
SELECT firstname, lastname
FROM customers
WHERE LOWER(lastname) = 'nelson';



Example05Sub03.sql
************************************************************************
SELECT LOWER(firstname), LOWER(lastname)
FROM customers
WHERE LOWER(lastname) = 'nelson';



Example05Sub04.sql
************************************************************************
SELECT firstname, lastname
FROM customers
WHERE lastname = UPPER('nelson');



Example05Sub11.sql
************************************************************************
SELECT REPLACE(address, 'P.O. ', 'POST OFFICE ')
FROM customers;




Example05Sub21.sql
************************************************************************
SELECT orderId, orderdate, shipdate, shipdate-orderdate "Delay"
FROM orders;



Example07Sub03.sql
************************************************************************
SELECT title, cost
FROM books
WHERE cost > 31.4
AND category = 'COMPUTER'



Example07Sub04.sql
************************************************************************
SELECT title, cost
FROM books
WHERE cost > 
	(SELECT cost
	FROM books
	WHERE title = 'DATABASE IMPLEMENTATION')
AND category = 'COMPUTER'



Example07Sub06.sql
************************************************************************
SELECT title
FROM books
WHERE retail = 
	       (SELECT MAX(retail)cost
	        FROM books)



Example07Sub07.sql
************************************************************************
SELECT isbn, title
FROM books
WHERE pubid =
	(SELECT pubid
	 FROM books
	 WHERE title = 'BIG BEAR AND LITTLE DOVE')
AND retail-cost >
	(SELECT AVG(retail-cost)
	 FROM books)



Example07Sub08.sql
************************************************************************
SELECT category, AVG(retail-cost) "Average Profit"
FROM books
GROUP BY category
HAVING AVG(retail-cost) >
			(SELECT AVG(retail-cost)
			 FROM books
			 WHERE category = 'LITERATURE')



Example07Sub09.sql
************************************************************************
SELECT title, retail,
                     (SELECT AVG(retail)
                      FROM books) "Overall Average"
FROM books




Example07Sub10.sql
************************************************************************
SELECT title, retail, category
FROM books
WHERE retail IN
		(SELECT MAX(retail)
		 FROM books
		 GROUP BY category)
ORDER BY category



Example07Sub12.sql
************************************************************************
SELECT retail
FROM books
WHERE category = 'COOKING'



Example07Sub13.sql
************************************************************************
SELECT title, retail
FROM books
WHERE retail > ALL
		(SELECT retail
		 FROM books
		 WHERE category = 'COOKING')



Example07Sub14.sql
************************************************************************
SELECT title, retail
FROM books
WHERE retail < ALL
		(SELECT retail
		 FROM books
		 WHERE category = 'COOKING')



Example07Sub15.sql
************************************************************************
SELECT title, retail
FROM books
WHERE retail < ANY
                  (SELECT retail
                   FROM books
                   WHERE category = 'COOKING')



Example07Sub16.sql
************************************************************************
SELECT title, retail
FROM books
WHERE retail > ANY
                  (SELECT retail
                   FROM books
                   WHERE category = 'COOKING')



Example07Sub18.sql
************************************************************************
SELECT title
FROM books
WHERE EXISTS
             (SELECT isbn
              FROM orderitems
              WHERE books.isbn = orderitems.isbn)




Example07Sub19.sql
************************************************************************
SELECT title
FROM books
WHERE NOT EXISTS
             (SELECT isbn
              FROM orderitems
              WHERE books.isbn = orderitems.isbn)




Example07Sub21.sql
************************************************************************
SELECT title, cost
FROM books
WHERE cost >
             (SELECT AVG(cost)
              FROM books
              GROUP BY category)




Example07Sub22.sql
************************************************************************
SELECT b.title, b.retail, a.category, a.cataverage
FROM books b, (SELECT category, AVG(retail) cataverage
	       FROM books
	       GROUP BY category) a
WHERE b.category = a.category
and b.retail > a.cataverage



Example07Sub27.sql
************************************************************************
SELECT DISTINCT title
FROM books JOIN orderitems
ON books.ISBN = orderitems.ISBN
WHERE orderId IN  
                (SELECT orderId
                 FROM orders
                 WHERE shipdate IS NULL)






