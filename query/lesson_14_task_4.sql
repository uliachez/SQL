SELECT 
    s.id, 
    s.first_name, 
    s.last_name, 
    s.exam_score, 
    d.name AS direction_name, 
    CASE 
        WHEN s.direction_id IS NOT NULL AND s.exam_score >= d.min_score THEN 'YES'
        WHEN s.direction_id IS NOT NULL AND s.exam_score < d.min_score THEN 'NO'
        ELSE NULL
    END AS enrolled
FROM students s
LEFT JOIN directions d ON s.direction_id = d.id;
