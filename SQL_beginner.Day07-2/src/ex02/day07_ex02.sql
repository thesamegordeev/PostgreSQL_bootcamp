WITH orders AS (
	SELECT (SELECT pizzeria_id
		   FROM menu
		   WHERE menu.id = person_order.menu_id) AS piz_id,
	COUNT(*) AS count,
	'order' AS action_type
	FROM person_order
	GROUP BY piz_id
	ORDER BY count DESC
	LIMIT 3
),
visits AS (
	SELECT pizzeria_id AS piz_id,
	COUNT(*) AS count,
	'visit' AS action_type
	FROM person_visits
	GROUP BY piz_id
	ORDER BY count DESC
	LIMIT 3
),
top_orders_and_visits AS (
	SELECT *
	FROM orders
	UNION ALL
	SELECT *
	FROM visits
)

SELECT pizzeria.name AS name, count, action_type
FROM top_orders_and_visits
JOIN pizzeria ON pizzeria.id = top_orders_and_visits.piz_id
ORDER BY action_type ASC, count DESC;
