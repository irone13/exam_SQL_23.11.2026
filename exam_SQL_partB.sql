CREATE TABLE store (
id INTEGER PRIMARY KEY AUTOINCREMENT,
catalog_number TEXT NOT NULL UNIQUE,
brand TEXT NOT NULL CHECK (brand IN ('Samsung',  'LG',  'Sony')),
model TEXT NOT NULL,
screen_size REAL NOT NULL CHECK (screen_size  >  0),
resolution TEXT NOT NULL CHECK (resolution IN ('4K',  '8K',  'Full HD')),
price REAL NOT NULL CHECK (price >= 0),
stock_quantity INTEGER NOT NULL DEFAULT 0 CHECK (stock_quantity  >=  0),
release_year INTEGER NOT NULL,
smart_tv TEXT NOT NULL CHECK (smart_tv IN ('Yes',  'No')),
os TEXT,
panel_type TEXT NOT NULL CHECK (panel_type IN ('OLED',  'QLED',  'LED')),
CHECK (smart_tv  =  'Yes' OR os IS NULL)
);

INSERT INTO store (
catalog_number, brand, model, screen_size, resolution, price, stock_quantity, release_year,  smart_tv, os, panel_type 
)
VALUES (
'889764', 'Samsung', 'Series 7', 55, '4K', 2499.90, 18, 2021, 'Yes', 'Tizen', 'OLED'),
('899844', 'LG', 'C3', 65, '4K', 2999.90, 23, 2023, 'Yes', 'WebOS', 'OLED'),
('779934', 'Sony', 'XR70', 55, '4K', 1999.90, 8, 2020, 'No', NULL, 'LED');