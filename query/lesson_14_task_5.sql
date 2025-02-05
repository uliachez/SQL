SELECT STRING_AGG(s.last_name, ', ') AS enrolled_students
FROM students s
JOIN directions d ON s.direction_id = d.id
WHERE d.name = 'История' AND s.exam_score >= d.min_score;