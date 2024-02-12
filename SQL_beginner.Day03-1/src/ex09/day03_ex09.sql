INSERT INTO person_visits
VALUES ((SELECT MAX(id) + 1 FROM person_visits), 
	   (SELECT person.id FROM person WHERE person.name = 'Denis'),
	   (SELECT id FROM pizzeria WHERE name = 'Dominos'),
		'2022-02-24'),
		((SELECT MAX(id) + 2 FROM person_visits), 
	   (SELECT person.id FROM person WHERE person.name = 'Irina'),
	   (SELECT id FROM pizzeria WHERE name = 'Dominos'),
		'2022-02-24');
