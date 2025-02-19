INSERT INTO directions (id, name, min_score) VALUES
(1, 'История', 160),
(2, 'Право', 180),
(3, 'Физика', 200)
ON CONFLICT (id) DO NOTHING;
UPDATE students 
SET direction_id = (SELECT id FROM directions WHERE directions.name = students.direction)
WHERE direction_id IS NULL;

UPDATE directions 
SET total_seats = CASE 
    WHEN id = 1 THEN 2 
    WHEN id = 2 THEN 2 
    WHEN id = 3 THEN 1 
    ELSE 0 
END;

--Add new person for test the trigger
INSERT INTO students (first_name, last_name, exam_score, direction_id)
VALUES ('Алексей', 'Сидоров', 210, 1);

