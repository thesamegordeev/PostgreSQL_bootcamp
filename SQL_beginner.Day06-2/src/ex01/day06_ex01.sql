WITH orders_amount AS 
(
	SELECT person_order.person_id, menu.pizzeria_id, COUNT(*) as orders
	FROM menu
	JOIN person_order ON person_order.menu_id = menu.id
	GROUP BY person_order.person_id, menu.pizzeria_id
), 
persons_discount AS 
(
	SELECT person_id, pizzeria_id, 
	(
	 CASE 
		WHEN orders = 1 THEN 10.5
		WHEN orders = 2 THEN 22
	 	ELSE 30
	 END
	) AS discount
	FROM orders_amount
)

INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
	SELECT
		ROW_NUMBER() OVER() AS id, 
	 	person_id,
		pizzeria_id,
	 	discount 
	 FROM persons_discount;
