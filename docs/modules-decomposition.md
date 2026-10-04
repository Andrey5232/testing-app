\# Декомпозиция систем на модули



\## Survey Website (Андрей)



\### 1. UI-модуль (`ui/`)

Отвечает за отображение страниц и форм.

\- `login.html` — вход.

\- `survey.html` — прохождение опроса.

\- `stats.html` — статистика.

\- \*\*Входы:\*\* данные от пользователя.

\- \*\*Выходы:\*\* HTML-страницы, события для API-клиента.



\### 2. API-клиент (`api-client/`)

Адаптер к BaaS Platform.

\- `BaasApiClient.js` — методы `login`, `register`, `getProfile`.

\- `errors.js` — обработка ошибок API.

\- \*\*Входы:\*\* вызовы от UI-модуля.

\- \*\*Выходы:\*\* HTTP-запросы к BaaS.



\### 3. Модуль опросов (`survey/`) — план на Лабу №4

\- `SurveyService.js` — загрузка списка опросов.

\- `ResponseService.js` — отправка ответов.



\### 4. Модуль статистики (`stats/`) — план на Лабу №4

\- `StatsService.js` — агрегация результатов.



\## BaaS Platform (Николай)



\### 1. Модуль аутентификации (`Auth/`)

\- `AuthController.cs` — REST-эндпоинты `register` и `login`.

\- `JwtService.cs` — генерация и валидация JWT.



\### 2. Модуль профилей (`Profile/`)

\- `ProfileController.cs` — эндпоинт `GET /api/profile/{id}`.

\- `ProfileService.cs` — логика работы с профилем.



\### 3. Модуль доступа к БД (`Data/`) — план на Лабу №4

\- `UserRepository.cs`, `ProfileRepository.cs`.



\### 4. Слой Базы Данных

\- Таблицы `users`, `profiles` (см. Лабу №3).

