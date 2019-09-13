/* 在创建之前，如果存在任何相同名字的存储过程，则删除已经存在的存储过程*/
DROP PROCEDURE IF EXISTS create_employee;
/* 修改分隔符为$$ */
DELIMITER $$
/* IN 指定作为参数的变量，OUT指定输出的变量 */
CREATE PROCEDURE create_employee (OUT new_emp_no INT, IN first_name varchar(20), IN last_name varchar(20),IN gender enum('M','F'),IN birth_date date,IN emp_dept_name varchar(40),IN title varchar(50))
BEGIN
	/* 为emp_dept_no和salary声明变量 */
	DECLARE emp_dept_no char(4);
	DECLARE salary int DEFAULT 60000;
	
	/* 查询employees表的emp_no的最大值，赋值给变量new_emp_no */
	SELECT max(emp_no) INTO new_emp_no FROM employees;
	/* 增加new_emp_no */
	SET new_emp_no = new_emp_no + 1;
	
	/* 插入数据到employees表中 */
	/* CURDATE()函数给出当前日期 */
	INSERT INTO employees VALUES(new_emp_no,birth_date,first_name,last_name,gender,CURDATE());
	
	/* 找到dept_name对应的dept_no */
	SELECT emp_dept_name;
	SELECT dept_no INTO emp_dept_no FROM departments WHERE dept_name=emp_dept_name;
	SELECT emp_dept_no;
	
	/* 插入dept_emp */
	INSERT INTO dept_emp VALUES(new_emp_no,emp_dept_no,CURDATE(),'9999-01-01');
	
	/* 插入titles */
	INSERT INTO titles VALUES(new_emp_no,title,CURDATE(),'9999-01-01');
	
	/* 以title为条件查询的薪水 */
	IF title = 'Staff'
	    THEN SET salary = 100000;
	ELSEIF title = 'Senior Staff'
	    THEN SET salary = 120000;
	END IF;
	
	/* 插入salaries */
	INSERT INTO salaries VALUES(new_emp_no,salary,CURDATE(),'9999-01-01');

END
$$
/* 把分隔符改回；*/
DELIMITER ;
