INSERT INTO directions (id, name, min_score) VALUES
(1, 'История', 160),
(2, 'Право', 180),
(3, 'Физика', 200)
ON CONFLICT (id) DO NOTHING;
UPDATE students 
SET direction_id = (SELECT id FROM directions WHERE directions.name = students.direction)
WHERE direction_id IS NULL;
