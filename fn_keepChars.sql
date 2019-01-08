CREATE FUNCTION `keepChars`(str VARCHAR(400) CHARSET utf8, keep_chars VARCHAR(100) CHARSET utf8 ) 
    RETURNS varchar(50) CHARSET utf8 COLLATE utf8_bin
    DETERMINISTIC
BEGIN
	/*************************************************************************** 
	* example of use :
	* select keepchars('def(#)123??45!!67$abc$','abcdef123456');
  * will return def123456abc;
	* ***************************************************************************/
  
	DECLARE str_length TINYINT;
	DECLARE i TINYINT;
    DECLARE res VARCHAR(400) CHARSET utf8; 
    DECLARE current_char CHAR(1) CHARSET utf8;
   
    SET i = 0;
    SET res = '';
    SET current_char = '';
    SET str_length = CHAR_LENGTH(str);
   
    WHILE i <= str_length DO
	
	  SET current_char = SUBSTRING(str FROM i FOR 1);
	  
	  IF ( INSTR( keep_chars, current_char ) )
	   THEN SET res = CONCAT(res, current_char);
	  END IF;
      
	  SET i = i+1;
    
	END WHILE;
   
   RETURN res;
	
END
