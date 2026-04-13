-- Types
-- This script defines reusable ENUM types for the `retailcore` database.
-- ENUMs are used to enforce data consistency and restrict column values
-- to a predefined set of valid options across the system.


-- Customer

-- Defines the type of customer in the system.
-- "individual": a person
-- "company": a business entity
CREATE TYPE customer_type AS ENUM (
  'individual',
  'company'
);


-- Product

-- Defines the type of product managed in the system.
-- "physical": tangible goods
-- "service": non-tangible services
-- "digital": downloadable or virtual products
CREATE TYPE product_type AS ENUM (
  'physical',
  'service',
  'digital'
);

-- Defines the unit of measurement for products.
-- Used for inventory and sales calculations.
CREATE TYPE unit_type AS ENUM (
  'unit',
  'weight',
  'volume',
  'length',
  'other'
);


-- Inventory

-- Defines the type of inventory movement.
-- Used to track stock changes over time.
CREATE TYPE inventory_movement_type AS ENUM (
  'sale',          -- product sold
  'restock',       -- new stock added
  'adjustment',    -- manual correction
  'transfer_in',   -- stock received from another location
  'transfer_out'   -- stock sent to another location
);


-- Sales & Payments

-- Defines supported payment methods.
CREATE TYPE payment_method AS ENUM (
  'cash',
  'card',
  'transfer',
  'other'
);

-- Defines the status of a payment transaction.
CREATE TYPE payment_status AS ENUM (
  'pending',
  'completed',
  'failed'
);

-- Defines the lifecycle of a sale.
CREATE TYPE sale_status AS ENUM (
  'pending',
  'completed',
  'cancelled',
  'refunded'
);

-- Defines the lifecycle of an invoice.
CREATE TYPE invoice_status AS ENUM (
  'draft',
  'sent',
  'paid',
  'cancelled'
);


-- Purchases

-- Defines the lifecycle of a purchase order.
CREATE TYPE purchase_status AS ENUM (
  'pending',
  'completed',
  'cancelled'
);

-- Defines the lifecycle of a supplier invoice.
CREATE TYPE purchase_invoice_status AS ENUM (
  'pending',
  'paid',
  'cancelled'
);


-- Discounts & Promotions

-- Defines how a discount is applied.
-- "fixed": fixed amount
-- "percentage": percentage-based discount
CREATE TYPE discount_type AS ENUM (
  'fixed',
  'percentage'
);

-- Defines the type of promotion applied in the system.
CREATE TYPE promotion_type AS ENUM (
  'percentage_discount',
  'fixed_discount',
  'bundle_pricing',
  'buy_x_get_y_offer',
  'tiered_discount'
);

-- Defines the scope of a promotion.
-- Determines where the promotion is applied.
CREATE TYPE promotion_scope AS ENUM (
  'global',
  'product',
  'category'
);

-- Defines rules that control how promotions are applied.
CREATE TYPE promotion_rule_type AS ENUM (
  'min_quantity',
  'max_discount',
  'applicable_payment_method',
  'customer_group',
  'time_window'
);


-- Suppliers

-- Defines the type of supplier.
CREATE TYPE supplier_type AS ENUM (
  'distributor',
  'manufacturer',
  'wholesaler',
  'service'
);

-- Defines the status of a supplier.
CREATE TYPE supplier_status AS ENUM (
  'active',
  'inactive'
);


-- Tax

-- Defines how tax rules are applied.
-- "global": applies to all
-- "product": applies to specific products
-- "category": applies to categories
CREATE TYPE tax_scope AS ENUM (
  'global',
  'product',
  'category'
);


-- Organization

-- Defines roles of members within a store or organization.
CREATE TYPE member_role AS ENUM (
  'cashier',
  'supervisor',
  'manager'
);

-- Defines the status of an invitation.
CREATE TYPE invitation_status AS ENUM (
  'pending',
  'accepted',
  'rejected',
  'expired'
);


-- System

-- Defines system-level user roles.
-- Used for access control and permissions.
CREATE TYPE user_role AS ENUM (
  'user',
  'admin',
  'super_admin'
);