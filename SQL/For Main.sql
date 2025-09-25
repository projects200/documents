DROP TABLE IF EXISTS matches;
DROP TABLE IF EXISTS open_chatrooms;
DROP TABLE IF EXISTS exercise_locations;

CREATE TABLE exercise_locations
(
    exercise_location_id         BIGINT          NOT NULL AUTO_INCREMENT,
    member_id                    CHAR(36)        NOT NULL COMMENT 'UUID_SELF',
    exercise_location_name       VARCHAR(100)    NOT NULL COMMENT '운동장소 상호명, 없으면 직접 입력',
    exercise_location_address    VARCHAR(255)    NOT NULL COMMENT 'API 에서 반환하는 도로명주소',
    exercise_location_point      POINT SRID 4326 NOT NULL COMMENT '단일 점 을 나타냄 (X,Y) 위도와 경도를 저장합니다',
    exercise_location_created_at DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    exercise_location_updated_at DATETIME        NULL,
    exercise_location_deleted_at DATETIME        NULL,
    CONSTRAINT PK_EXERCISE_LOCATIONS PRIMARY KEY (exercise_location_id),
    CONSTRAINT FK_members_TO_exercise_locations_1 FOREIGN KEY (member_id)
        REFERENCES members (member_id),
    SPATIAL INDEX idx_spatial_point (exercise_location_point) -- 공간 인덱스 추가
);

CREATE TABLE open_chatrooms
(
    open_chatroom_id         BIGINT       NOT NULL AUTO_INCREMENT,
    member_id                CHAR(36)     NOT NULL COMMENT 'UUID_SELF',
    open_chatroom_url        VARCHAR(255) NULL COMMENT '유효성 검증 필요',
    open_chatroom_created_at DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    open_chatroom_updated_at DATETIME     NULL,
    open_chatroom_deleted_at DATETIME     NULL,
    CONSTRAINT PK_OPEN_CHATROOMS PRIMARY KEY (open_chatroom_id),
    CONSTRAINT FK_members_TO_open_chatrooms_1 FOREIGN KEY (member_id)
        REFERENCES members (member_id)
);

CREATE TABLE matches
(
    match_id          BIGINT      NOT NULL AUTO_INCREMENT COMMENT 'AUTO_INCREMENT',
    requester_id      CHAR(36)    NOT NULL COMMENT 'UUID_SELF',
    receiver_id       CHAR(36)    NOT NULL COMMENT 'UUID_SELF',
    match_status      VARCHAR(30) NOT NULL DEFAULT 'PENDING' COMMENT 'PENDING, ACCEPTED, REJECTED, CANCELLED',
    match_created_at  DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    match_canceled_at DATETIME    NULL,
    match_handled_at  DATETIME    NULL,
    CONSTRAINT PK_MATCHES PRIMARY KEY (match_id),
    CONSTRAINT FK_members_TO_matches_1 FOREIGN KEY (requester_id)
        REFERENCES members (member_id),
    CONSTRAINT FK_members_TO_matches_2 FOREIGN KEY (receiver_id)
        REFERENCES members (member_id)
);

------
-- 운동 장소 생성시 추가 
INSERT INTO policy_groups (policy_groups_id, policy_groups_name)
VALUES (5, 'exercise-location');

INSERT INTO policies (policy_id, policy_key, policy_value, policy_unit, policy_description)
values (20, 'EXERCISE_LOCATION_MAX_COUNT', '10',
        'COUNT', '운동 기록이 가질 수 있는 최대 갯수');


