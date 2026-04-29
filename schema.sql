-- ============================================
-- PROJECT: Bank Transaction System
-- Author: Monisha
-- Description: SQL project for banking domain
-- ============================================

CREATE DATABASE BankTransactionSystem;
USE BankTransactionSystem;

CREATE TABLE Customers (
    customer_id   INT PRIMARY KEY AUTO_INCREMENT,
    full_name     VARCHAR(100) NOT NULL,
    email         VARCHAR(100) UNIQUE NOT NULL,
    phone         VARCHAR(15),
    city          VARCHAR(50),
    created_date  DATE DEFAULT (CURRENT_DATE)
);

CREATE TABLE Accounts (
    account_id     INT PRIMARY KEY AUTO_INCREMENT,
    customer_id    INT NOT NULL,
    account_type   VARCHAR(20) CHECK (account_type IN ('Savings','Current','Loan')),
    balance        DECIMAL(15,2) DEFAULT 0.00,
    status         VARCHAR(10) DEFAULT 'Active',
    opened_date    DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Transactions (
    transaction_id    INT PRIMARY KEY AUTO_INCREMENT,
    account_id        INT NOT NULL,
    transaction_type  VARCHAR(10) CHECK (transaction_type IN ('Credit','Debit')),
    amount            DECIMAL(15,2) NOT NULL,
    balance_after     DECIMAL(15,2),
    remarks           VARCHAR(200),
    transaction_date  DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);
