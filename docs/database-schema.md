\# Общая схема баз данных экосистемы



\## ER-диаграмма



```mermaid

erDiagram

&#x20;   USERS ||--|| PROFILES : "1:1"

&#x20;   USERS ||--o{ RESPONSES : "логическая связь"

&#x20;   SURVEYS ||--o{ QUESTIONS : "1:N"

&#x20;   SURVEYS ||--o{ RESPONSES : "1:N"

&#x20;   QUESTIONS ||--o{ RESPONSES : "1:N"



&#x20;   USERS {

&#x20;       int id PK

&#x20;       string email UK

&#x20;       string password\_hash

&#x20;       timestamp created\_at

&#x20;   }

&#x20;   PROFILES {

&#x20;       int id PK

&#x20;       int user\_id FK

&#x20;       string display\_name

&#x20;       timestamp created\_at

&#x20;   }

&#x20;   SURVEYS {

&#x20;       int id PK

&#x20;       string title

&#x20;       text description

&#x20;       int created\_by

&#x20;       timestamp created\_at

&#x20;   }

&#x20;   QUESTIONS {

&#x20;       int id PK

&#x20;       int survey\_id FK

&#x20;       text text

&#x20;       string type

&#x20;       int order\_index

&#x20;   }

&#x20;   RESPONSES {

&#x20;       int id PK

&#x20;       int survey\_id FK

&#x20;       int question\_id FK

&#x20;       int user\_id

&#x20;       text answer

&#x20;       timestamp created\_at

&#x20;   }

```



\## Разделение БД по системам



\- \*\*BaaS Platform\*\*: `users`, `profiles`.

\- \*\*Survey Website\*\*: `surveys`, `questions`, `responses`.



\## Межсистемные связи



| Связь | Где | Куда | Тип |

|-------|-----|------|-----|

| `surveys.created\_by` → `users.id` | Survey Website | BaaS Platform | логическая (через API) |

| `responses.user\_id` → `users.id` | Survey Website | BaaS Platform | логическая (через API) |



⚠️ \*\*Физических FK между БД нет\*\* — системы развёрнуты независимо.

Целостность поддерживается на уровне приложения: Survey Website

получает `user\_id` из JWT-токена BaaS и сохраняет его в свои таблицы.

