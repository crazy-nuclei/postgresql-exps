CREATE DATABASE my_database;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INT CHECK (age > 0)
);

INSERT INTO users (name, email, age) 
VALUES 
    ('Alice', 'alice@example.com', 25),
    ('Bob', 'bob@example.com', 30),
    ('Charlie', 'charlie@example.com', 28);


UPDATE users 
SET age = 31 
WHERE name = 'Bob';


DELETE FROM users 
WHERE name = 'Charlie';


SELECT * FROM users;

SELECT * FROM users 
WHERE age > 25;


SELECT * FROM users 
ORDER BY age DESC;


SELECT age, COUNT(*) 
FROM users 
GROUP BY age 
HAVING COUNT(*) > 1;

