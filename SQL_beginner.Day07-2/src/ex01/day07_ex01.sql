SELECT (SELECT name
	   FROM person
	   WHERE person.id = person_visits.person_id) AS name, 
	   COUNT(*) AS count_of_visits
FROM person_visits
GROUP BY name
ORDER BY count_of_visits DESC, name
LIMIT 4;
