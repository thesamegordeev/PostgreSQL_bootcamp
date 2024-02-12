WITH cheese_order AS (
	SELECT person.name
	FROM person
	JOIN person_order ON person_order.person_id = person.id
	JOIN menu ON person_order.menu_id = menu.id
	WHERE menu.pizza_name = 'cheese pizza' AND person.gender = 'female'
),
pepperoni_order AS (
	SELECT person.name
	FROM person
	JOIN person_order ON person_order.person_id = person.id
	JOIN menu ON person_order.menu_id = menu.id
	WHERE menu.pizza_name = 'pepperoni pizza' AND person.gender = 'female'
)

SELECT cheese_order.name
FROM cheese_order
JOIN pepperoni_order ON pepperoni_order.name = cheese_order.name
ORDER BY cheese_order.name;
