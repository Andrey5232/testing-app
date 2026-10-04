// JwtService — генерация JWT-токенов
namespace BaasPlatform.Auth;

public class JwtService
{
    public string GenerateToken(string userId)
    {
        // TODO: реальная реализация в Лабе 4
        return $"jwt_for_{userId}_placeholder";
    }
}