package app.service.user;

import app.entity.CustomUser;
import app.entity.enums.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;

    @Override
    @Transactional(readOnly = true)
    public CustomUser getUserByLogin(String login) {
        return userRepository.findByLogin(login);
    }

    @Override
    @Transactional(readOnly = true)
    public CustomUser getUserByLogin(String login, UserRole role) {
        return userRepository.findByLogin(login,role);
    }

    @Override
    @Transactional(readOnly = true)
    public CustomUser getUserByPhone(String phone, UserRole role) {
        return userRepository.findByPhone(phone,role);
    }

    @Override
    @Transactional(readOnly = true)
    public CustomUser getUserByEmail(String email, UserRole role) {
        return userRepository.findByEmail(email,role);
    }

    @Override
    @Transactional
    public boolean addUser(CustomUser customUser) {
        if (userRepository.findByLogin(customUser.getLogin()) != null) return false;
        userRepository.save(customUser);
        return true;
    }

    @Override
    @Transactional
    public void updateUser(CustomUser customUser) {
        userRepository.save(customUser);
    }

    @Override
    @Transactional
    public void deleteUser(CustomUser customUser) { userRepository.delete(customUser);}
}
