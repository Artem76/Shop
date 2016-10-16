package app.controller;

import app.entity.CustomUser;
import app.entity.enums.UserRole;
import app.service.user.UserService;
import app.utils.SHA;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {

    @Autowired
    UserService userService;

    @RequestMapping("/admin")
    public String adminShop(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        model.addAttribute("login", login);
        model.addAttribute("customUsers", userService.getUserByRoleSort(UserRole.MANAGER));
        return "admin/admin_shop";
    }

    @RequestMapping("/admin_reg_manager")
    public String adminRegManager(@RequestParam String login_manager,
                                  @RequestParam String password1,
                                  @RequestParam String password2,
                                  Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        model.addAttribute("login", login);
        if (login_manager.equals("") || password1.equals("") || password2.equals("") || !password1.equals(password2)) {
            model.addAttribute("data_error", "error");
        } else {
            String passwordSHA1 = SHA.coderSHA1(password1).toString();
            CustomUser customUser = new CustomUser(login_manager, passwordSHA1, UserRole.MANAGER);
            if (!userService.addUser(customUser)) {
                model.addAttribute("log_error", "error");
            } else {
                model.addAttribute("reg", "ok");
            }
        }
        model.addAttribute("customUsers", userService.getUserByRoleSort(UserRole.MANAGER));
        return "admin/admin_shop";
    }

    @RequestMapping("/admin_update_pas_manager")
    public String adminUpdatePasManager(@RequestParam long id_manager,
                                        @RequestParam String password1,
                                        @RequestParam String password2,
                                        Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        model.addAttribute("login", login);
        if (id_manager == 0 || password1.equals("") || password2.equals("") || !password1.equals(password2)) {
            model.addAttribute("data_error", "error");
        } else {
            String passwordSHA1 = SHA.coderSHA1(password1).toString();
            CustomUser customUser = userService.getOne(id_manager);
            customUser.setPassword(passwordSHA1);
            userService.updateUser(customUser);
            model.addAttribute("update", "ok");
        }
        model.addAttribute("customUsers", userService.getUserByRoleSort(UserRole.MANAGER));
        return "admin/admin_shop";
    }

    @RequestMapping("/admin_delete_manager")
    public String adminDeleteManager(@RequestParam long id_manager,
                                        Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        model.addAttribute("login", login);
        CustomUser customUser = userService.getOne(id_manager);
        try {
            userService.deleteUser(customUser);
        } catch (DataIntegrityViolationException e) {
            System.out.println(e);
            model.addAttribute("del_error", "error");
        }
        model.addAttribute("customUsers", userService.getUserByRoleSort(UserRole.MANAGER));
        return "admin/admin_shop";
    }

    @RequestMapping("/admin_contact")
    public String adminContact(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        model.addAttribute("login", login);
        return "admin/admin_contact";
    }
}
