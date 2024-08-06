
USE sakila;

SELECT * FROM actor_info;

SELECT * FROM buytbl;

SELECT userID,sun(amount)
FROM buytbl
GROUP BY userID;

SELECT userID, GROUP_CONCAT(prodName SEPARATOR ',')
FROM buytbl
GROUP BY userID;