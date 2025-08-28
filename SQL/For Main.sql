ALTER TABLE exercise_types
    DROP COLUMN exercise_type_emoji,
    ADD COLUMN exercise_type_original_image VARCHAR(100) NULL;

ALTER TABLE members
    -- 1. member_picture_id 컬럼 추가 (member_id 컬럼 다음에 위치)
    ADD COLUMN member_picture_id BIGINT NULL COMMENT '프로필 사진 식별자' AFTER member_id,
    
    -- 2. 외래 키(Foreign Key) 제약조건 추가
    ADD CONSTRAINT FK_member_pictures_TO_members_1
        FOREIGN KEY (member_picture_id)
        REFERENCES member_pictures (picture_id);


ALTER TABLE preferred_exercises
    -- 1. 컬럼 추가
    ADD COLUMN preferred_exercise_updated_at DATETIME DEFAULT CURRENT_TIMESTAMP NULL AFTER preferred_exercise_created_at,
    ADD COLUMN preferred_exercise_date TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '0~127' AFTER preferred_exercise_skill_level,

    -- 2. 기존 CHECK 제약조건 삭제
    DROP CONSTRAINT check_preferred_exercise_skill_level,

    -- 3. 새로운 CHECK 제약조건 추가
    ADD CONSTRAINT check_preferred_exercise_skill_level 
        CHECK (preferred_exercise_skill_level IN ('BEGINNER', 'ROOKIE', 'INTERMEDIATE', 'ADVANCED', 'SKILLED', 'PRO'));

-- 로컬에서 동작 확인하였습니다.
