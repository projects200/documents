CREATE TABLE feed_types
(
    feed_type_id         BIGINT       NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '피드 종류 테이블의 고유 식별자',
    feed_type_name       VARCHAR(255) NOT NULL COMMENT '피드 종류 이름',
    feed_type_desc       VARCHAR(255) NOT NULL COMMENT '피드 종류 설명',
    feed_type_is_active  BOOLEAN      NOT NULL COMMENT '활성화된 피드 종류 여부',
    feed_type_created_at DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    feed_type_updated_at DATETIME     NULL,
    feed_type_deleted_at DATETIME     NULL
);

CREATE TABLE feeds
(
    feed_id           BIGINT   NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '피드 식별자',
    member_id         CHAR(36) NOT NULL COMMENT 'UUID_SELF',
    feed_type_id      BIGINT   NOT NULL,
    feed_content      TEXT     NOT NULL,
    feed_likes_cnt    INTEGER  NOT NULL DEFAULT 0,
    feed_comments_cnt INTEGER  NOT NULL DEFAULT 0,
    feed_created_at   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    feed_updated_at   DATETIME NULL,
    feed_deleted_at   DATETIME NULL,

    CONSTRAINT FK_feeds_member FOREIGN KEY (member_id) REFERENCES members (member_id),
    CONSTRAINT FK_feeds_type FOREIGN KEY (feed_type_id) REFERENCES feed_types (feed_type_id)
);

CREATE TABLE feed_pictures
(
    picture_id BIGINT NOT NULL PRIMARY KEY,
    feed_id    BIGINT NOT NULL,

    CONSTRAINT FK_feed_pictures_picture FOREIGN KEY (picture_id) REFERENCES pictures (picture_id),
    CONSTRAINT FK_feed_pictures_feed FOREIGN KEY (feed_id) REFERENCES feeds (feed_id)
);

CREATE TABLE feed_likes
(
    feed_like_id         BIGINT   NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '피드 좋아요 식별자 번호',
    member_id            CHAR(36) NOT NULL COMMENT 'UUID_SELF',
    feed_id              BIGINT   NOT NULL,
    feed_like_created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT FK_feed_likes_member FOREIGN KEY (member_id) REFERENCES members (member_id),
    CONSTRAINT FK_feed_likes_feed FOREIGN KEY (feed_id) REFERENCES feeds (feed_id)
);

CREATE TABLE comments
(
    comment_id         BIGINT       NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '피드 댓글 식별자 번호',
    member_id          CHAR(36)     NOT NULL COMMENT 'UUID_SELF',
    feed_id            BIGINT       NOT NULL,
    parent_comment_id  BIGINT       NULL COMMENT 'NULL이면 최상위, 있으면 대댓글',
    comment_content    VARCHAR(255) NOT NULL COMMENT '댓글은 최대 255자까지 허용',
    comment_likes_cnt  INTEGER      NOT NULL DEFAULT 0,
    comment_created_at DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    comment_deleted_at DATETIME     NULL,

    CONSTRAINT FK_comments_member FOREIGN KEY (member_id) REFERENCES members (member_id),
    CONSTRAINT FK_comments_feed FOREIGN KEY (feed_id) REFERENCES feeds (feed_id)
);

CREATE TABLE comment_likes
(
    comment_like_id         BIGINT   NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '피드 댓글 좋아요 식별자',
    member_id               CHAR(36) NOT NULL COMMENT 'UUID_SELF',
    comment_id              BIGINT   NOT NULL,
    comment_like_created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT FK_comment_likes_member FOREIGN KEY (member_id) REFERENCES members (member_id)
);
