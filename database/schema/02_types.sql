-- Types
-- Defines reusable ENUM types for the `retailcore` database.
-- Organized by layers: AUTH → ORGANIZATION → BUSINESS


-- AUTH
-- Authentication layer (only identity, no business permissions)

-- NOTE:
-- AUTH does NOT contain roles for business logic.
-- Authorization is handled entirely at organization level.

-- (Intentionally no role type here)


-- ORGANIZATION
-- Multi-tenant access control (ALL business permissions live here)

CREATE TYPE organization_role AS ENUM (
  'owner',
  'manager',
  'supervisor',
  'cashier'
);


-- BUSINESS: CUSTOMER
-- Customer classification types

CREATE TYPE customer_type AS ENUM (
  'individual',
  'company'
);


-- BUSINESS: PRODUCT
-- Product definition and measurement types

CREATE TYPE product_type AS ENUM (
  'physical',
  'service',
  'digital'
);

CREATE TYPE unit_type AS ENUM (
  'unit',
  'weight',
  'volume',
  'length',
  'other'
);


-- BUSINESS: INVENTORY
-- Stock movement tracking

CREATE TYPE inventory_movement_type AS ENUM (
  'sale',
  'restock',
  'adjustment',
  'transfer_in',
  'transfer_out'
);


-- BUSINESS: SALES & PAYMENTS
-- Transaction lifecycle types

CREATE TYPE payment_method AS ENUM (
  'cash',
  'card',
  'transfer',
  'other'
);

CREATE TYPE payment_status AS ENUM (
  'pending',
  'completed',
  'failed'
);

CREATE TYPE sale_status AS ENUM (
  'pending',
  'completed',
  'cancelled',
  'refunded'
);

CREATE TYPE invoice_status AS ENUM (
  'draft',
  'sent',
  'paid',
  'cancelled'
);


-- BUSINESS: PURCHASES
-- Procurement lifecycle

CREATE TYPE purchase_status AS ENUM (
  'pending',
  'completed',
  'cancelled'
);

CREATE TYPE purchase_invoice_status AS ENUM (
  'pending',
  'paid',
  'cancelled'
);


-- BUSINESS: DISCOUNTS & PROMOTIONS
-- Pricing and promotion rules

CREATE TYPE discount_type AS ENUM (
  'fixed',
  'percentage'
);

CREATE TYPE promotion_type AS ENUM (
  'percentage_discount',
  'fixed_discount',
  'bundle_pricing',
  'buy_x_get_y_offer',
  'tiered_discount'
);

CREATE TYPE promotion_scope AS ENUM (
  'global',
  'product',
  'category'
);

CREATE TYPE promotion_rule_type AS ENUM (
  'min_quantity',
  'max_discount',
  'applicable_payment_method',
  'customer_group',
  'time_window'
);


-- BUSINESS: SUPPLIERS
-- Supplier classification

CREATE TYPE supplier_type AS ENUM (
  'distributor',
  'manufacturer',
  'wholesaler',
  'service'
);

CREATE TYPE supplier_status AS ENUM (
  'active',
  'inactive'
);


-- BUSINESS: TAX
-- Tax configuration scope

CREATE TYPE tax_scope AS ENUM (
  'global',
  'product',
  'category'
);