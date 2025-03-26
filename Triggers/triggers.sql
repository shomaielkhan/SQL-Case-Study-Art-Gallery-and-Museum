--Trigger to Prevent Negative Sale Price--

CREATE OR REPLACE FUNCTION check_sale_price() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.sale_price <= 0 THEN
        RAISE EXCEPTION 'Sale price must be greater than zero';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER prevent_negative_price
BEFORE INSERT OR UPDATE ON work
FOR EACH ROW
EXECUTE FUNCTION check_sale_price();

--Trigger to Log Changes in Painting Sale Prices

CREATE TABLE price_changes (
    change_id SERIAL PRIMARY KEY,
    work_id INT REFERENCES work(work_id) ON DELETE CASCADE,
    old_price DECIMAL(15,2),
    new_price DECIMAL(15,2),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION log_price_changes() RETURNS TRIGGER AS $$
BEGIN
    IF OLD.sale_price IS DISTINCT FROM NEW.sale_price THEN
        INSERT INTO price_changes (work_id, old_price, new_price)
        VALUES (OLD.work_id, OLD.sale_price, NEW.sale_price);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER track_price_changes
After update on work
for each row
execute function log_price_changes()
;

-- Trigger to Prevent Duplicate Museum Hours Entries

CREATE or replace function prevent_Duplicate_hours() returns trigger as $$
begin
	if existS(
		select 1 from museum_hours
		where meseum_id =NEW.museum_id
			AND day= new.day
	) 	then
		raise exception 'Duplicate entry: Museum hours already exist for this day.';
	end if;
	return new;
end;
$$ language plpgsql;

create trigger prevent_Duplicate_hours
before insert on museum_hours
execute function prevent_Duplicate_hours();