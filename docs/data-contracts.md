\# Форматы обмена данными между Survey Website и BaaS Platform



\*\*Протокол:\*\* HTTPS, JSON (REST API).

\*\*Аутентификация:\*\* JWT в заголовке `Authorization: Bearer <token>`.



\## 1. Регистрация



`POST /api/auth/register`



\*\*Request:\*\*

```json

{

&#x20; "email": "user@example.com",

&#x20; "password": "secret123"

}

```



\*\*Response 201 Created:\*\*

```json

{

&#x20; "user\_id": 42,

&#x20; "email": "user@example.com",

&#x20; "created\_at": "2026-10-20T10:00:00Z"

}

```



\*\*Ошибки:\*\*

\- `400 Bad Request` — невалидный email или короткий пароль.

\- `409 Conflict` — пользователь с таким email уже существует.



\## 2. Вход



`POST /api/auth/login`



\*\*Request:\*\*

```json

{

&#x20; "email": "user@example.com",

&#x20; "password": "secret123"

}

```



\*\*Response 200 OK:\*\*

```json

{

&#x20; "access\_token": "eyJhbGciOi...",

&#x20; "expires\_in": 3600,

&#x20; "user\_id": 42

}

```



\*\*Ошибки:\*\*

\- `401 Unauthorized` — неверный email или пароль.



\## 3. Получение профиля



`GET /api/profile/{id}`



\*\*Headers:\*\*

```

Authorization: Bearer <access\_token>

```



\*\*Response 200 OK:\*\*

```json

{

&#x20; "id": 42,

&#x20; "display\_name": "Андрей Иванов",

&#x20; "created\_at": "2026-10-20T10:00:00Z"

}

```



\*\*Ошибки:\*\*

\- `401 Unauthorized` — нет или невалидный токен.

\- `404 Not Found` — профиль не найден.



\## 4. Редактирование профиля



`PUT /api/profile/{id}`



\*\*Request:\*\*

```json

{

&#x20; "display\_name": "Новое имя"

}

```



\*\*Response 200 OK:\*\*

```json

{

&#x20; "id": 42,

&#x20; "display\_name": "Новое имя",

&#x20; "updated\_at": "2026-10-20T11:00:00Z"

}

```



\## Схема логической связи между БД



```

BaaS Platform              Survey Website

┌─────────────┐            ┌──────────────┐

│ users       │            │ surveys      │

│  id (PK)    │◄─логич.───│  created\_by  │

│  email      │   связь    │  ...         │

└─────────────┘            └──────────────┘

&#x20;      ▲                   ┌──────────────┐

&#x20;      │                   │ responses    │

&#x20;      └───логич. связь────│  user\_id     │

&#x20;                          │  survey\_id   │

&#x20;                          │  question\_id │

&#x20;                          └──────────────┘

```



Поле `responses.user\_id` хранит значение `users.id` из BaaS Platform.

Физического FK нет — системы независимы, связь поддерживается через API.

