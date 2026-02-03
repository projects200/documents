INSERT INTO policies (policy_id, policy_key, policy_value, policy_unit, policy_description)
VALUES (23, 'FEED_PICTURE_MAX_COUNT', '5', 'COUNT', '저장할 수 있는 최대 피드 사진 수');

INSERT INTO policy_groups (policy_groups_id, policy_groups_name)
VALUES (6, 'feed');

INSERT INTO policy_group_mappings (policy_id, policy_groups_id)
VALUES (23, 6);
