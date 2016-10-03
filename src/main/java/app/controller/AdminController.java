package app.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

    @RequestMapping("/admin")
    public String adminShop(Model model){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//получение обьекта связанного с учегной записью под которой авторизировался пользователь
        String login = user.getUsername();//получение логина пользователя
        model.addAttribute("login", login);
        return "admin_shop";
    }
}
