CREATE TABLE IF NOT EXISTS person_audit
(
	created TIMESTAMPTZ(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
	type_event char(1) NOT NULL DEFAULT 'I',
	row_id bigint NOT NULL,
	name varchar,
	age integer,
	gender varchar,
	address varchar,
	CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D'))
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $trg_person_insert_audit$
    BEGIN
        IF (TG_OP = 'INSERT') THEN
			INSERT INTO person_audit SELECT
				CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow',
				'I',
				NEW.*;
		END IF;
		RETURN NULL;
	END;
$trg_person_insert_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit 
	AFTER INSERT 
	ON person
	FOR EACH ROW
	EXECUTE PROCEDURE fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
