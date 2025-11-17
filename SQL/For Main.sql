drop table fcm_tokens
CREATE TABLE IF NOT EXISTS fcm_tokens
(
    fcm_token_id           BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT 'AUTO_INCREMENT',
    member_id              CHAR(36)     NOT NULL COMMENT 'UUID_SELF',
    fcm_token_value      VARCHAR(255) NOT NULL COMMENT 'FCM 토큰 값 (UNIQUE)',
    fcm_token_user_agent   VARCHAR(255) NULL COMMENT '디바이스 정보 (User Agent)',
    fcm_token_is_active  BOOLEAN      NOT NULL DEFAULT TRUE COMMENT '토큰 활성화 여부',
    fcm_token_activated_at DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '마지막 활성 일시',
    fcm_token_expired_at DATETIME     NOT NULL DEFAULT (CURRENT_TIMESTAMP + INTERVAL 30 DAY) COMMENT '토큰 만료 일시 (활성화된 경우 현재 시점으로부터 30일 후)',
    fcm_token_created_at   DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',

    CONSTRAINT fk_fcm_tokens_to_members FOREIGN KEY (member_id) REFERENCES members (member_id),
    CONSTRAINT uk_fcm_tokens_value UNIQUE (fcm_token_value)
);

CREATE TABLE IF NOT EXISTS device_notification_settings
(
    setting_id        BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '설정 테이블의 고유 식별자',
    fcm_token_id      BIGINT      NOT NULL COMMENT '설정의 주체가 되는 디바이스의 ID (fcm_tokens 테이블 FK)',
    notification_type VARCHAR(50) NOT NULL COMMENT '알림 종류를 나타내는 코드 (CHAT_MESSAGE, WORKOUT_REMINDER)',
    is_enabled        BOOLEAN     NOT NULL DEFAULT TRUE COMMENT '해당 알림 수신 여부 (TRUE: 켬, FALSE: 끔)',
    updated_at        DATETIME    NULL COMMENT '설정이 마지막으로 변경된 시간',
    created_at        DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '설정 레코드가 처음 생성된 시간',

    CONSTRAINT uq_token_and_type UNIQUE (fcm_token_id, notification_type),
    CONSTRAINT fk_settings_to_fcm_tokens FOREIGN KEY (fcm_token_id) REFERENCES fcm_tokens (fcm_token_id) ON DELETE CASCADE
);
