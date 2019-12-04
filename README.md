## Table of contents
* [General info](#general-info)
* [Usage](#Usage)
* [License](#License)

## General info
* keepChars - implemention of keepchars function for mysql
* lock_user_by_password_expired_date - lock mysql users based on password expiration

## Usage
keepChars example :
```sql
select keepchars('def(#)123??45!!67$abc$','abcdef123456'); 
# will return def123456abc; 
```

lock_user_by_password_expired_date example :
```sql 
call `db_name`.lock_user_by_password_expired_date();
# will run and return ALTER USER 'roi_test'@'%' ACCOUNT LOCK;
```

## License
[MIT](https://choosealicense.com/licenses/mit/)



