DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
    order_id INTEGER PRIMARY KEY,
    order_date DATE,
    region TEXT,
    segment TEXT,
    category TEXT,
    product TEXT,
    units INTEGER,
    unit_price REAL,
    discount REAL,
    revenue REAL,
    cost REAL,
    profit REAL
);
