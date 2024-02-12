WITH men_vis AS (
	SELECT pizzeria.name AS pizzeria_name
	FROM pizzeria
	JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
	JOIN person ON person.id = person_visits.person_id
	WHERE person.gender = 'male'
	
	EXCEPT ALL
	
	SELECT pizzeria.name AS pizzeria_name
	FROM pizzeria
	JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
	JOIN person ON person.id = person_visits.person_id
	WHERE person.gender = 'female'
), 
women_vis AS (
	SELECT pizzeria.name AS pizzeria_name
	FROM pizzeria
	JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
	JOIN person ON person.id = person_visits.person_id
	WHERE person.gender = 'female'
	
	EXCEPT ALL
	
	SELECT pizzeria.name AS pizzeria_name
	FROM pizzeria
	JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
	JOIN person ON person.id = person_visits.person_id
	WHERE person.gender = 'male'
)

SELECT pizzeria_name 
FROM men_vis

UNION ALL

SELECT pizzeria_name 
FROM women_vis

ORDER BY pizzeria_name;
