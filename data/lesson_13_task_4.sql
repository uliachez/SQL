INSERT INTO students (id, first_name, last_name, exam_score, direction) VALUES
(1, 'Иван', 'Бунша', 220, 'История'),
(2, 'Остап', 'Бендер', 170, 'Право'),
(3, 'Александр', 'Тимофеев', 300, 'Физика')
ON CONFLICT (id) DO NOTHING;
