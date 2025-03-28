
CREATE TABLE contacts (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    phone_number TEXT NOT NULL UNIQUE,
    email TEXT UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);


INSERT INTO contacts (name, phone_number, email) VALUES
('Alice Johnson', '1234567890', 'alice@mail.com'),
('Bob Smith', '2345678901', 'bob@mail.com'),
('Charlie Brown', '3456789012', 'charlie@mail.com');


UPDATE contacts 
SET phone_number = '9998887777' 
WHERE name = 'Alice Johnson';


SELECT * FROM contacts 
ORDER BY name ASC;


SELECT * FROM contacts 
ORDER BY created_at DESC;



















