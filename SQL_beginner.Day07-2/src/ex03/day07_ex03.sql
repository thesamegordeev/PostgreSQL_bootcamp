WITH orders AS (
 SELECT pizzeria.name, COUNT(*) AS count
 FROM person_order
 JOIN menu ON menu.id = person_order.menu_id
 JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
 GROUP BY pizzeria.name
 ORDER BY count DESC
),
visits AS (
 SELECT pizzeria.name, COUNT(*) AS count
 FROM person_visits
 JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
 GROUP BY pizzeria.name
 ORDER BY count DESC
),
total AS (
	SELECT *
	FROM orders
	UNION ALL
	SELECT *
	FROM visits
	
)

SELECT name, SUM(total.count) AS total_count
FROM total
GROUP BY name
ORDER BY total_count DESC, name ASC;
