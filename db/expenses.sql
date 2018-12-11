DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE categories;

CREATE TABLE merchants
(
  id SERIAL primary key,
  name VARCHAR(255),
  phone VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE categories
(
  id SERIAL primary key,
  type VARCHAR(255)
);

CREATE TABLE transactions
(
  id SERIAL primary key,
  merchant_id INT references merchants(id) ON DELETE CASCADE,
  category_id INT references categories(id) ON DELETE CASCADE,
  value DECIMAL(5,2),
  day VARCHAR(255),
  month VARCHAR(255),
  year VARCHAR(255)
);
