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

