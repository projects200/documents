alter table fcm_tokens add constraint chk_fcm_token_platform CHECK (fcm_token_platform IN ('IOS', 'ANDROID', 'PC', 'ETC'));

alter table fcm_tokens add constraint chk_fcm_token_access_mode CHECK (fcm_token_access_mode IN ('APP', 'PWA', 'BROWSER'));



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

ALTER TABLE exercise_types
ADD COLUMN exercise_selection_count BIGINT DEFAULT 0 NOT NULL;
