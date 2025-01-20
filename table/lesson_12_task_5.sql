-- Этот код протестирован на PostgreSQL
CREATE TABLE IF NOT EXISTS students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);
ALTER TABLE students 
ADD COLUMN IF NOT EXISTS exam_score INTEGER;