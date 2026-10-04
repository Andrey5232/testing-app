// ProfileService — логика работы с профилями
namespace BaasPlatform.Profile;

public class ProfileService
{
    public string GetDisplayName(string userId)
    {
        return $"User_{userId}";
    }
}