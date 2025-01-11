-- Создание таблицы "Студенты", если она не существует
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'студенты') THEN
        CREATE TABLE студенты (
            идентификатор SERIAL PRIMARY KEY,
            имя VARCHAR(100) NOT NULL,
            фамилия VARCHAR(100) NOT NULL
        );
    END IF;
END $$;