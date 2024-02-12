SELECT order_date, FORMAT('%s (age:%s)', person.name, person.age) AS person_information
FROM person_order
INNER JOIN person ON person.id = person_order.person_id
ORDER BY order_date ASC, person_information ASC;
