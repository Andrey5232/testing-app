\# Cloud Ecosystem



Экосистема из двух независимых веб-сервисов:

\- \*\*baas-platform\*\* — облачная платформа (BaaS): API для аутентификации и профилей.

\- \*\*survey-website\*\* — сайт-опросник, клиент BaaS.



\## Команда

\- Андрей Иванов (Andrey5232) — survey-website

\- Николай Вареников — baas-platform



\## Ветки

\- `main` — стабильная версия

\- `feature/survey-ui`, `feature/survey-api-client` — модули сайта (Андрей)

\- `feature/baas-auth`, `feature/baas-profile` — модули BaaS (Николай)



\## Взаимодействие

Сайт-опросник → API-запрос → BaaS-платформа → БД



\## Контракт API

См. `api-contracts.md`



\## Merge-стратегия

Все feature-ветки вливаются в main через `--no-ff`

## Документация

- [Паспорт Survey Website](docs/survey-passport.md)
- [Паспорт BaaS Platform](docs/baas-passport.md)
- [Общая архитектура](docs/architecture.md)
- [Декомпозиция на модули](docs/modules-decomposition.md)
- [Контракт API](api-contracts.md)

