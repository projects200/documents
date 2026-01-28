-- 피드 좋아요 인덱스 : (피드ID + 회원ID)
CREATE INDEX idx_feed_likes_feed_member ON feed_likes (feed_id, member_id);

-- 댓글 인덱스 : (피드ID + 회원ID)
CREATE INDEX idx_comments_feed_member ON comments (feed_id, member_id);

-- 댓글 좋아요 인덱스: (댓글ID + 회원ID)
CREATE INDEX idx_comment_likes_comment_member ON comment_likes (comment_id, member_id);
