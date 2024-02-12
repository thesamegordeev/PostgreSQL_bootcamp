WITH not_ordered AS (
	SELECT id FROM menu
	EXCEPT
	SELECT menu_id FROM person_order
	ORDER BY id
)

SELECT menu.pizza_name, menu.price,
	pizzeria.name AS pizzeria_name
FROM not_ordered
JOIN menu ON not_ordered.id = menu.id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY pizza_name, price;
