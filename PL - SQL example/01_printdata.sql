-- Print data.
SET SERVEROUTPUT ON;
-- Type 01
BEGIN
	dbms_output.put_line('Hello World!...');
END;

-- Type 02
DECLARE 
	x NUMBER(3);
BEGIN
	temp := 3;
	dbms_output.put_line('Value of X : ' || x);
END;
