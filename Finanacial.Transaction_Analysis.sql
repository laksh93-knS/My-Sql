use arjun;
select * from transactions;


-- 1. Find total number of transactions

SELECT COUNT(*) AS total_transactions
FROM transactions;

-- 2. Find total transaction amount (only successful transactions)

SELECT SUM("Amount (INR)") AS total_success_amount
FROM transactions
WHERE Status = 'SUCCESS';

-- 3. Find top 5 senders by total amount sent

SELECT "Sender Name", SUM("Amount (INR)") AS total_sent
FROM transactions
WHERE Status = 'SUCCESS'
GROUP BY "Sender Name"
ORDER BY total_sent DESC
LIMIT 5;

-- 4. Find top 5 receivers by total amount received

SELECT "Receiver Name", SUM("Amount (INR)") AS total_received
FROM transactions
WHERE Status = 'SUCCESS'
GROUP BY "Receiver Name"
ORDER BY total_received DESC
LIMIT 5;

-- 5. Find number of failed transactions

SELECT COUNT(*) AS failed_transactions
FROM transactions
WHERE Status = 'FAILED';

-- 6. Find the day with the highest number of transactions

SELECT DATE("Timestamp") AS transaction_date, COUNT(*) AS transaction_count
FROM transactions
GROUP BY transaction_date
ORDER BY transaction_count DESC
LIMIT 1;

-- 7. Find average transaction amount

SELECT AVG("Amount (INR)") AS average_amount
FROM transactions
WHERE Status = 'SUCCESS';

-- 8. List all transactions above ₹10,000

SELECT *
FROM transactions
WHERE "Amount (INR)" > 10000
ORDER BY "Amount (INR)" DESC;

-- 9. Monthly total transaction amount

SELECT EXTRACT(YEAR FROM "Timestamp") AS year,
       EXTRACT(MONTH FROM "Timestamp") AS month,
       SUM("Amount (INR)") AS monthly_total
FROM transactions
WHERE Status = 'SUCCESS'
GROUP BY year, month
ORDER BY year, month;

-- 10. Find top 5 most active senders (by number of transactions)

SELECT "Sender Name", COUNT(*) AS transaction_count
FROM transactions
GROUP BY "Sender Name"
ORDER BY transaction_count DESC
LIMIT 5;
