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