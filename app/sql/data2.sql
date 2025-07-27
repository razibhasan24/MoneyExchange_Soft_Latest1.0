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