-- Index: auth.session.user_id
-- This index improves query performance for operations filtering by user_id.
-- It is commonly used when retrieving all sessions belonging to a specific user.

CREATE INDEX idx_session_user_id
ON auth.session(user_id);

-- Index: organization.organization.id
-- This index improves query performance for operations filtering by organization id.
-- It is commonly used when retrieving or validating a specific organization.

CREATE INDEX idx_organization_id
ON organization.organization(id);


-- Index: organization.member.organization_id
-- This index improves query performance for operations filtering by organization_id.
-- It is commonly used when retrieving all members belonging to a specific organization.

CREATE INDEX idx_member_organization_id
ON organization.member(organization_id);


-- Index: organization.member.user_id
-- This index improves query performance for operations filtering by user_id.
-- It is commonly used when retrieving all organizations associated with a specific user.

CREATE INDEX idx_member_user_id
ON organization.member(user_id);


-- Index: organization.member.organization_id_user_id
-- This composite index improves query performance for operations filtering by both organization_id and user_id.
-- It is commonly used when validating if a user belongs to a specific organization.

CREATE INDEX idx_member_organization_user
ON organization.member(organization_id, user_id);


-- Index: organization.store.organization_id
-- This index improves query performance for operations filtering by organization_id.
-- It is commonly used when retrieving all stores belonging to an organization.

CREATE INDEX idx_store_organization_id
ON organization.store(organization_id);