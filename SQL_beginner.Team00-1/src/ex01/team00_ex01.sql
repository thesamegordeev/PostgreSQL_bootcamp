CREATE VIEW tsp AS (
	WITH RECURSIVE tour AS (
		SELECT
			point1 AS tour,
			point1,
			point2,
			cost AS previous_tour,
			cost AS add_path,
			cost AS total_tour
		FROM paths
		WHERE point1 = 'A'
		UNION ALL
		SELECT
			t.tour || ',' || t.point2 AS tour,
			p.point1,
			p.point2,
			t.total_tour AS previous_tour,
			p.cost,
			t.total_tour + p.cost AS total_tour
		FROM
			paths p
			JOIN tour t ON p.point1 = t.point2
		WHERE tour NOT LIKE '%' || t.point2 || '%'
	)
	SELECT *
	FROM tour
);

WITH min_tour AS (
	SELECT MIN(total_tour)
	FROM tsp
	WHERE length(tour) = 7 AND point2 = 'A'
), max_tour AS (
	SELECT MAX(total_tour)
	FROM tsp
	WHERE length(tour) = 7 AND point2 = 'A'
)
SELECT
    total_tour,
    '{' || tour || ',A' || '}' AS tour
FROM tsp
WHERE
    length(tour) = 7 AND
    point2 = 'A'AND
    total_tour = (SELECT * FROM min_tour)
	OR total_tour = (SELECT * FROM max_tour)
ORDER BY 1, 2;
