// AuthController — модуль аутентификации BaaS
// POST /api/auth/register
// POST /api/auth/login

namespace BaasPlatform.Auth;

public class AuthController
{
    public string Register(string email, string password)
    {
        return "user_id_placeholder";
    }

    public string Login(string email, string password)
    {
        return "jwt_token_placeholder";
    }
}