CREATE DATABASE `banking_app` ;

USE banking_app;

CREATE TABLE user (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    username VARCHAR(255) UNIQUE NOT NULL, 
    email VARCHAR(255) UNIQUE NOT NULL, 
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE account (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(id),
    account_type VARCHAR(255)  NOT NULL,
    account_number VARCHAR(255) UNIQUE NOT NULL,
    balance DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE transaction (
    id INT PRIMARY KEY AUTO_INCREMENT,
    from_account_id INT,
    FOREIGN KEY (from_account_id) REFERENCES account(id),
    to_account_id INT,
    FOREIGN KEY (to_account_id) REFERENCES account(id),
    amount DECIMAL(10, 2),
    type VARCHAR(255),
    description VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

