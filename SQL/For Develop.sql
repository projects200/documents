ALTER TABLE member_blocks
ADD CONSTRAINT UQ_member_blocks_blocker_blocked
UNIQUE (blocker_id, blocked_id);
