package app.controller;

import app.entity.Box;
import app.entity.CustomUser;
import app.entity.Ord;
import app.service.box.BoxService;
import app.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ManagerController {
    @Autowired
    UserService userService;

    @Autowired
    BoxService boxService;

    @RequestMapping("/manager")
    public String managerShop(Model model){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//получение обьекта связанного с учегной записью под которой авторизировался пользователь
        String login = user.getUsername();//получение логина пользователя
        model.addAttribute("login", login);
        model.addAttribute("boxes", boxService.getBoxesByManagerStatusSort(null,1));
        //передать новые заказы

        return "manager/manager_shop";
    }

    @RequestMapping("/manager_take_box")
    public String boxDeleteOrd(@RequestParam long box_id, Model model){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//получение обьекта связанного с учегной записью под которой авторизировался пользователь
        String login = user.getUsername();
        CustomUser customUser = userService.getUserByLogin(login);
        boxService.takeBox(box_id, customUser);
        return "redirect:/manager";
    }

    @RequestMapping("/manager_their_orders_work")
    public String managerTheirOrdersWork(Model model){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//получение обьекта связанного с учегной записью под которой авторизировался пользователь
        String login = user.getUsername();//получение логина пользователя
        CustomUser customUser = userService.getUserByLogin(login);
        model.addAttribute("login", login);
        model.addAttribute("boxes", boxService.getBoxesByManagerStatusSort(customUser,1));
        return "manager/manager_their_orders_work";
    }

    @RequestMapping("/manager_all_orders_work")
    public String managerAllOrdersWork(Model model){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//получение обьекта связанного с учегной записью под которой авторизировался пользователь
        String login = user.getUsername();//получение логина пользователя
        CustomUser customUser = userService.getUserByLogin(login);
        model.addAttribute("login", login);
        model.addAttribute("boxes", boxService.getBoxesAllWorkStatusSort(1));
        return "manager/manager_all_orders_work";
    }
//    /manager_work_box
}
