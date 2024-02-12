DROP FUNCTION IF EXISTS fnc_persons_female;
DROP FUNCTION IF EXISTS fnc_persons_male;

CREATE FUNCTION fnc_persons(IN pgender varchar DEFAULT 'female')
	RETURNS TABLE
	(
		id bigint,
		name varchar,
		age varchar,
		gender varchar,
		address varchar
	) AS $$
	
	SELECT *
	FROM person
	WHERE gender = $1
$$ LANGUAGE SQL;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();

