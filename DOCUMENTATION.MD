# E-Commerce Database Project Documentation

**Author**: Dalton Oballah  
**Project**: Power Learn Project — Software Development Cohort VII  
**Date**: April 2025

---

## Overview

This documentation provides a comprehensive technical explanation of the e-commerce relational database developed by Dalton Oballah. The project models a complete backend structure for an online retail platform, covering key components like products, attributes, variations (size/color), stock management, and media files.

---

## Database Objectives

- Support diverse product listings with brand and category classification.
- Allow dynamic variations (e.g., size, color) using a flexible relational model.
- Enable stock tracking at the variant level.
- Include a modular attribute system for custom product metadata.
- Store and manage product images via external links or file paths.

---

## Key Entities

### 1. `brand`

Stores product brand names.

| Field | Type | Description |
|-------|------|-------------|
| id | INT (PK) | Unique identifier |
| name | VARCHAR | Brand name |

---

### 2. `product_category`

Defines categories like electronics, clothing, etc.

| Field | Type | Description |
|-------|------|-------------|
| id | INT (PK) | Category ID |
| name | VARCHAR | Category name |

---

### 3. `product`

Core table containing product details.

| Field | Type | Description |
|-------|------|-------------|
| id | INT (PK) | Product ID |
| name | VARCHAR | Product name |
| brand_id | INT (FK) | Links to `brand` |
| category_id | INT (FK) | Links to `product_category` |
| base_price | DECIMAL | Starting price |

---

### 4. `color`

Stores color options.

| Field | Type | Description |
|-------|------|-------------|
| id | INT (PK) | Color ID |
| name | VARCHAR | Color name |

---

### 5. `size_category`

Groups sizes (e.g., clothing sizes, shoe sizes).

| Field | Type | Description |
|-------|------|-------------|
| id | INT (PK) | Size category ID |
| name | VARCHAR | Category name |

---

### 6. `size_option`

Specific size values.

| Field | Type | Description |
|-------|------|-------------|
| id | INT (PK) | Size option ID |
| size_category_id | INT (FK) | Links to `size_category` |
| value | VARCHAR | Size label (e.g., S, M, L, 42) |

---

### 7. `product_variation`

Links a product to its color and size options.

| Field | Type | Description |
|-------|------|-------------|
| id | INT (PK) | Variation ID |
| product_id | INT (FK) | Links to `product` |
| color_id | INT (FK) | Links to `color` |
| size_option_id | INT (FK) | Links to `size_option` |

---

### 8. `product_item`

Final purchasable unit including stock and pricing.

| Field | Type | Description |
|-------|------|-------------|
| id | INT (PK) | Item ID |
| variation_id | INT (FK) | Links to `product_variation` |
| price | DECIMAL | Price override (if needed) |
| stock_quantity | INT | Available stock |

---

### 9. `attribute_category`

Groups product attributes into types like physical or technical.

| Field | Type | Description |
|-------|------|-------------|
| id | INT (PK) | Attribute category ID |
| name | VARCHAR | Category name |

---

### 10. `attribute_type`

Defines fields like “material”, “weight”, etc.

| Field | Type | Description |
|-------|------|-------------|
| id | INT (PK) | Attribute type ID |
| category_id | INT (FK) | Links to `attribute_category` |
| name | VARCHAR | Attribute name |
| value_type | ENUM | Accepts: text, number, boolean |

---

### 11. `product_attribute`

Stores actual attribute values assigned to products.

| Field | Type | Description |
|-------|------|-------------|
| id | INT (PK) | Attribute ID |
| product_id | INT (FK) | Links to `product` |
| type_id | INT (FK) | Links to `attribute_type` |
| value | VARCHAR | Attribute value (e.g., "Cotton", "15kg") |

---

### 12. `product_image`

Stores image URLs or file paths for products.

| Field | Type | Description |
|-------|------|-------------|
| id | INT (PK) | Image ID |
| product_id | INT (FK) | Links to `product` |
| url | VARCHAR | Image link or path |

---

## Data Relationships

- Each **product** belongs to one **brand** and **category**.
- A product can have many **variations**, each being a unique combination of **size** and **color**.
- Each **variation** becomes a **product_item** with pricing and inventory.
- Products can have unlimited **custom attributes** through a flexible key-value schema.
- Product **images** are stored and retrieved independently for display.

---

## Scalability Notes

- Add `created_at`, `updated_at`, and `deleted_at` columns for production use.
- Extend to support **user management**, **orders**, and **payment tracking**.
- Consider indexing foreign keys for performance optimization.

---

## Author

**Dalton Oballah**  
Power Learn Project – Cohort VII  
April 2025

