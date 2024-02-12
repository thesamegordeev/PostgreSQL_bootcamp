WITH Andrey_vis AS (
	SELECT pizzeria.name AS pizzeria_name
	FROM pizzeria
	JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
	JOIN person ON person.id = person_visits.person_id
	WHERE person.name = 'Andrey'
),
Andrey_ord AS (
	SELECT pizzeria.name AS pizzeria_name
	FROM pizzeria
	JOIN menu ON menu.pizzeria_id = pizzeria.id
	JOIN person_order ON person_order.menu_id = menu.id
	JOIN person ON person.id = person_order.person_id
	WHERE person.name = 'Andrey'
)

SELECT pizzeria_name FROM Andrey_vis
EXCEPT
SELECT pizzeria_name FROM Andrey_ord

ORDER BY pizzeria_name;
