WITH men_vis AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM pizzeria
	JOIN menu ON menu.pizzeria_id = pizzeria.id
	JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person.id = person_order.person_id
    WHERE person.gender = 'male'

    EXCEPT

    SELECT pizzeria.name AS pizzeria_name
    FROM pizzeria
	JOIN menu ON menu.pizzeria_id = pizzeria.id
	JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person.id = person_order.person_id
    WHERE person.gender = 'female'
),
women_vis AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM pizzeria
	JOIN menu ON menu.pizzeria_id = pizzeria.id
	JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person.id = person_order.person_id
    WHERE person.gender = 'female'

    EXCEPT

    SELECT pizzeria.name AS pizzeria_name
    FROM pizzeria
	JOIN menu ON menu.pizzeria_id = pizzeria.id
	JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person.id = person_order.person_id
    WHERE person.gender = 'male'
)

SELECT pizzeria_name
FROM men_vis

UNION ALL

SELECT pizzeria_name
FROM women_vis

ORDER BY pizzeria_name;
