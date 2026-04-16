-- Foreign Key: auth.session → auth.user
-- This constraint enforces the relationship between sessions and users.
-- Each session must belong to a valid user in the auth.user table.
-- If a user is deleted, all related sessions are automatically removed.

ALTER TABLE auth.session
ADD CONSTRAINT fk_session_user
FOREIGN KEY (user_id)
REFERENCES auth.user (id)
ON DELETE CASCADE;



-- Foreign Keys (Organization Module)
-- These constraints enforce referential integrity between organizations,
-- members, and stores. They ensure all related records belong to a valid organization
-- and are automatically cleaned up when an organization is deleted.


-- MEMBER → ORGANIZATION
-- Ensures each member belongs to a valid organization.
-- If an organization is deleted, all its members are automatically removed.

ALTER TABLE organization.member
ADD CONSTRAINT fk_member_organization
FOREIGN KEY (organization_id)
REFERENCES organization.organization (id)
ON DELETE CASCADE;


-- STORE → ORGANIZATION
-- Ensures each store belongs to a valid organization.
-- If an organization is deleted, all its stores are automatically removed.

ALTER TABLE organization.store
ADD CONSTRAINT fk_store_organization
FOREIGN KEY (organization_id)
REFERENCES organization.organization (id)
ON DELETE CASCADE;


-- CATEGORY → STORE
-- Ensures each category belongs to a valid store.
-- If a store is deleted, all its categories are automatically removed.

ALTER TABLE category 
ADD CONSTRAINT fk_category_store
FOREIGN KEY (store_id)
REFERENCES organization.store (id)
ON DELETE CASCADE;


-- CUSTOMER → STORE
-- Ensures each customer belongs to a valid store.
-- If a store is deleted, all its customers are automatically removed.

ALTER TABLE customer
ADD CONSTRAINT fk_customer_store
FOREIGN KEY (store_id)
REFERENCES organization.store (id)
ON DELETE CASCADE;

-- PRODUCT → STORE
-- Ensures each product belongs to a valid store.
-- If a store is deleted, all its products are automatically removed.

ALTER TABLE product
ADD CONSTRAINT fk_product_store
FOREIGN KEY (store_id)
REFERENCES organization.store (id)
ON DELETE CASCADE;


-- PRODUCT → PRODUCT BARCODE
-- Ensures each product_barcode belongs to a valid product.
-- If a product is deleted, all its product_barcodes are automatically removed.

ALTER TABLE product_barcode
ADD CONSTRAINT fk_product_barcode_product
FOREIGN KEY (product_id)
REFERENCES product (id)
ON DELETE CASCADE;


-- PRODUCT → PRODUCT CATEGORY
-- Ensures each product_category belongs to a valid product.
-- If a product is deleted, all its product_categories are automatically removed.

ALTER TABLE product_category
ADD CONSTRAINT fk_product_category_product
FOREIGN KEY (product_id)
REFERENCES product (id)
ON DELETE CASCADE;


-- PRODUCT → PRODUCT SUPPLIER
-- Ensures each product_supplier belongs to a valid product.
-- If a product is deleted, all its product_suppliers are automatically removed.

ALTER TABLE product_supplier
ADD CONSTRAINT fk_product_supplier_product
FOREIGN KEY (product_id)
REFERENCES product (id)
ON DELETE CASCADE;

-- SUPPLIER → STORE
-- Ensures each supplier belongs to a valid store.
-- If a store is deleted, all its suppliers are automatically removed.

ALTER TABLE supplier
ADD CONSTRAINT fk_supplier_store
FOREIGN KEY (store_id)
REFERENCES organization.store (id)
ON DELETE CASCADE;

-- INVENTORY → STORE
-- Ensures each inventory belongs to a valid store.
-- If a store is deleted, all its inventories are automatically removed.

ALTER TABLE inventory
ADD CONSTRAINT fk_inventory_store
FOREIGN KEY (store_id)
REFERENCES organization.store (id)
ON DELETE CASCADE;

-- INVENTORY → PRODUCT
-- Ensures each inventory belongs to a valid product.
-- If a product is deleted, all its inventories are automatically removed.

ALTER TABLE inventory
ADD CONSTRAINT fk_inventory_product
FOREIGN KEY (product_id)
REFERENCES product (id)
ON DELETE CASCADE;


-- INVENTORY MOVEMENT → STORE
-- Ensures each inventory movement belongs to a valid store.
-- If a store is deleted, all its inventory movements are automatically removed.

ALTER TABLE inventory_movement
ADD CONSTRAINT fk_inventory_movement_store
FOREIGN KEY (store_id)
REFERENCES organization.store (id)
ON DELETE CASCADE;

-- INVENTORY MOVEMENT → PRODUCT
-- Ensures each inventory movement belongs to a valid product.
-- If a product is deleted, all its inventory movements are automatically removed.

ALTER TABLE inventory_movement
ADD CONSTRAINT fk_inventory_movement_product
FOREIGN KEY (product_id)
REFERENCES product (id)
ON DELETE CASCADE;


-- SALE → STORE
-- Ensures each sale belongs to a valid store.
-- If a store is deleted, all its sales are automatically removed.

ALTER TABLE sale
ADD CONSTRAINT fk_sale_store
FOREIGN KEY (store_id)
REFERENCES organization.store (id)
ON DELETE CASCADE;

-- SALE ITEM → STORE 
-- Ensures each sale item belongs to a valid store.
-- If a store is deleted, all its sale items are automatically removed.

ALTER TABLE sale_item
ADD CONSTRAINT fk_sale_item_store
FOREIGN KEY (store_id)
REFERENCES organization.store (id)
ON DELETE CASCADE;

-- SALE → SALE ITEM
-- Ensures each sale item belongs to a valid sale.
-- If a sale is deleted, all its sale items are automatically removed.

ALTER TABLE sale_item
ADD CONSTRAINT fk_sale_item_sale
FOREIGN KEY (sale_id)
REFERENCES sale (id)
ON DELETE CASCADE;

-- SALE ITEM → PRODUCT
-- Ensures each sale item belongs to a valid product.
-- If a product is deleted, all its sale items are automatically removed.

ALTER TABLE sale_item
ADD CONSTRAINT fk_sale_item_product
FOREIGN KEY (product_id)
REFERENCES product (id)
ON DELETE CASCADE;

-- INVOICE → STORE
-- Ensures each invoice belongs to a valid store.
-- If a store is deleted, all its invoices are automatically removed.

ALTER TABLE invoice
ADD CONSTRAINT fk_invoice_store
FOREIGN KEY (store_id)
REFERENCES organization.store (id)
ON DELETE CASCADE;

-- INVOICE → SALE
-- Ensures each invoice belongs to a valid sale.
-- If a sale is deleted, all its invoices are automatically removed.

ALTER TABLE invoice
ADD CONSTRAINT fk_invoice_sale
FOREIGN KEY (sale_id)
REFERENCES sale (id)
ON DELETE CASCADE;

-- PAYMENT → INVOICE
-- Ensures each payment belongs to a valid invoice.
-- If an invoice is deleted, all its payments are automatically removed.

ALTER TABLE payment
ADD CONSTRAINT fk_payment_invoice
FOREIGN KEY (invoice_id)
REFERENCES invoice (id)
ON DELETE CASCADE;