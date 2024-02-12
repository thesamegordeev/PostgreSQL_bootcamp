SELECT pizzeria.name,
	   COUNT(person_order.menu_id) AS count_of_orders,
	   ROUND(AVG(menu.price), 2)::float AS average_price,
	   MAX(menu.price) AS max_price,
	   MIN(menu.price) AS min_price
FROM menu
JOIN person_order ON person_order.menu_id = menu.id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY pizzeria.name
ORDER BY pizzeria.name;
