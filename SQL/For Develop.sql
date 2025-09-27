DROP TABLE IF EXISTS open_chatrooms;

CREATE TABLE open_chatrooms
(
    open_chatroom_id             BIGINT       NOT NULL AUTO_INCREMENT COMMENT 'AUTO_INCREMENT',
    member_id                    CHAR(36)     NOT NULL COMMENT 'UUID_SELF',
    open_chatroom_url            VARCHAR(255) NULL COMMENT '유효성 검증 필요',
    open_chatroom_created_at     DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    open_chatroom_updated_at     DATETIME     NULL,
    open_chatroom_deleted_at     DATETIME     NULL,
    member_id_unique_key         BIGINT       NOT NULL DEFAULT 0 COMMENT '활성 레코드의 member_id 유일성 보장을 위한 키. 기본값 0, 삭제 시 자신의 PK 값으로 변경됨',
    open_chatroom_url_unique_key BIGINT       NOT NULL DEFAULT 0 COMMENT '활성 레코드의 url 유일성 보장을 위한 키. 기본값 0, 삭제 시 자신의 PK 값으로 변경됨',

    -- 기본 키
    CONSTRAINT PK_OPEN_CHATROOMS PRIMARY KEY (open_chatroom_id),

    -- 외래 키
    CONSTRAINT FK_members_TO_open_chatrooms_1 FOREIGN KEY (member_id)
        REFERENCES members (member_id),

    -- 조건부 UNIQUE 제약조건 1: 활성 상태의 member_id는 유일해야 함
    CONSTRAINT UK_active_member_id UNIQUE (member_id, member_id_unique_key),

    -- 조건부 UNIQUE 제약조건 2: 활성 상태의 open_chatroom_url은 유일해야 함
    CONSTRAINT UK_active_url UNIQUE (open_chatroom_url, open_chatroom_url_unique_key)
);
