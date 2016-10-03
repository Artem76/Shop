package app.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagerController {
    @RequestMapping("/manager")
    public String mangerShop(Model model){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//��������� ������� ���������� � ������� ������� ��� ������� ��������������� ������������
        String login = user.getUsername();//��������� ������ ������������
        model.addAttribute("login", login);
        return "manager_shop";
    }
}
