-- Creating the Schema
CREATE SCHEMA IF NOT EXISTS Coupon;

-- Dropping all tables for reset
 -- DROP TABLE customers_vs_coupons, coupon.companies, coupon.coupons, coupon.customers, coupon.customers_vs_coupons;

-- Need to select default schema before executing
-- Creating the "companies" table
CREATE TABLE IF NOT EXISTS COMPANIES (ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL, NAME VARCHAR(225) NOT NULL, EMAIL VARCHAR(225) NOT NULL, PASSWORD VARCHAR(225) NOT NULL);
ALTER TABLE COMPANIES AUTO_INCREMENT = 1;

-- Creating the "Customers" table
CREATE TABLE IF NOT EXISTS CUSTOMERS (ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL, FIRST_NAME VARCHAR(225) NOT NULL, LAST_NAME VARCHAR(225) NOT NULL, EMAIL VARCHAR(225) NOT NULL, PASSWORD VARCHAR(225) NOT NULL) ;
ALTER TABLE CUSTOMERS AUTO_INCREMENT = 1;

-- Creating the "Categories" table
CREATE TABLE IF NOT EXISTS CATEGORIES (ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL, NAME VARCHAR(225) UNIQUE KEY NOT NULL);
ALTER TABLE CATEGORIES AUTO_INCREMENT = 1;

-- Creating the "Coupons" table
CREATE TABLE IF NOT EXISTS COUPONS (ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL, COMPANY_ID INT NOT NULL, CATEGORY_ID INT NOT NULL, TITLE VARCHAR(225) NOT NULL, DESCRIPTION VARCHAR(225) NOT NULL,
START_DATE DATE NOT NULL, END_DATE DATE NOT NULL, AMOUNT INTEGER NOT NULL, PRICE DOUBLE NOT NULL, IMAGE VARCHAR(225) NOT NULL, 
FOREIGN KEY (COMPANY_ID) REFERENCES COMPANIES(ID), 
FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORIES(ID));
ALTER TABLE COUPONS AUTO_INCREMENT = 1;

-- Creating the "Customers_VS_Coupons" table
CREATE TABLE IF NOT EXISTS CUSTOMERS_VS_COUPONS (CUSTOMER_ID INT NOT NULL, COUPON_ID INT NOT NULL, 
PRIMARY KEY (CUSTOMER_ID,COUPON_ID),
FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(ID),
FOREIGN KEY (COUPON_ID) REFERENCES COUPONS(ID));