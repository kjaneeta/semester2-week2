-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 library.db
-- 2. Load this script: .read code.sql
-- 3. Exit SQLite: .exit


-- write your sql code here
-- 1. **List all loans**  
-- Show book title, member name, and loan date.

SELECT Books.title AS Book_title, Members.name AS member_name, Loans.loan_date AS Loan_date
FROM Loans 
JOIN Books ON Loans.book_id=Books.id
JOIN Members ON Loans.member_id=Members.id;

-- 2. **Books and loans**  
-- List all books and any loans associated with them.
SELECT Books.title AS Book_title, Loans.loan_date AS Loan_date
FROM Books LEFT JOIN Loans ON Books.id=Loans.book_id;

