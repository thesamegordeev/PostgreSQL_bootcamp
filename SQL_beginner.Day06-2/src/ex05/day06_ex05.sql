COMMENT ON TABLE person_discounts IS 'Таблица персональных скидок для частых покупателей пиццерий';
COMMENT ON COLUMN person_discounts.id IS 'Столбец с первичным ключом - id каждой скидки';
COMMENT ON COLUMN person_discounts.person_id IS 'Столбец Id человека, которому принадлежит скидка в конкретной пиццерии';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Столбец Id пиццерии, в которой человека с person_id в той же строке есть персональная скидка';
COMMENT ON COLUMN person_discounts.discount IS 'Столбец персональной скидки в % для каждой пиццерии';
