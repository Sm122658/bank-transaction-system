-- Q1: Current balance of all customers
SELECT 
    c.customer_id,
    c.full_name,
    a.account_type,
    a.balance,
    a.status
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id;

-- Q2: Full transaction history of a customer
SELECT 
    c.full_name,
    t.transaction_type,
    t.amount,
    t.balance_after,
    t.remarks,
    t.transaction_date
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
JOIN Customers c ON a.customer_id = c.customer_id
WHERE c.customer_id = 1
ORDER BY t.transaction_date DESC;

-- Q3: Total Credits vs Debits per account
SELECT 
    a.account_id,
    c.full_name,
    SUM(CASE WHEN t.transaction_type = 'Credit' THEN t.amount ELSE 0 END) AS total_credits,
    SUM(CASE WHEN t.transaction_type = 'Debit'  THEN t.amount ELSE 0 END) AS total_debits,
    COUNT(t.transaction_id) AS total_transactions
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
JOIN Customers c ON a.customer_id = c.customer_id
GROUP BY a.account_id, c.full_name;

-- Q4: Monthly transaction summary (MIS Report style!)
SELECT 
    DATE_FORMAT(transaction_date, '%Y-%m') AS month,
    transaction_type,
    COUNT(*)                               AS num_transactions,
    SUM(amount)                            AS total_amount
FROM Transactions
GROUP BY month, transaction_type
ORDER BY month;

-- Q5: High value transactions (above 10,000)
SELECT 
    c.full_name,
    t.transaction_type,
    t.amount,
    t.remarks,
    t.transaction_date
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
JOIN Customers c ON a.customer_id = c.customer_id
WHERE t.amount > 10000
ORDER BY t.amount DESC;

-- Q6: Customers with balance below 25,000 (Risk Alert)
SELECT 
    c.full_name,
    c.phone,
    a.account_type,
    a.balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
WHERE a.balance < 25000
ORDER BY a.balance ASC;
