CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    price DECIMAL(8,2),
    published_date DATE,
    in_stock INT DEFAULT 1
);
desc books;
-- Insert 5 Records
INSERT INTO Books (book_title, isbn, price, published_date, in_stock)
VALUES
('Python Programming', 'ISBN2001', 750, '2021-02-10', 15),
('Artificial Intelligence', 'ISBN2002', 900, '2023-05-18', 8),
('Web Development', 'ISBN2003', 650, '2020-11-22', 12),
('Cloud Computing', 'ISBN2004', 800, '2019-08-14', 6);
INSERT INTO Books (title, isbn, price, published_date)
VALUES
('Machine Learning', 'ISBN2005', 950, '2024-01-15');

-- Rename the Column
ALTER TABLE Books
RENAME COLUMN title TO book_title;

-- Change Data Type of price

ALTER TABLE Books
MODIFY COLUMN price FLOAT;

-- Add author_name Column

ALTER TABLE Books
ADD COLUMN author_name VARCHAR(50) NOT NULL DEFAULT 'Unknown';

-- Give 10% Discount

UPDATE Books
SET price = price * 0.90
WHERE published_date < '2005-09-20';

-- Delete Out-of-Stock Books

DELETE FROM Books
WHERE in_stock = 0;

-- Reset Auto Increment 

ALTER TABLE Books
AUTO_INCREMENT = 101;

-- Display History Books

SELECT book_title, price, published_date
FROM Books
WHERE book_title LIKE '%History%'
AND price > 300
ORDER BY price DESC;

-- Create Members Table and Display Members Joined in 2024

CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    member_name VARCHAR(100) NOT NULL,
    join_date DATE NOT NULL DEFAULT (CURDATE())
);