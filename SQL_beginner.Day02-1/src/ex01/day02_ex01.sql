SELECT m_days::date AS missing_date
FROM 
	generate_series('2022-01-01', '2022-01-10', interval '1 day') AS m_days
LEFT JOIN 
	(SELECT *
	FROM person_visits
	WHERE person_id = 1 OR person_id = 2) AS v_days
	ON v_days.visit_date = m_days
WHERE person_id IS NULL
ORDER BY missing_date ASC;
