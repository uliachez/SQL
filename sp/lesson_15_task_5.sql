CREATE OR REPLACE FUNCTION update_direction_closure()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE directions d
    SET is_closed = (SELECT COUNT(*) FROM students s 
                    WHERE s.direction_id = d.id 
                    AND s.exam_score >= d.min_score) >= d.total_seats
    WHERE d.id = NEW.direction_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_trigger WHERE tgname = 'trigger_update_direction_closure'
    ) THEN
        CREATE TRIGGER trigger_update_direction_closure
        AFTER INSERT ON students
        FOR EACH ROW
        EXECUTE FUNCTION update_direction_closure();
    END IF;
END $$;
SELECT id, name, total_seats, is_closed FROM directions;

