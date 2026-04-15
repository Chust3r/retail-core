-- User

-- Stores the main identity of a user in the system.
-- Each user represents a unique individual who can access one or more organizations.

CREATE TABLE auth.user (
  id TEXT PRIMARY KEY,
  email TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL,
  name TEXT NOT NULL,
  image TEXT,
  role user_role DEFAULT 'user' NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ
);


-- Session

-- Stores active user sessions.
-- Used to manage authentication state across requests.

CREATE TABLE auth.session (
  id TEXT PRIMARY KEY,
  user_id TEXT NOT NULL,
  token TEXT NOT NULL UNIQUE,
  expires_at TIMESTAMPTZ NOT NULL,
  ip_address TEXT,
  user_agent TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ
);



-- ORGANIZATION
-- Represents a tenant in the system.
-- Each organization is an isolated business entity that can contain multiple stores and users.

CREATE TABLE organization.organization (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ
);


-- MEMBER
-- Links users to an organization and defines their role within it.
-- A user can belong to multiple organizations with different roles.

CREATE TABLE organization.member (
  id TEXT PRIMARY KEY,
  organization_id TEXT NOT NULL,
  user_id TEXT NOT NULL,
  role organization_role NOT NULL DEFAULT 'cashier',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ
);


-- STORE
-- Represents a business unit inside an organization.
-- Each organization can have multiple stores (branches, locations, etc.)

CREATE TABLE organization.store (
  id TEXT PRIMARY KEY,
  organization_id TEXT NOT NULL,
  name TEXT NOT NULL,
  slug TEXT UNIQUE,
  currency TEXT DEFAULT 'MXN',
  timezone TEXT DEFAULT 'America/Mexico_City',
  logo TEXT,
  is_active BOOLEAN DEFAULT true,
  metadata JSONB,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ
);


-- CATEGORY 
-- Represents a grouping of products within a store.
-- Categories can be nested to form a hierarchy.

CREATE TABLE category (
  id TEXT PRIMARY KEY,
  store_id TEXT NOT NULL,
  name TEXT NOT NULL,
  parent_id TEXT,
  is_active BOOLEAN DEFAULT true,
  allow_discount BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ
)

-- CUSTOMER
-- Represents a customer in the system.
-- Customers must be associated with a store.

CREATE TABLE customer (
  id TEXT PRIMARY KEY,
  store_id TEXT NOT NULL,
  name TEXT NOT NULL,
  email TEXT,
  phone TEXT,
  tax_id TEXT,
  type customer_type DEFAULT 'individual',
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ
)


-- PRODUCT
-- Represents a product available for sale in a store.

CREATE TABLE product (
  id TEXT PRIMARY KEY,
  store_id TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  price NUMERIC(10,2) NOT NULL,
  min_price NUMERIC(10,2),
  discount_limit_type discount_type,
	discount_limit_value NUMERIC(10, 3),
	cost NUMERIC(10, 2),
	sku TEXT,
	type product_type NOT NULL,
	unit unit_type DEFAULT 'unit' NOT NULL,
	is_active BOOLEAN DEFAULT true NOT NULL,
	allow_discount BOOLEAN DEFAULT true NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ
)

-- PRODUCT BARCODE
-- Associates a product with a unique barcode.

CREATE TABLE product_barcode (
	id text PRIMARY KEY NOT NULL,
  store_id TEXT NOT NULL,
  product_id TEXT NOT NULL,
  code TEXT NOT NULL,
  is_primary BOOLEAN DEFAULT false NOT NULL
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ
)

-- PRODUCT CATEGORY
-- Associates a product with one or more categories.

CREATE TABLE product_category (
	id TEXT PRIMARY KEY NOT NULL,
	store_id TEXT NOT NULL,
	product_id TEXT NOT NULL,
	category_id TEXT NOT NULL
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ
);

-- PRODUCT SUPPLIER
-- Associates a product with one or more suppliers.

CREATE TABLE product_supplier (
  id TEXT PRIMARY KEY NOT NULL,
  store_id TEXT NOT NULL,
  supplier_id TEXT NOT NULL,
  product_id TEXT NOT NULL, 
  cost NUMERIC(10, 2) NOT NULL,
  is_preferred BOOLEAN DEFAULT false NOT NULL,
  supplier_sku TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ
);

-- SUPPLIER
-- Represents a supplier in the system.

CREATE TABLE supplier (
	id text PRIMARY KEY NOT NULL,
  store_id text NOT NULL,
	name text NOT NULL,
	business_name text,
	tax_id text,
	type supplier_type DEFAULT 'distributor' NOT NULL,
	status supplier_status DEFAULT 'active' NOT NULL,
	contact_name text,
	email text,
	phone text,
	address text,
	payment_terms_days integer DEFAULT 0,
	credit_limit numeric(10, 2),
	metadata jsonb DEFAULT '{}'
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ
);


-- INVENTORY
-- Manages stock levels for each product in a store.

CREATE TABLE inventory (
  id TEXT PRIMARY KEY NOT NULL,
  store_id TEXT NOT NULL,
  product_id TEXT NOT NULL,
  quantity NUMERIC(10, 3) DEFAULT 0 NOT NULL,
  min_stock NUMERIC(10,3),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ
);

-- INVENTORY MOVEMENT
-- Records changes in inventory levels.

CREATE TABLE inventory_movement (
  id text PRIMARY KEY NOT NULL,
	store_id text NOT NULL,
	product_id text NOT NULL,
	type inventory_movement_type NOT NULL,
	quantity numeric(10, 3) NOT NULL,
	reference_id text,
	note text,
	balance_after numeric(10, 3) NOT NULL
);