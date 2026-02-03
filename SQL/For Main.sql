-- 피드 좋아요 인덱스 : (피드ID + 회원ID)
CREATE INDEX idx_feed_likes_feed_member ON feed_likes (feed_id, member_id);

-- 댓글 인덱스 : (피드ID + 회원ID)
CREATE INDEX idx_comments_feed_member ON comments (feed_id, member_id);

-- 댓글 좋아요 인덱스: (댓글ID + 회원ID)
CREATE INDEX idx_comment_likes_comment_member ON comment_likes (comment_id, member_id);

INSERT INTO policies (policy_id, policy_key, policy_value, policy_unit, policy_description)
VALUES (23, 'FEED_PICTURE_MAX_COUNT', '5', 'COUNT', '저장할 수 있는 최대 피드 사진 수');

INSERT INTO policy_groups (policy_groups_id, policy_groups_name)
VALUES (6, 'feed');

INSERT INTO policy_group_mappings (policy_id, policy_groups_id)
VALUES (23, 6);
