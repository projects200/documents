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

ALTER TABLE fcm_tokens
    add constraint uk_fcm_tokens_value UNIQUE (fcm_token_value);
