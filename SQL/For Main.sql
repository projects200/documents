DROP TABLE fcm_tokens

CREATE TABLE IF NOT EXISTS fcm_tokens
(
    fcm_token_id           BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT 'AUTO_INCREMENT',
    member_id              CHAR(36)     NOT NULL COMMENT 'UUID_SELF',
    fcm_token_value       VARCHAR(255) NOT NULL COMMENT 'FCM 토큰 값 (UNIQUE)',
    fcm_token_platform    VARCHAR(20)  NULL COMMENT 'IOS, ANDROID, WEB',
    fcm_token_access_mode VARCHAR(20)  NULL COMMENT 'PWA, BROWSER, APP',
    fcm_token_user_agent   VARCHAR(255) NULL COMMENT '디바이스 정보 (User Agent)',
    fcm_token_is_active   BOOLEAN      NOT NULL DEFAULT TRUE COMMENT '토큰 활성화 여부',
    fcm_token_activated_at DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '마지막 활성 일시',
    fcm_token_expired_at  DATETIME     NOT NULL DEFAULT (CURRENT_TIMESTAMP + INTERVAL 30 DAY) COMMENT '토큰 만료 일시 (활성화된 경우 현재 시점으로부터 30일 후)',
    fcm_token_created_at   DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',

    CONSTRAINT fk_fcm_tokens_to_members FOREIGN KEY (member_id) REFERENCES members (member_id),
    CONSTRAINT uk_fcm_tokens_value UNIQUE (fcm_token_value)
);

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
VALUES ('WORKOUT_REMINDER', 'PERSONAL', TRUE, TRUE, NOW());



INSERT INTO exercise_types (exercise_name, exercise_type_image_url)
VALUES ('wrestling', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/wrestling.png'),
       ('water_polo', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/water_polo.png'),
       ('volleyball', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/volleyball.png'),
       ('tennis', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/tennis.png'),
       ('taekwondo', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/taekwondo.png'),
       ('table_tennis',
        'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/table_tennis.png'),
       ('squash', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/squash.png'),
       ('soccer', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/soccer.png'),
       ('ski', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/ski.png'),
       ('running', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/running.png'),
       ('rugby', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/rugby.png'),
       ('rowing', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/rowing.png'),
       ('power_lifting',
        'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/power_lifting.png'),
       ('pilates', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/pilates.png'),
       ('marathon', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/marathon.png'),
       ('handball', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/handball.png'),
       ('golf', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/golf.png'),
       ('gate_ball', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/gate_ball.png'),
       ('futsal', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/futsal.png'),
       ('fitness', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/fitness.png'),
       ('fishhook', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/fishhook.png'),
       ('fencing', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/fencing.png'),
       ('curling', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/curling.png'),
       ('crossfit', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/crossfit.png'),
       ('cricket', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/cricket.png'),
       ('boxing', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/boxing.png'),
       ('bowling', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/bowling.png'),
       ('bicycle', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/bicycle.png'),
       ('basketball', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/basketball.png'),
       ('baseball', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/baseball.png'),
       ('badminton', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/badminton.png'),
       ('American_football',
        'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/American_football.png');
