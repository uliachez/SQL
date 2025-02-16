CREATE OR REPLACE FUNCTION get_enrolled_students(direction_code INT)
RETURNS TABLE (direction_name VARCHAR, enrolled_students TEXT) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        d.name AS direction_name,
        COALESCE(STRING_AGG(s.last_name, ', '), NULL) AS enrolled_students
    FROM directions d
    LEFT JOIN students s ON s.direction_id = d.id AND s.exam_score >= d.min_score
    WHERE d.id = direction_code
    GROUP BY d.name;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Wrong code direction';
    END IF;
END;
$$ LANGUAGE plpgsql;