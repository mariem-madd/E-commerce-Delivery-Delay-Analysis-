
CREATE DATABASE delivery_analytics;
USE delivery_analytics;

-- CREATE DIMENSIONS FIRST (Required for Foreign Keys)
CREATE TABLE DIM_CUSTOMER (
    customer_id INT PRIMARY KEY,
    customer_city VARCHAR(100), customer_state VARCHAR(100),
    customer_country VARCHAR(100), customer_segment VARCHAR(50)
);

CREATE TABLE DIM_PRODUCT (
    product_card_id INT PRIMARY KEY,
    product_category_id INT,
    product_name VARCHAR(255), category_name VARCHAR(100),
    product_price DECIMAL
);

CREATE TABLE DIM_ORDER (
    order_id INT PRIMARY KEY, 
    order_country VARCHAR(100), order_city VARCHAR(100), 
    order_status VARCHAR(50),
    shipping_type VARCHAR(50), payment_type VARCHAR(50)
);

-- CREATE THE FACT TABLE
CREATE TABLE FACT_DELIVERY (
    order_id INT, customer_id INT, product_card_id INT,
    order_item_quantity DECIMAL(10, 2), order_item_total_amount DECIMAL(15, 2), 
    sales DECIMAL(15, 2), profit_per_order DECIMAL(15, 2),
    order_date date ,shipping_date date,
    delivery_status VARCHAR(50), is_delayed TINYINT(1),
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES DIM_CUSTOMER(customer_id),
    FOREIGN KEY (product_card_id) REFERENCES DIM_PRODUCT(product_card_id),
    FOREIGN KEY (order_id) REFERENCES DIM_ORDER(order_id)

);

