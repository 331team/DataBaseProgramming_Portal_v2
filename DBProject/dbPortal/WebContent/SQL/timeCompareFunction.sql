 
/*요일비교*/
CREATE OR REPLACE FUNCTION compareDay
	(t_day1   IN   VARCHAR2,
	 t_day2   IN   VARCHAR2)

RETURN INT
IS
	i     		INT:=1;

BEGIN
	FOR i IN 1..LENGTH(t_day1) LOOP
	    IF(INSTR(t_day2, SUBSTR(t_day1,i,1),1,1)!=0)
	    THEN RETURN 1;
	    END IF;
	END LOOP;
	
     	RETURN 0;

END;
/