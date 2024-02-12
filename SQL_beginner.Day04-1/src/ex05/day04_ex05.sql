CREATE VIEW v_price_with_discount AS
	WITH disc AS (
		SELECT id, (price - price * 0.1) AS discount_price
		FROM menu
	)

	SELECT person.name, menu.pizza_name, menu.price, round(disc.discount_price) AS discount_price
	FROM menu
	JOIN person_order ON menu.id = person_order.menu_id
	JOIN person ON person.id = person_order.person_id
	JOIN disc ON disc.id = menu.id
	ORDER BY person.name, menu.pizza_name;
