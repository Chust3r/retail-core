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