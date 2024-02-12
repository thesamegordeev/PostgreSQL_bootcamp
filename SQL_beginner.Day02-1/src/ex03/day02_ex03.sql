WITH days_cte AS (
	SELECT m_days::date AS missing_date
	FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS m_days),
visits_cte AS (
	SELECT *
	FROM person_visits
	WHERE person_id = 1 OR person_id = 2)
	
SELECT days_cte.missing_date
FROM days_cte
LEFT JOIN visits_cte ON visits_cte.visit_date = days_cte.missing_date
WHERE visits_cte.person_id IS NULL
ORDER BY days_cte.missing_date ASC;
