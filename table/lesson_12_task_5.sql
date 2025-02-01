-- Этот код протестирован на PostgreSQL
CREATE TABLE IF NOT EXISTS students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);
ALTER TABLE students 
ADD COLUMN IF NOT EXISTS exam_score INTEGER;
ALTER TABLE students 
ADD COLUMN IF NOT EXISTS direction VARCHAR(100);

ALTER TABLE students 
ADD COLUMN IF NOT EXISTS direction_id INTEGER REFERENCES directions(id);

SELECT s.id, s.first_name, s.last_name, s.exam_score, d.name AS direction_name
FROM students s
JOIN directions d ON s.direction_id = d.id;