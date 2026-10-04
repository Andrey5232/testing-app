API Contracts
Соглашение между BaaS-платформой и сайтом-опросником.

POST /api/auth/login
Request:
{ "login": "user@example.com", "password": "..." }

Response:
{ "token": "JWT...", "expires_in": 3600 }