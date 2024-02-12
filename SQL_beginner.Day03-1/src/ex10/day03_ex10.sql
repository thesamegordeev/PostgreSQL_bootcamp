INSERT INTO person_order
VALUES ((SELECT MAX(id) + 1 FROM person_order), 
	   (SELECT person.id FROM person WHERE person.name = 'Denis'),
	   (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
		'2022-02-24'),
		((SELECT MAX(id) + 2 FROM person_order), 
	   (SELECT person.id FROM person WHERE person.name = 'Irina'),
	   (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
		'2022-02-24');
