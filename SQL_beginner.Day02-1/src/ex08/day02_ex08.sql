SELECT person.name
FROM person
JOIN person_order ON person_order.person_id = person.id
JOIN menu ON menu.id = person_order.menu_id
WHERE person.address IN ('Moscow', 'Samara')
	AND person.gender = 'male'
	AND menu.pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY person.name DESC;
