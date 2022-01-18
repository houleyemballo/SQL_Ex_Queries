
--1. Create Databases and Tables

CREATE db_name;
/* Use the specified database for executing further queries */
USE db_name;
CREATE TABLE authors (author_name VARCHAR(70), author_email VARCHAR(80), author_pay int);

--2. SQL Queries to Insert Single Values into Tables

INSERT INTO authors (author_name, author_email) 
VALUES("Joe", "joe@journaldev.com", 50000);

--3. Insert Multiple Values into Tables

INSERT INTO authors (author_name, author_email) 
VALUES ("Joe", "joe@journaldev.com", 50000),
("Jane", "jane@journaldev.com", 70000),
("John", "john@journaldev.com", 20000);

--4. SQL Queries to Retrieve All Data From A Table

SELECT * FROM authors;

--5. Retrieve Specific Columns From A Table

SELECT author_name FROM authors;

--6. Retrieve Specific Data with WHERE Keyword

SELECT * FROM authors WHERE author_email = "jane@journaldev.com";

--7. SQL Queries to Update Single Rows

UPDATE authors SET author_name="Jordan" where
author_email="joe@jornaldev.com";

--8. Update Multiple Rows

UPDATE authors SET author_name="Jordan";

--9. Delete Single Row

DELETE FROM authors WHERE author_email="john@journaldev.com";

--10.  Delete Multiple Rows

DELETE FROM authors WHERE author_email="john@journaldev.com"
OR author_email="jane@journaldev.com";

--11. Counting Rows

SELECT COUNT(author_email) FROM authors;

--12. Get a Sum for Data

SELECT COUNT(author_email) FROM authors;

--13. Get Average Values for Data

SELECT AVG(author_pay) FROM authors;

--14. Creating Views

CREATE VIEW high_pay_authors AS SELECT * FROM authors 
WHERE author_pay > 50000;

--15. Add Columns to a Table

ALTER TABLE authors ADD author_age int;

--16. Remove Column From a Table

ALTER TABLE authors DROP COLUMN author_age;

--17. SQL Queries to Search for Values

SELECT * FROM authors WHERE author_name LIKE "j%"

--18. Swapping Data From Columns

UPDATE authors SET author_email=author_name, author_name=author_email

--19. Rename Tables

sp_RENAME authors authors_renamed;

--20. Return Unique Values from a Table

SELECT DISTINCT author_name FROM authors;

--21. SQL Queries for Subsetting Tables

SELECT TOP 50 FROM authors;

--22. SQL Queries to Backup Databases

BACKUP DATABASE db_name 
TO DISK = "/home/databases/db_name-backup.db";

--23. Backup Only Updated Part of Database
/*Adding DIFFERENTIAL to the query will backup the updated parts or the parts that have changed since the last update. This reduces the time required to backup compared to a full backup*/

BACKUP DATABASE db_name 
TO DISK = "/home/databases/db_name-backup.bak"
WITH DIFFERENTIAL;

--24. Restore Database Backups

RESTORE DATABASE db_name 
TO DISK="/home/databases/db_name-backup.bak"

--25. Copy Results of a Query into a Table

INSERT INTO high_paid_authors 
SELECT * FROM authors WHERE author_pay > 50000;