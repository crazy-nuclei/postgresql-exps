CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    author TEXT NOT NULL,
    genre TEXT NOT NULL
);

CREATE TABLE borrowers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

CREATE TABLE borrowed_books (
    book_id INT REFERENCES books(id),
    borrower_id INT REFERENCES borrowers(id),
    borrowed_date DATE NOT NULL,
    return_date DATE DEFAULT NULL,
    PRIMARY KEY (book_id, borrower_id)
);

INSERT INTO books (title, author, genre) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction'),
('1984', 'George Orwell', 'Dystopian'),
('To Kill a Mockingbird', 'Harper Lee', 'Classic');


INSERT INTO borrowers (name, email) VALUES
('Alice Johnson', 'alice@mail.com'),
('Bob Smith', 'bob@mail.com');


INSERT INTO borrowed_books (book_id, borrower_id, borrowed_date) VALUES
(1, 1, '2025-03-15'),
(2, 2, '2025-03-20');


SELECT books.title, borrowers.name 
FROM borrowed_books
JOIN books ON borrowed_books.book_id = books.id
JOIN borrowers ON borrowed_books.borrower_id = borrowers.id
WHERE borrowed_books.return_date IS NULL;


SELECT books.title, borrowers.name 
FROM borrowed_books
JOIN books ON borrowed_books.book_id = books.id
JOIN borrowers ON borrowed_books.borrower_id = borrowers.id
WHERE books.title = '1984';


SELECT books.title, COUNT(borrowed_books.book_id) AS borrow_count
FROM borrowed_books
JOIN books ON borrowed_books.book_id = books.id
GROUP BY books.title;

