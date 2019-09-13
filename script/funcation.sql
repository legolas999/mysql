DROP FUNCTION IF EXISTS get_sal_level;
DELIMITER $$
CREATE FUNCTION get_sal_level(emp int) RETURNS VARCHAR(10) DETERMINISTIC
BEGIN
    DECLARE sal_level varchar(10);
	DECLARE avg_sal FLOAT;
	
	SELECT AVG(salary) INTO avg_sal FROM salaries WHERE emp_no=emp;
	
	IF avg_sal < 50000 THEN
	SET  sal_level = 'BRONZE';
	ELSEIF (avg_sal >= 50000 AND avg_sal < 70000) THEN
	SET sal_level = 'SILVER';
	ELSEIF (avg_sal >= 70000 AND avg_sal < 90000) THEN
	SET sal_level = 'GOLD';
	ELSEIF (avg_sal >= 90000) THEN
	SET sal_level = 'PLATINUM';
	ELSE
	SET sal_level = 'NOT FOUND';
	END IF;
	RETURN (sal_level);
END
$$
DELIMITER ;
