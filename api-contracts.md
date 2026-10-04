# API Contracts

Соглашение между BaaS-платформой и сайтом-опросником.

## POST /api/auth/login

Request:
{ "email": "user@example.com", "password": "..." }

Response:
{ "access_token": "JWT...", "user_id": 42 }