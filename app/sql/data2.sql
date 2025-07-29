-- Create core_mex_orders table
CREATE TABLE core_mex_orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_total DECIMAL(10,2) NOT NULL,
    status_id INT NOT NULL,
    paid_amount DECIMAL(10,2) DEFAULT 0.00,
    remarks TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


INSERT INTO core_mex_orders (customer_id, order_date, order_total, status_id, paid_amount, remarks, created_at, updated_at)
VALUES
(101, '2025-07-01', 500.00, 1, 500.00, 'First order', NOW(), NOW()),
(102, '2025-07-05', 750.00, 2, 400.00, 'Partial payment', NOW(), NOW()),
(103, '2025-07-10', 1200.00, 1, 1200.00, 'Paid in full', NOW(), NOW()),
(104, '2025-07-15', 900.00, 3, 0.00, 'Pending payment', NOW(), NOW()),
(105, '2025-07-20', 650.00, 2, 650.00, 'Completed', NOW(), NOW());


-- Create core_mex_order_details table
CREATE TABLE core_mex_order_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    currency_id INT NOT NULL,
    qty INT NOT NULL,
    rate DECIMAL(10,2) NOT NULL,
    vat DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (order_id) REFERENCES core_mex_orders(id)
);

INSERT INTO core_mex_order_details (order_id, currency_id, qty, rate, vat)
VALUES
(1, 1, 2, 250.00, 25.00),
(2, 1, 1, 750.00, 75.00),
(3, 2, 3, 400.00, 60.00),
(4, 1, 2, 450.00, 90.00),
(5, 3, 1, 650.00, 65.00);

CREATE TABLE `core_mex_users` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(150) NOT NULL,
    `role_id` INT UNSIGNED NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `full_name` VARCHAR(255),
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `photo` VARCHAR(255),
    `verify_code` VARCHAR(100),
    `inactive` TINYINT(1) DEFAULT 0,
    `mobile` VARCHAR(20),
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `ip` VARCHAR(45),
    `email_verified_at` DATETIME NULL,
    `remember_token` VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `core_mex_users` (
    `name`, `role_id`, `password`, `email`, `full_name`, `created_at`, `photo`, 
    `verify_code`, `inactive`, `mobile`, `updated_at`, `ip`, `email_verified_at`, `remember_token`
) VALUES (
    'jdoe',              
    2,                   
    '$2y$10$examplehash',
    'jdoe@example.com', 
    'John Doe',          
    NOW(),               
    'profile1.jpg',      
    'ABCD1234',        
    0,                 
    '+1234567890',       
    NOW(),               
    '192.168.1.10',    
    NOW(),               
    'some_random_token'  
);
