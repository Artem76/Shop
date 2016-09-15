package app.service.user;

import app.entity.CustomUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {//обьяснение спрингу где брать информацию
    @Autowired
    private UserService userService;

    @Override
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {//достать из базы данные и передать спрингу в понятной форме
        CustomUser customUser = userService.getUserByLogin(login);//информация из базы
        if (customUser == null)
            throw new UsernameNotFoundException(login + " not found");

        Set<GrantedAuthority> roles = new HashSet<>();//создание ролей для юзеров
        roles.add(new SimpleGrantedAuthority(customUser.getRole().toString()));

        return new User(customUser.getLogin(), customUser.getPassword(), roles);//спринговое представление о юзере
    }
}