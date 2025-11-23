DROP TABLE device_notification_settings;

CREATE TABLE IF NOT EXISTS notification_types
(
    notification_type_id              BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '알림 종류의 고유 식별자 (PK)',
    notification_type_code            VARCHAR(50) NOT NULL UNIQUE COMMENT '알림 종류를 식별하는 고유 코드 (예: CHAT_MESSAGE)',
    notification_type_category        VARCHAR(50) NOT NULL COMMENT '알림 카테고리 (PERSONAL, NOTICE, MARKETING 등)',
    notification_type_default_enabled BOOLEAN     NOT NULL DEFAULT TRUE COMMENT '새 사용자/기기에 기본으로 활성화될지 여부',
    notification_type_is_active       BOOLEAN     NOT NULL DEFAULT TRUE COMMENT '해당 알림 타입의 시스템 전체 활성화 여부',
    notification_type_created_at      DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT uq_token_and_type UNIQUE (notification_type_code)
);

CREATE TABLE IF NOT EXISTS device_notification_settings
(
    setting_id           BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '설정 테이블의 고유 식별자',
    fcm_token_id         BIGINT   NOT NULL COMMENT '설정의 주체가 되는 디바이스의 ID (fcm_tokens 테이블 FK)',
    notification_type_id BIGINT   NOT NULL COMMENT '알림 종류 ID',
    is_enabled           BOOLEAN  NOT NULL DEFAULT TRUE COMMENT '해당 알림 수신 여부 (TRUE: 켬, FALSE: 끔)',
    updated_at           DATETIME NULL COMMENT '설정이 마지막으로 변경된 시간',
    created_at           DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '설정 레코드가 처음 생성된 시간',

    CONSTRAINT uq_token_and_type UNIQUE (fcm_token_id, notification_type_id),
    CONSTRAINT fk_settings_to_fcm_tokens FOREIGN KEY (fcm_token_id) REFERENCES fcm_tokens (fcm_token_id) ON DELETE CASCADE,
    CONSTRAINT fk_settings_to_notification_types FOREIGN KEY (notification_type_id) REFERENCES notification_types (notification_type_id)
);


INSERT INTO notification_types (notification_type_code, notification_type_category, notification_type_default_enabled,
                                notification_type_is_active, notification_type_created_at)
VALUES ('CHAT_MESSAGE', 'PERSONAL', TRUE, TRUE, NOW());

-- 2. 운동 독려 알림 타입 추가
INSERT INTO notification_types (notification_type_code, notification_type_category, notification_type_default_enabled,
                                notification_type_is_active, notification_type_created_at)
VALUES ('WORKOUT_REMI
