API Contracts
Соглашение между BaaS-платформой и сайтом-опросником.

POST /api/auth/login
Request:
{ "email": "user@example.com", "password": "..." }

Response:
{ "access_token": "JWT...", "expires_in": 3600, "user_id": 42 }