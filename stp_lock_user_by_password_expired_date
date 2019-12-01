CREATE DEFINER=`root`@`localhost` PROCEDURE `lock_user_by_password_expired_date`()
BEGIN

	/*************************************************************************** 
	* example of use :
	* call blog.lock_user_by_password_expired_date();
	* will run and return ALTER USER 'roi_test'@'%' ACCOUNT LOCK;;
	* ***************************************************************************/

	DECLARE host_str, user_str VARCHAR(50);
	DECLARE done INT DEFAULT FALSE;
	DECLARE users_to_lock_cursor CURSOR FOR 
		SELECT `Host`, `User` 
		FROM mysql.`user`
		WHERE DATEDIFF(NOW(), DATE_ADD(password_last_changed, INTERVAL password_lifetime DAY ) ) > 0
			  AND `User` NOT REGEXP '^(mysql.|root)' 
			  AND account_locked='N';
	
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE; 
	OPEN users_to_lock_cursor;
	
	read_loop: LOOP
		FETCH users_to_lock_cursor INTO host_str, user_str;
			SET @lock_user_query_pstmt = CONCAT("ALTER USER '",user_str,"'@'",host_str,"' ACCOUNT LOCK;");
			SELECT @lock_user_query_pstmt;
            PREPARE lock_user_query_stmt FROM @lock_user_query_pstmt;
			EXECUTE lock_user_query_stmt;
			DEALLOCATE PREPARE lock_user_query_stmt;
        IF done THEN 
			LEAVE read_loop;
		END	IF;
	END LOOP;
	CLOSE users_to_lock_cursor;

END
