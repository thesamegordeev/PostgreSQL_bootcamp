WITH person_age AS (
	SELECT address,
		ROUND((MAX(age)::numeric - (MIN(age)::numeric/ MAX(age)::numeric)), 2)::float AS formula,
		ROUND(AVG(age), 2)::float AS average
	FROM person
	GROUP BY address
)

SELECT address, 
	formula,
	average,
	(SELECT 
		CASE
		WHEN formula > average THEN 'true'
		ELSE 'false'
		END
	) AS comparison
FROM person_age
ORDER BY address;
