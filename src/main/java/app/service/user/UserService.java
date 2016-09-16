package app.service.user;

import app.entity.CustomUser;
import app.entity.enums.UserRole;

public interface UserService {
    CustomUser getUserByLogin(String login);
    CustomUser getUserByLogin(String login, UserRole role);
    CustomUser getUserByPhone(String phone, UserRole role);
    CustomUser getUserByEmail(String email, UserRole role);
    void addUser(CustomUser customUser);
    void updateUser(CustomUser customUser);
    void deleteUser(CustomUser customUser);
}
