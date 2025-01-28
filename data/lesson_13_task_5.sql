INSERT INTO directions (id, name, min_score) VALUES
(1, 'История', 160),
(2, 'Право', 180),
(3, 'Физика', 200)
ON CONFLICT (id) DO NOTHING;
SELECT * FROM directions
