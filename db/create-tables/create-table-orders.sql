-- ORDERS
CREATE TABLE orders (
    id UUID
        PRIMARY KEY
        DEFAULT gen_random_uuid(),
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

