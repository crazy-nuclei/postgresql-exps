CREATE TABLE accounts (
    account_id SERIAL PRIMARY KEY,
    customer_name TEXT NOT NULL,
    balance DECIMAL(10,2) NOT NULL CHECK (balance >= 0)
);


CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    account_id INT REFERENCES accounts(account_id),
    amount DECIMAL(10,2) NOT NULL,
    transaction_type TEXT CHECK (transaction_type IN ('DEPOSIT', 'WITHDRAWAL')),
    transaction_date TIMESTAMP DEFAULT NOW()
);


INSERT INTO accounts (customer_name, balance) VALUES
('Alice', 1000.00),
('Bob', 500.00);


select * from accounts;
select * from transactions;


BEGIN;

UPDATE accounts 
SET balance = balance + 200.00 
WHERE account_id = 1;

INSERT INTO transactions (account_id, amount, transaction_type) 
VALUES (1, 200.00, 'DEPOSIT');

COMMIT;




DO $$ 
DECLARE row_count INT;
BEGIN
    -- Attempt to withdraw money
    UPDATE accounts 
    SET balance = balance - 300.00 
    WHERE account_id = 2 
    AND balance >= 300.00;

    -- Get the number of affected rows
    GET DIAGNOSTICS row_count = ROW_COUNT;
    
    -- If no row was updated, rollback
    IF row_count = 0 THEN
        RAISE NOTICE 'Insufficient balance, rolling back transaction';
        ROLLBACK;
    ELSE
        -- Insert transaction record
        INSERT INTO transactions (account_id, amount, transaction_type) 
        VALUES (2, 300.00, 'WITHDRAWAL');

        COMMIT;
    END IF;
END $$;



