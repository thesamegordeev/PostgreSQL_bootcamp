CREATE FUNCTION fnc_persons_female()
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
	WHERE gender = 'female'
$$ LANGUAGE SQL;

CREATE FUNCTION fnc_persons_male()
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
	WHERE gender = 'male'
$$ LANGUAGE SQL;

SELECT * FROM fnc_persons_female();
SELECT * FROM fnc_persons_male();