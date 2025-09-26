------
-- 운동 장소 생성시 추가 
INSERT INTO policy_groups (policy_groups_id, policy_groups_name)
VALUES (5, 'exercise-location');

INSERT INTO policies (policy_id, policy_key, policy_value, policy_unit, policy_description)
values (20, 'EXERCISE_LOCATION_MAX_COUNT', '10',
        'COUNT', '운동 기록이 가질 수 있는 최대 갯수');


