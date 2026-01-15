
INSERT INTO policies (policy_id, policy_key, policy_value, policy_unit, policy_description)
VALUES (22, 'EXERCISE_LOCATION_MAX_DISTANCE_METER', '5000', 'METERS', '현재 사용자와 운동장소간의 허용 가능한 최대 거리');

INSERT INTO policy_group_mappings (policy_id, policy_groups_id)
VALUES (22, 5);
