-- =========================================
-- Dalton Oballah - E-Commerce SQL Database
-- Power Learn Project - 2025 Cohort VII
-- Full Customized Version with Documentation
-- =========================================

-- ================================
-- DROP ALL TABLES FOR CLEAN RESET
-- ================================
DROP TABLE IF EXISTS product_images;
DROP TABLE IF EXISTS product_attributes;
DROP TABLE IF EXISTS attribute_types;
DROP TABLE IF EXISTS attribute_categories;
DROP TABLE IF EXISTS product_items;
DROP TABLE IF EXISTS product_variants;
DROP TABLE IF EXISTS size_options;
DROP TABLE IF EXISTS size_categories;
DROP TABLE IF EXISTS colors;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS brands;
DROP TABLE IF EXISTS categories;

-- =====================
-- BRANDS TABLE
-- =====================
CREATE TABLE brands (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(100) NOT NULL UNIQUE
);

-- =====================
-- PRODUCT CATEGORIES TABLE
-- =====================
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

-- =====================
-- PRODUCTS TABLE
-- =====================
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    base_price DECIMAL(10, 2),
    brand_id INT,
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- =====================
-- COLORS TABLE
-- =====================
CREATE TABLE colors (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(50) NOT NULL
);

-- =====================
-- SIZE CATEGORIES TABLE
-- =====================
CREATE TABLE size_categories (
    size_cat_id INT AUTO_INCREMENT PRIMARY KEY,
    size_cat_name VARCHAR(50) NOT NULL
);

-- =====================
-- SIZE OPTIONS TABLE
-- =====================
CREATE TABLE size_options (
    size_id INT AUTO_INCREMENT PRIMARY KEY,
    size_cat_id INT,
    size_value VARCHAR(20) NOT NULL,
    FOREIGN KEY (size_cat_id) REFERENCES size_categories(size_cat_id)
);

-- =====================
-- PRODUCT VARIANTS TABLE
-- =====================
CREATE TABLE product_variants (
    variant_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    color_id INT,
    size_id INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (color_id) REFERENCES colors(color_id),
    FOREIGN KEY (size_id) REFERENCES size_options(size_id)
);

-- =====================
-- PRODUCT ITEMS TABLE
-- =====================
CREATE TABLE product_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    variant_id INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    available_stock INT DEFAULT 0,
    FOREIGN KEY (variant_id) REFERENCES product_variants(variant_id)
);

-- =====================
-- ATTRIBUTE CATEGORIES TABLE
-- =====================
CREATE TABLE attribute_categories (
    attr_cat_id INT AUTO_INCREMENT PRIMARY KEY,
    attr_cat_name VARCHAR(100) NOT NULL
);

-- =====================
-- ATTRIBUTE TYPES TABLE
-- =====================
CREATE TABLE attribute_types (
    attr_type_id INT AUTO_INCREMENT PRIMARY KEY,
    attr_cat_id INT,
    attr_name VARCHAR(100) NOT NULL,
    value_type ENUM('text', 'number', 'boolean') NOT NULL,
    FOREIGN KEY (attr_cat_id) REFERENCES attribute_categories(attr_cat_id)
);

-- =====================
-- PRODUCT ATTRIBUTES TABLE
-- =====================
CREATE TABLE product_attributes (
    prod_attr_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    attr_type_id INT NOT NULL,
    attr_value VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (attr_type_id) REFERENCES attribute_types(attr_type_id)
);

-- =====================
-- PRODUCT IMAGES TABLE
-- =====================
CREATE TABLE product_images (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
