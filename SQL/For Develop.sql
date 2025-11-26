-- fcm_token_platform 컬럼 추가 (IOS, ANDROID, WEB)
ALTER TABLE fcm_tokens 
ADD COLUMN fcm_token_platform VARCHAR(20) NULL COMMENT 'IOS, ANDROID, WEB'
AFTER fcm_token_value; 

-- fcm_token_access_mode 컬럼 추가 (APP, PWA, BROWSER)
ALTER TABLE fcm_tokens 
ADD COLUMN fcm_token_access_mode VARCHAR(20) NULL COMMENT 'PWA, BROWSER, APP'
AFTER fcm_token_platform;
