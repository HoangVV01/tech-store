CREATE TABLE IF NOT EXISTS category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

INSERT INTO category (category_id, category_name) VALUES
  (3, 'Graphics Card'),
  (4, 'Hard Drive'),
  (2, 'Laptop'),
  (5, 'Monitor'),
  (1, 'Phone'),
  (7, 'Power Supply'),
  (6, 'Ram')
    ON CONFLICT (category_id) DO NOTHING;

CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    units_in_stock INT,
    price DECIMAL(10, 2),
    category_id INT REFERENCES category(category_id),
    rating INT,
    discount INT,
    brand VARCHAR(100),
    created_at TIMESTAMP,
    image_file VARCHAR(255)
);

INSERT INTO product (id, name, description, units_in_stock, price, category_id, rating, discount, brand, created_at, image_file) VALUES
    (1, 'Macbook Air', 'The latest macbook model', 10, 1000.00, 2, 5, 0, 'Apple', '2024-08-09 00:00:00', 'macbook.png'),
    (2, 'Iphone 16', 'The latest iphone', 10, 400.00, 1, 5, 0, 'Apple', '2024-04-04 00:00:00', 'iphone16.jpg'),
    (3, 'Xiaomi Note 15', 'Flagship android phone', 20, 350.00, 1, 5, 0, 'Xiaomi', '2024-06-07 00:00:00', 'iphone16.jpg'),
    (4, 'Mac mini M4', 'Compact mini pc', 20, 700.00, 2, 5, 0, 'Apple', '2024-11-05 00:00:00', 'macbook.png'),
    (5, 'Mac mini M1', 'Compact mini pc', 20, 700.00, 2, 5, 0, 'Apple', '2022-05-06 00:00:00', 'macbook.png'),
    (6, 'Mac mini M2', 'Compact mini pc', 20, 700.00, 2, 5, 0, 'Apple', '2023-07-08 00:00:00', 'macbook.png'),
    (7, 'Mac mini M3', 'Compact mini pc', 20, 700.00, 2, 5, 0, 'Apple', '2023-12-09 00:00:00', 'macbook.png'),
    (8, 'One Plus 4', 'Flagship android phone', 20, 350.00, 1, 5, 0, 'OnePlus', '2024-05-05 00:00:00', 'oneplus'),
    (9, 'Kingston N3', '500Gb Nvme 3.0 SSD', 10, 70.00, 4, 5, 0, 'Kingston', '2023-06-05 00:00:00', 'kingssdd'),
    (10, 'WD Green', '1 Tb SSD', 10, 90.00, 4, 5, 0, 'Western Digital', '2023-08-08 00:00:00', 'wd'),
    (11, 'SN 970', '1 Tb SSD', 10, 90.00, 4, 5, 0, 'Samsung', '2024-05-05 00:00:00', 'samsung'),
    (12, 'Sandisk Edge', '64 Gb USB 3.2', 10, 40.00, 4, 5, 0, 'Sandisk', '2024-08-06 00:00:00', 'sandisk');

CREATE TABLE IF NOT EXISTS "user" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL
);

