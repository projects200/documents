INSERT INTO exercise_types (exercise_name, exercise_type_image_url)
VALUES ('레슬링', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/wrestling.png'),
       ('수구', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/water_polo.png'),
       ('배구', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/volleyball.png'),
       ('테니스', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/tennis.png'),
       ('태권도', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/taekwondo.png'),
       ('탁구',
        'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/table_tennis.png'),
       ('스쿼시', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/squash.png'),
       ('축구', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/soccer.png'),
       ('스키', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/ski.png'),
       ('런닝', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/running.png'),
       ('럭비', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/rugby.png'),
       ('조정', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/rowing.png'),
       ('파워 리프팅',
        'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/power_lifting.png'),
       ('필라테스', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/pilates.png'),
       ('마라톤', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/marathon.png'),
       ('핸드볼', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/handball.png'),
       ('골프', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/golf.png'),
       ('게이트볼', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/gate_ball.png'),
       ('풋살', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/futsal.png'),
       ('헬스', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/fitness.png'),
       ('낚시', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/fishhook.png'),
       ('펜싱', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/fencing.png'),
       ('컬링', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/curling.png'),
       ('크로스핏', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/crossfit.png'),
       ('크리켓', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/cricket.png'),
       ('복싱', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/boxing.png'),
       ('볼링', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/bowling.png'),
       ('자전거', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/bicycle.png'),
       ('농구', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/basketball.png'),
       ('야구', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/baseball.png'),
       ('배드민턴', 'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/badminton.png'),
       ('미식축구',
        'https://undabang-public-assets.s3.ap-northeast-2.amazonaws.com/images/exercises/American_football.png');


ALTER TABLE exercise_types
ADD COLUMN exercise_selection_count BIGINT DEFAULT 0 NOT NULL;

INSERT INTO policies (policy_key, policy_value, policy_unit, policy_description)
VALUES ('PREFERRED_EXERCISE_MAX_COUNT', '5', 'COUNT', '선호 운동 최대 보유 갯수');
