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