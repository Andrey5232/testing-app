\# ER-модель базы данных Survey Website



\## Сущности



\### 1. surveys (опросы)



| Поле | Тип | Ограничения | Описание |

|------|-----|-------------|----------|

| id | SERIAL | PK | Уникальный идентификатор |

| title | VARCHAR(200) | NOT NULL | Название опроса |

| description | TEXT | | Описание |

| created\_by | INTEGER | NOT NULL | ID автора (user\_id из BaaS) |

| created\_at | TIMESTAMP | DEFAULT NOW() | Дата создания |



\### 2. questions (вопросы)



| Поле | Тип | Ограничения | Описание |

|------|-----|-------------|----------|

| id | SERIAL | PK | Уникальный идентификатор |

| survey\_id | INTEGER | FK → surveys.id, NOT NULL | К какому опросу относится |

| text | TEXT | NOT NULL | Текст вопроса |

| type | VARCHAR(20) | NOT NULL, CHECK IN ('single','multiple','text') | Тип вопроса |

| order\_index | INTEGER | NOT NULL | Порядок отображения |



\### 3. responses (ответы)



| Поле | Тип | Ограничения | Описание |

|------|-----|-------------|----------|

| id | SERIAL | PK | Уникальный идентификатор |

| survey\_id | INTEGER | FK → surveys.id, NOT NULL | Какой опрос |

| question\_id | INTEGER | FK → questions.id, NOT NULL | Какой вопрос |

| user\_id | INTEGER | NOT NULL | ID пользователя (из BaaS) |

| answer | TEXT | NOT NULL | Ответ |

| created\_at | TIMESTAMP | DEFAULT NOW() | Когда ответили |



\## Связи между сущностями



\- `surveys 1 ──── N questions` — у опроса много вопросов

\- `surveys 1 ──── N responses` — у опроса много ответов

\- `questions 1 ──── N responses` — у вопроса много ответов

\- `responses.user\_id` → \*\*логическая связь\*\* с `users.id` в БД BaaS Platform (не физический FK, т.к. другая система)



\## Обоснование решений



\- `surveys.created\_by` и `responses.user\_id` — целые числа, потому что

&#x20; пользователи хранятся в другой системе (BaaS). Значение приходит из JWT-токена.

\- `ON DELETE CASCADE` у вопросов и ответов — при удалении опроса

&#x20; автоматически удаляются связанные данные.

\- Тип вопроса ограничен `CHECK` — только `single`, `multiple`, `text`.

