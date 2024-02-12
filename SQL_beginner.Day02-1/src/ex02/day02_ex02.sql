SELECT
	(COALESCE(person.name, '-')) AS person_name,
	(COALESCE(v_date.visit_date::text, 'null')) AS visit_date,
	(COALESCE(pizzeria.name, '-')) AS pizzeria_name
FROM person
FULL JOIN 
	(SELECT *
	FROM person_visits
	WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS v_date	
ON person.id = v_date.person_id
FULL JOIN pizzeria ON pizzeria.id = v_date.pizzeria_id
ORDER BY person_name, visit_date, pizzeria_name;
