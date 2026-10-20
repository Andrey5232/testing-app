-- DDL для базы данных Survey Website
-- СУБД: PostgreSQL 14+

CREATE TABLE surveys (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    created_by INTEGER NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE questions (
    id SERIAL PRIMARY KEY,
    survey_id INTEGER NOT NULL REFERENCES surveys(id) ON DELETE CASCADE,
    text TEXT NOT NULL,
    type VARCHAR(20) NOT NULL CHECK (type IN ('single', 'multiple', 'text')),
    order_index INTEGER NOT NULL
);

CREATE TABLE responses (
    id SERIAL PRIMARY KEY,
    survey_id INTEGER NOT NULL REFERENCES surveys(id) ON DELETE CASCADE,
    question_id INTEGER NOT NULL REFERENCES questions(id) ON DELETE CASCADE,
    user_id INTEGER NOT NULL,
    answer TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Индексы для ускорения запросов
CREATE INDEX idx_questions_survey_id ON questions(survey_id);
CREATE INDEX idx_responses_survey_id ON responses(survey_id);
CREATE INDEX idx_responses_user_id ON responses(user_id);
CREATE INDEX idx_responses_question_id ON responses(question_id);

-- Комментарии к таблицам
COMMENT ON TABLE surveys IS 'Опросы, создаваемые пользователями';
COMMENT ON TABLE questions IS 'Вопросы внутри опросов';
COMMENT ON TABLE responses IS 'Ответы пользователей на вопросы';

-- Примечание: user_id в responses ссылается на users.id в БД BaaS Platform
-- (логическая связь между системами, не физический FK)