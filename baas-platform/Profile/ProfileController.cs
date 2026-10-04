// ProfileController — модуль профилей BaaS
// GET /api/profile/{id}

namespace BaasPlatform.Profile;

public class ProfileController
{
    public string GetProfile(string id)
    {
        return "{ \"id\": \"" + id + "\", \"display_name\": \"placeholder\" }";
    }
}