CREATE TABLE `exercise_locations` (
    `exercise_location_id` BIGINT NOT NULL AUTO_INCREMENT,
    `member_id` CHAR(36) NOT NULL COMMENT 'UUID_SELF',
    `exercise_location_name` VARCHAR(100) NOT NULL COMMENT '운동장소 상호명, 없으면 직접 입력',
    `exercise_location_address` VARCHAR(255) NOT NULL COMMENT 'API 에서 반환하는 도로명주소',
    `exercise_location_point` POINT NOT NULL SRID 4326 COMMENT '단일 점 을 나타냄 (X,Y) 위도와 경도를 저장합니다',
    `exercise_location_created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `exercise_location_updated_at` DATETIME NULL,
    `exercise_location_deleted_at` DATETIME NULL,
    CONSTRAINT `PK_EXERCISE_LOCATIONS` PRIMARY KEY (`exercise_location_id`),
    CONSTRAINT `FK_members_TO_exercise_locations_1` FOREIGN KEY (`member_id`)
        REFERENCES `members` (`member_id`)
);

CREATE TABLE `open_chatrooms` (
    `open_chatroom_id` BIGINT NOT NULL AUTO_INCREMENT,
    `member_id` CHAR(36) NOT NULL COMMENT 'UUID_SELF',
    `open_chatroom_url` VARCHAR(255) NULL COMMENT '유효성 검증 필요',
    `open_chatroom_created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `open_chatroom_updated_at` DATETIME NULL,
    `open_chatroom_deleted_at` DATETIME NULL,
    CONSTRAINT `PK_OPEN_CHATROOMS` PRIMARY KEY (`open_chatroom_id`),
    CONSTRAINT `FK_members_TO_open_chatrooms_1` FOREIGN KEY (`member_id`)
        REFERENCES `members` (`member_id`)
);


로컬에서 확인 필요
