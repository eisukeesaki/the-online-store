-- DATABASES
CREATE DATABASE thestore;
\c thestore

-- SCHEMAS
CREATE SCHEMA store;
SET search_path TO store;

-- EXTENSIONS
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- FUNCTIONS
CREATE OR REPLACE FUNCTION update_modified_column() 
    RETURNS TRIGGER AS $$
    BEGIN
        NEW.modified = now();
        RETURN NEW; 
    END;
    $$ language 'plpgsql';

-- USERS
CREATE TABLE users (
    id UUID
        PRIMARY KEY
        DEFAULT gen_random_uuid()
        NOT NULL,
	first_name
        VARCHAR(50)
        NOT NULL,
	last_name
        VARCHAR(50)
        NOT NULL,
	ship_addr_st
        VARCHAR(50),
	ship_addr_line2
        VARCHAR(50),
    ship_addr_city
        VARCHAR(255),
    ship_addr_region
        VARCHAR(50),
    postal_code
        VARCHAR(20),
    ship_addr_country
        VARCHAR(100),
	credit_card_type
        VARCHAR(50), -- TODO: add constaint: ?store encrypted value; only allow an instance from pre-defined list of credit card types
	credit_card_number -- TODO: store encrypted value
        VARCHAR(20) 
        UNIQUE,
	phone
        VARCHAR(50),
    email
        VARCHAR(50)
        NOT NULL
        UNIQUE,
    created
        TIMESTAMP
        NOT NULL
        DEFAULT (CURRENT_TIMESTAMP), 
    modified
        TIMESTAMP
);
CREATE TRIGGER update_users_modtime
    BEFORE UPDATE
    ON users
    FOR EACH ROW
        EXECUTE PROCEDURE update_modified_column();

-- ORDERS
CREATE TABLE orders (
    id UUID
        PRIMARY KEY
        DEFAULT gen_random_uuid()
        NOT NULL,
    user_id UUID
        REFERENCES users
        NOT NULL,
    total money
        NOT NULL,
    created
        TIMESTAMP
        NOT NULL
        DEFAULT (CURRENT_TIMESTAMP), 
    modified
        TIMESTAMP
);
CREATE TRIGGER update_orders_modtime
    BEFORE UPDATE
    ON orders
    FOR EACH ROW
        EXECUTE PROCEDURE update_modified_column();

-- ITEMS
CREATE TABLE items (
    id UUID
        PRIMARY KEY
        DEFAULT gen_random_uuid()
        NOT NULL,
    title
        VARCHAR(50)
        NOT NULL,
    description
        VARCHAR(9999),
    price
        money
        NOT NULL,
    created
        TIMESTAMP
        NOT NULL
        DEFAULT (CURRENT_TIMESTAMP), 
    modified
        TIMESTAMP
);
CREATE TRIGGER update_items_modtime
    BEFORE UPDATE
    ON items
    FOR EACH ROW
        EXECUTE PROCEDURE update_modified_column();

-- ORDERED_ITEMS
CREATE TABLE ordered_items (
    id UUID
        PRIMARY KEY
        DEFAULT gen_random_uuid()
        NOT NULL,
    item_id UUID
        REFERENCES items
        NOT NULL,
    quantity integer
        NOT NULL,
    created
        TIMESTAMP
        NOT NULL
        DEFAULT (CURRENT_TIMESTAMP), 
    modified
        TIMESTAMP
);
CREATE TRIGGER update_ordered_items_modtime
    BEFORE UPDATE
    ON ordered_items
    FOR EACH ROW
        EXECUTE PROCEDURE update_modified_column();

