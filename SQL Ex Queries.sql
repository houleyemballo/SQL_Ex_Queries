
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
/*Adding DIFFERENTIAL to the query will backup the updated parts or the parts
that have changed since the last update. 
This reduces the time required to backup compared to a full backup*/

BACKUP DATABASE db_name 
TO DISK = "/home/databases/db_name-backup.bak"
WITH DIFFERENTIAL;

--24. Restore Database Backups

RESTORE DATABASE db_name 
TO DISK="/home/databases/db_name-backup.bak"

--25. Copy Results of a Query into a Table

INSERT INTO high_paid_authors 
SELECT * FROM authors WHERE author_pay > 50000;

--26. Creating Stored Procedures
/* Stored procedures are SQL queries that can be run repeatedly. 
This saves you time when the queries are big. 
You can save them with a procedure name and then execute 
the procedure whenever required*/

CREATE PROCEDURE findAuthors 
AS SELECT * FROM authors GO;

--27. Boolean Operators for SQL Queries

DELETE FROM authors WHERE author_email="john@journaldev.com"
OR author_email="jane@journaldev.com";

DELETE FROM authors WHERE author_email="john@journaldev.com"
AND author_email="jane@journaldev.com";

--28. Find Values Between a Range

--BETWEEN keyword that helps us return the rows that have a value 
that is between the specified range.

SELECT *  FROM authors WHERE author_pay 
BETWEEN 50000 AND 100000

--29. Negating Queries or Expressions in SQL Queries

-- NOT keyword which negates any expression that follows and returns a 
value that is opposite.

SELECT *  FROM authors WHERE author_pay 
NOT BETWEEN 50000 AND 100000

--30. Finding Minimum Values

SELECT MIN(author_pay) FROM authors;

--31. Finding Maximum Values

SELECT MAX(author_pay) FROM authors;

--32. Creating Aliases

SELECT author_name AS "Author Name", author_email 
AS "Author Emails" FROM authors;

SELECT MIN(author_pay) AS "Lowest Salary" FROM authors;


--33.  Inner Join Two Tables
--Inner Joins will return all the matched values from both the tables.

SELECT authors.author_name, authors.author_email, 
author_submissions.article_title 
FROM authors
INNER JOIN author_submissions 
ON authors.author_email=author_submissions.author_email;

--34. Left Outer Join

/*Compared to the Inner join above, Left Outer Joins 
will return all the values from
the left table and only the matching values from the right table.
For rows from the right table which do not get matched,
the left join will mark them as NULL. */

SELECT authors.author_name, authors.author_email, 
author_submissions.article_title 
FROM authors
LEFT JOIN author_submissions 
ON authors.author_email=author_submissions.author_email

--35. Right Outer Join

/*The right outer join, in contrast to the left outer join, 
will return all values from the right table while only 
returning the matched values from the left table and 
displaying NULL for empty rows.*/

SELECT authors.author_name, authors.author_email, 
author_submissions.article_title FROM authors
RIGHT JOIN author_submissions 
ON authors.author_email=author_submissions.author_email

--36. Full Outer Joins

/*The Full outer join combines the functionality of the 
Right and the Left Join in one. 
It returns all the values from both the tables
and makes NULL for rows that do not have a match.*/

SELECT authors.author_name, authors.author_email, 
author_submissions.article_title 
FROM authors
FULL OUTER JOIN author_submissions 
ON authors.author_email=author_submissions.author_email

--37. Self Join

/*
A self join is a statement in which a table is joined with itself, 
an inner join is performed on a single table with itself, 
particularly in cases when comparisons have to be 
made between the records of the same table 
to determine a relationship or in the cases 
when the table has a foreign key whih references its own primary.

*/

SELECT a1.author_name AS Author_A, a2.author_name 
AS Author_B, a1.author_email FROM authors a1, authors a2;

--38. Case Statements in SQL Queries
/*When listing data from a table, you can add a custom column that 
displays information conditionally based 
on the data that is being compared with.*/

SELECT author_name, author_pay, 
CASE
WHEN author_pay < 30000 THEN "New author"
WHEN author_pay > 60000 THEN "Experienced Author"
ELSE "Budding author"
END AS "Author Experience"
FROM authors

--39. Handling NULL Values in Table Outputs

SELECT author_name, IFNULL(author_pay, 10000) 
AS "Pay" FROM authors;

/*The above query will return the values of the authors and the 
salaries that are being paid to them. 
If an author does not have a salary listed, 
it will automatically display 10,000 for the NULL value.*/

--40. Testing For NULL Values

/*If you have a list of values that are being passed to the 
SQL database and you need to test them for NULL-ness, 
you can use the COALESCE function. */

SELECT COALESCE(author_name, author_pay) 
AS "Coalesce Example"

--40. Joining Two Strings

/*You can concatenate two strings with the 
help of the CONCAT function. */

SEELCT CONCAT ('String 1', 'String2')

--41. Replace Characters
/*a way to use Regex to replace characters 
with other characters*/

SELECT TRANSLATE(author_name, 'j', 'c') from authors

--42. Change String Case

SELECT UPPER(author_name) FROM authors;
SELECT LOWER(author_name) FROM authors;

--43. Typecasting Input Data

SELECT CAST(<value> AS <datatype>);
SELECT CAST("hello" AS varchar(50));

--44. Check if Values are Numeric

SELECT ISNUMERIC(52);

--45. Return ASCII Values

SELECT ASCII("Hello");

--46. Find a String in Another String
--To check for occurrences of values between two columns, 
you can use the INSTR function

SELECT INSTR(author_name, author_email) 
AS MatchName from authors;

--47. Trim Whitespace

SELECT TRIM(author_name) 
AS "Trimmed Names" FROM authors;

--48. Ordering Queries

SELECT * FROM student ORDER BY age;

