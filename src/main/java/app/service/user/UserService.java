package app.service.user;

import app.entity.CustomUser;
import app.entity.enums.UserRole;

import java.util.List;

public interface UserService {
    CustomUser getUserByLogin(String login);
    CustomUser getOne(long id);
    List<CustomUser> getUserByRoleSort(UserRole role);
    List<CustomUser> getUserByPatternSort(String pattern, UserRole role);
    CustomUser getUserByLogin(String login, UserRole role);
    CustomUser getUserByPhone(String phone, UserRole role);
    CustomUser getUserByEmail(String email, UserRole role);
    boolean addUser(CustomUser customUser);
    void updateUser(CustomUser customUser);
    void deleteUser(CustomUser customUser);
}
