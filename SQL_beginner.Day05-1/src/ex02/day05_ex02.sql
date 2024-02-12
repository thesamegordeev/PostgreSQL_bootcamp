CREATE INDEX idx_person_name ON person (UPPER(name));

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
	SELECT name, age, gender
	FROM person
	WHERE UPPER(name) = 'DMITRIY';
