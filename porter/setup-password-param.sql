-- 设置默认用户密码和登录次数
alter profile default limit password_life_time unlimited;
alter profile default limit failed_login_attempts unlimited;

-- 查看用户密码过去情况
-- select username, account_status, lock_date, expiry_date, created, profile from dba_users;
-- select * from dba_profiles where profile = upper('default');

-- 配置密码忽略大小写
alter system set sec_case_sensitive_logon = false;
