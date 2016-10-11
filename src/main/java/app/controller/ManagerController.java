package app.controller;

import app.entity.Box;
import app.entity.CustomUser;
import app.entity.Ord;
import app.entity.enums.UserRole;
import app.service.box.BoxService;
import app.service.ord.OrdService;
import app.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ManagerController {
    @Autowired
    private UserService userService;

    @Autowired
    private BoxService boxService;

    @Autowired
    private OrdService ordService;

    @RequestMapping("/manager")
    public String managerShop(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        model.addAttribute("login", login);
        model.addAttribute("boxes", boxService.getBoxesByManagerStatusSort(null, 1));
        return "manager/manager_shop";
    }

    @RequestMapping("/manager_take_box")
    public String boxDeleteOrd(@RequestParam long box_id) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        CustomUser customUser = userService.getUserByLogin(login);
        boxService.takeBox(box_id, customUser);
        return "redirect:/manager";
    }

    @RequestMapping("/manager_their_orders_work")
    public String managerTheirOrdersWork(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        CustomUser customUser = userService.getUserByLogin(login);
        model.addAttribute("login", login);
        model.addAttribute("boxes", boxService.getBoxesByManagerStatusSort(customUser, 1));
        return "manager/manager_their_orders_work";
    }

    @RequestMapping("/manager_all_orders_work")
    public String managerAllOrdersWork(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        model.addAttribute("login", login);
        model.addAttribute("boxes", boxService.getBoxesAllWorkStatusSort(1));
        return "manager/manager_all_orders_work";
    }

    @RequestMapping("/manager_their_orders_closed")
    public String managerTheirOrdersClosed(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        CustomUser customUser = userService.getUserByLogin(login);
        model.addAttribute("login", login);
        model.addAttribute("boxes", boxService.getBoxesByManagerStatusSort(customUser, 2));
        return "manager/manager_their_orders_closed";
    }

    @RequestMapping("/manager_all_orders_closed")
    public String managerAllOrdersClosed(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        model.addAttribute("login", login);
        model.addAttribute("boxes", boxService.getBoxesAllStatusSort(2));
        return "manager/manager_all_orders_closed";
    }

    @RequestMapping("/manager_out_box")
    public String managerOutBox(@RequestParam long box_id) {
        boxService.outBox(box_id);
        return "redirect:/manager_their_orders_work";
    }

    @RequestMapping("/manager_work_box")
    public String managerWorkBox(@RequestParam long box_id, Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        CustomUser customUser = userService.getUserByLogin(login);
        Box box = boxService.getOne(box_id);
        List<Ord> ords = ordService.getOrdByBoxSort(box);
        if (box.getStatus() < 2) {
            if (box.getCustomUsers().size() == 2 && box.getCustomUserManager().equals(customUser)) {
                model.addAttribute("edit", "ok");
                model.addAttribute("box_id", box_id);
            }
            for (Ord ord :
                    ords) {
                if (ord.getNumberProduct() > ord.getProduct().getNumber()) {
                    model.addAttribute("complete", "ok");
                    break;
                }
            }
        }else{
            model.addAttribute("closed", "closed");
        }
        model.addAttribute("login", login);
        model.addAttribute("login_client", box.getCustomUserClient().getLogin());
        model.addAttribute("id_client", box.getCustomUserClient().getId());
        if (box.getCustomUsers().size() == 2) model.addAttribute("login_manager", box.getCustomUserManager().getLogin());
        model.addAttribute("date", box.getDate());
        model.addAttribute("description", box.getDescription());
        model.addAttribute("phone", box.getCustomUserClient().getPhone());
        model.addAttribute("email", box.getCustomUserClient().getEmail());
        model.addAttribute("address", box.getCustomUserClient().getAddress());
        model.addAttribute("ords", ords);
        model.addAttribute("sum", boxService.getSumBox(box));
        return "manager/manager_work_box";
    }

    @RequestMapping("/manager_box_delete_ord")
    public String managerBoxDeleteOrd(@RequestParam long ord_id) {
        Ord ord = ordService.getOrdOne(ord_id);
        ordService.deleteOrd(ord);
        return "redirect:/manager_work_box?box_id=" + ord.getBox().getId();
    }

    @RequestMapping("/manager_box_update_ord")
    public String boxUpdateOrd(@RequestParam long ord_id, @RequestParam Integer numberProduct) {
        Ord ord = ordService.getOrdOne(ord_id);
        ord.setNumberProduct(numberProduct);
        ordService.updateOrd(ord);
        return "redirect:/manager_work_box?box_id=" + ord.getBox().getId();
    }

    @RequestMapping("/manager_box_complete")
    public String  boxComplete(@RequestParam long box_id){
        Box box = boxService.getOne(box_id);
        boxService.completeBox(box);
        return "redirect:/manager";
    }

    @RequestMapping("/manager_search_client")
    public String searchClient(Model model){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        model.addAttribute("login", login);
        model.addAttribute("users", userService.getUserByPatternSort("%%", UserRole.USER));
        return "manager/manager_search_client";
    }

    @RequestMapping("/manager_search_client_pattern")
    public String searchClientPattern(@RequestParam String pattern, Model model){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        model.addAttribute("login", login);
        model.addAttribute("users", userService.getUserByPatternSort("%"+pattern+"%", UserRole.USER));
        return "manager/manager_search_client";
    }

    @RequestMapping("/manager_client")
    public String managerClient(@RequestParam long id_client, Model model){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        CustomUser userClient = userService.getOne(id_client);
        model.addAttribute("login", login);
        model.addAttribute("login_client", userClient.getLogin());
        model.addAttribute("boxes", boxService.getBoxesByClientStatus12Sort(userClient));
        return "manager/manager_client";
    }
}
