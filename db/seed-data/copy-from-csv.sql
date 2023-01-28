COPY users(id, first_name, last_name, ship_addr_st, ship_addr_line2, ship_addr_city, ship_addr_region, postal_code, ship_addr_country, credit_card_type, credit_card_number, phone, email)
FROM '/Users/eisuke/dev/theStore/db/seed-data/datasets/1/store.users.csv'
WITH (FORMAT CSV, HEADER true, DELIMITER ',');

COPY orders(id, user_id, total)
FROM '/Users/eisuke/dev/theStore/db/seed-data/datasets/1/store.orders.csv'
WITH (FORMAT CSV, HEADER true, DELIMITER ',');

COPY items(id, title, description, price)
FROM '/Users/eisuke/dev/theStore/db/seed-data/datasets/1/store.items.csv'
WITH (FORMAT CSV, HEADER true, DELIMITER ',');

COPY ordered_items(id, order_id, item_id, quantity)
FROM '/Users/eisuke/dev/theStore/db/seed-data/datasets/1/store.ordered_items.csv'
WITH (FORMAT CSV, HEADER true, DELIMITER ',');
