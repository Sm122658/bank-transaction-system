INSERT INTO Customers (full_name, email, phone, city) VALUES
('Priya Sharma',  'priya@email.com',  '9876543210', 'Chennai'),
('Ravi Kumar',    'ravi@email.com',   '9876543211', 'Bangalore'),
('Anita Nair',    'anita@email.com',  '9876543212', 'Mumbai'),
('Suresh Babu',   'suresh@email.com', '9876543213', 'Coimbatore'),
('Meena Devi',    'meena@email.com',  '9876543214', 'Delhi');

INSERT INTO Accounts (customer_id, account_type, balance) VALUES
(1, 'Savings',  50000.00),
(2, 'Current', 120000.00),
(3, 'Savings',  75000.00),
(4, 'Loan',     30000.00),
(5, 'Savings',  20000.00);

INSERT INTO Transactions (account_id, transaction_type, amount, balance_after, remarks) VALUES
(1, 'Credit', 10000.00, 60000.00, 'Salary credit'),
(1, 'Debit',   5000.00, 55000.00, 'ATM withdrawal'),
(2, 'Credit', 25000.00,145000.00, 'Client payment received'),
(2, 'Debit',  15000.00,130000.00, 'Vendor payment'),
(3, 'Credit',  8000.00, 83000.00, 'UPI transfer received'),
(3, 'Debit',   3000.00, 80000.00, 'Online shopping'),
(4, 'Debit',   5000.00, 25000.00, 'EMI deducted'),
(5, 'Credit',  2000.00, 22000.00, 'Cash deposit'),
(1, 'Debit',   2000.00, 53000.00, 'Bill payment'),
(2, 'Credit', 10000.00,140000.00, 'Advance payment');
