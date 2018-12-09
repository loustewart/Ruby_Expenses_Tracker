DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE categories;

CREATE TABLE merchants
(
  id SERIAL primary key,
  name VARCHAR(255) not null,
  phone VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE categories
(
  id SERIAL primary key,
  type VARCHAR(255) not null
);

CREATE TABLE transactions
(
  id SERIAL primary key,
  merchant_id INT references merchants(id),
  category_id INT references categories(id),
  value DECIMAL(5,2)
);
