DROP FUNCTION fnc_fibonacci;
CREATE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10)
RETURNS TABLE(fib_nums integer) AS $fib_table$
	WITH RECURSIVE fibonacci(a, b) AS
	(
		values(0, 1)
		UNION ALL
		SELECT greatest(a, b), 
			   a + b 
		FROM fibonacci
		WHERE b < pstop
	)
	SELECT a AS fib_nums
	FROM fibonacci;
$fib_table$ LANGUAGE SQL;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();
