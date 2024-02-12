CREATE FUNCTION abs(interval) RETURNS interval AS $$ 
	select case when ($1<interval '0') then -$1 else $1 end; 
$$ LANGUAGE sql;


CREATE  FUNCTION  near (curr_id bigint, moment TIMESTAMP) RETURNS TIMESTAMP AS $$
DECLARE
  from_future BOOLEAN;
BEGIN
  from_future := (SELECT moment < MIN(updated) FROM currency WHERE id = curr_id);
  
  RETURN moment + (2*from_future::INTEGER - 1) * (
	SELECT MIN(ABS(updated - moment))
	FROM   currency
	WHERE  id = curr_id AND (from_future OR updated < moment) 
  );
END;
$$ LANGUAGE plpgsql;


SELECT COALESCE(usr.name, 'not defined') AS name,
       COALESCE(lastname, 'not defined') AS lastname,
       COALESCE(cur.name, 'not defined') AS currency_name,
       balance.money * rate_to_usd       As currency_in_usd
FROM balance 
FULL JOIN  "user" As usr on     user_id = usr.id
JOIN    currency  As cur ON currency_id = cur.id AND cur.updated = near(cur.id, balance.updated)
ORDER  BY 1 DESC, 2, 3;


DROP FUNCTION abs(interval);
DROP FUNCTION near;
