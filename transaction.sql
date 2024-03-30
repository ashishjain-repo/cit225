-- Create the account table
CREATE TABLE account (
    account_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    avail_balance DOUBLE NOT NULL,
    last_activity_date DATETIME NOT NULL
);

-- Create the transaction table
CREATE TABLE transaction (
    txn_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    txn_date DATETIME,
    account_id INT UNSIGNED,
    txn_type_cd VARCHAR(1) NOT NULL,
    amount DOUBLE,
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);

-- Insert initial available balances for accounts
INSERT INTO account (account_id, avail_balance, last_activity_date)
VALUES
    (123, 500, '2019-07-10 20:53:27'),
    (789, 75, '2019-06-22 15:18:35');

-- Insert initial deposit transactions for accounts
INSERT INTO transaction (txn_id, txn_date, account_id, txn_type_cd, amount)
VALUES
    (1001, '2019-05-15 00:00:00', 123, 'C', 500),
    (1002, '2019-06-01 00:00:00', 789, 'C', 75);

-- Perform the transfer: debit $50 from account 123 and credit $50 to account 789
INSERT INTO transaction (txn_id, txn_date, account_id, txn_type_cd, amount)
VALUES
    (1003, '2020-11-29 15:02:35', 123, 'D', 50),
    (1004, '2020-11-29 15:03:04', 789, 'C', 50);

-- Update available balances in the account table
UPDATE account
SET avail_balance = avail_balance - 50
WHERE account_id = 123;

UPDATE account
SET avail_balance = avail_balance + 50
WHERE account_id = 789;

-- Validate the updated account table
SELECT * FROM account;

-- Validate the aggregated results in transaction table.
SELECT
    account_id,
    SUM(
        CASE
            WHEN txn_type_cd = 'C' THEN amount
            WHEN txn_type_cd = 'D' THEN -amount
        END
    ) AS account_balance
FROM transaction
WHERE account_id IN (123, 789)
GROUP BY account_id;
