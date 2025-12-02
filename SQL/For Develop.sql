alter table fcm_tokens add constraint chk_fcm_token_platform CHECK (fcm_token_platform IN ('IOS', 'ANDROID', 'PC', 'ETC'));

alter table fcm_tokens add constraint chk_fcm_token_access_mode CHECK (fcm_token_access_mode IN ('APP', 'PWA', 'BROWSER'));
