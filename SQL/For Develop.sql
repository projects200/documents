-- 기존 테이블 삭제
DROP TABLE IF EXISTS chats;
DROP TABLE IF EXISTS chatroom_members;
DROP TABLE IF EXISTS chatrooms;

-- 채팅방 테이블
CREATE TABLE chatrooms (
    chatroom_id BIGINT NOT NULL AUTO_INCREMENT COMMENT '채팅방 식별자',
    last_chat_content VARCHAR(255) NULL COMMENT '목록 조회를 위한 마지막 메시지 내용',
    last_chat_received_at DATETIME NULL COMMENT '목록 정렬을 위한 마지막 메시지 시간',
    chatroom_created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    chatroom_deleted_at DATETIME NULL,
    CONSTRAINT PK_CHATROOMS PRIMARY KEY (chatroom_id)
);

-- 채팅방 멤버 테이블
CREATE TABLE chatroom_members (
    chatroom_member_id BIGINT NOT NULL AUTO_INCREMENT COMMENT '채팅방 멤버 식별자',
    chatroom_id BIGINT NOT NULL COMMENT '채팅방 식별자',
    member_id CHAR(36) NOT NULL COMMENT 'UUID_SELF',
    chatroom_member_status ENUM('ACTIVE', 'LEFT') NOT NULL DEFAULT 'ACTIVE' COMMENT 'ACTIVE(참여중), LEFT(나감)',
    last_read_chat_id BIGINT NULL COMMENT '회원이 마지막으로 읽은 채팅 식별자',
    CONSTRAINT PK_CHATROOM_MEMBERS PRIMARY KEY (chatroom_member_id),
    CONSTRAINT UQ_chatroom_members_chatroom_member UNIQUE (chatroom_id, member_id),
    CONSTRAINT FK_chatrooms_TO_chatroom_members_1 FOREIGN KEY (chatroom_id)
        REFERENCES chatrooms (chatroom_id),
    CONSTRAINT FK_members_TO_chatroom_members_1 FOREIGN KEY (member_id)
        REFERENCES members (member_id)
);

-- 채팅 테이블
CREATE TABLE chats (
    chat_id BIGINT NOT NULL AUTO_INCREMENT COMMENT '채팅 식별자',
    sender_id CHAR(36) NULL COMMENT 'UUID_SELF',
    chatroom_id BIGINT NOT NULL COMMENT '채팅방 식별자',
    chat_content VARCHAR(500) NOT NULL,
    chat_type ENUM('USER', 'SYSTEM') NOT NULL DEFAULT 'USER' COMMENT 'USER,SYSTEM',
    chat_created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_CHATS PRIMARY KEY (chat_id),
    CONSTRAINT FK_members_TO_chats_1 FOREIGN KEY (sender_id)
        REFERENCES members (member_id),
    CONSTRAINT FK_chatrooms_TO_chats_1 FOREIGN KEY (chatroom_id)
        REFERENCES chatrooms (chatroom_id)
);
