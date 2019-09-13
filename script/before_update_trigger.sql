DROP TRIGGER IF EXISTS salary_update_round;
DELIMITER $$
CREATE TRIGGER salary_update_round BEFORE UPDATE ON salaries
FOR EACH ROW
BEGIN
    SET NEW.salary=ROUND(NEW.salary);
END
$$
DELIMITER ;
