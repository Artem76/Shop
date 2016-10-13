package app.controller;

import app.entity.Box;
import app.entity.CustomUser;
import app.entity.Ord;
import app.entity.Product;
import app.service.box.BoxService;
import app.service.ord.OrdService;
import app.service.product.ProductService;
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
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @Autowired
    private BoxService boxService;

    @Autowired
    private OrdService ordService;

    @RequestMapping("/user")
    public String userShop(Model model){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        model.addAttribute("login", login);
        model.addAttribute("products", productService.getProductAll());
        model.addAttribute("types",productService.getTypes());
        model.addAttribute("numberOfWireses", productService.getNumberOfWires());
        model.addAttribute("areas", productService.getAreas());
        return "user/user_shop";
    }

    @RequestMapping("/user_filter")
    public String userShop(@RequestParam String type_cable,
                           @RequestParam Integer numberOfWires_cable,
                           @RequestParam Double area_cable,
                           Model model){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        model.addAttribute("login", login);
        model.addAttribute("products", productService.getProductByTypeAndNumberOfWiresAndAreaSort(type_cable,numberOfWires_cable,area_cable));
        model.addAttribute("types",productService.getTypes());
        model.addAttribute("numberOfWireses", productService.getNumberOfWires());
        model.addAttribute("areas", productService.getAreas());
        return "user/user_shop";
    }

    @RequestMapping("/user_box_add_product")
    public void boxAddProduct(@RequestParam long product_id){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//получение обьекта связанного с учегной записью под которой авторизировался пользователь
        String login = user.getUsername();
        CustomUser customUser = userService.getUserByLogin(login);
        Product product = productService.getProductOne(product_id);
        boxService.addProductInBox(customUser,product,1);
    }

    @RequestMapping("/user_box_delete_ord")
    public String boxDeleteOrd(@RequestParam long ord_id){
        Ord ord = ordService.getOrdOne(ord_id);
        ordService.deleteOrd(ord);
        return "redirect:/user_cart";
    }

    @RequestMapping("/user_box_update_ord")
    public String boxUpdateOrd(@RequestParam long ord_id,
                               @RequestParam String numberProduct,
                               Model model){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        CustomUser customUser = userService.getUserByLogin(login);
        Box box = boxService.addBox(customUser);
        int numberProductInt = 0;
        try {
            numberProductInt = Integer.parseInt(numberProduct);
            Ord ord = ordService.getOrdOne(ord_id);
            ord.setNumberProduct(numberProductInt);
            ordService.updateOrd(ord);
        } catch (NumberFormatException e) {
            System.out.println(e);
            model.addAttribute("data_error", "error");
        }
        model.addAttribute("login", login);
        model.addAttribute("ords", ordService.getOrdByBoxSort(box));
        if (ordService.getOrdByBoxSort(box).size()!=0){
            model.addAttribute("edit", "ok");
            model.addAttribute("sum", boxService.getSum(customUser));
        }
        return "user/user_cart";
    }

    @RequestMapping("/user_box_order")
    public String boxOrd(@RequestParam("description") String description){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        CustomUser customUser = userService.getUserByLogin(login);
        boxService.orderBox(customUser,description);
        return "redirect:/user_cart";
    }

    @RequestMapping("/user_cart")
    public String userCart(Model model){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        CustomUser customUser = userService.getUserByLogin(login);
        Box box = boxService.addBox(customUser);
        model.addAttribute("login", login);
        model.addAttribute("ords", ordService.getOrdByBoxSort(box));
        if (ordService.getOrdByBoxSort(box).size()!=0){
            model.addAttribute("edit", "ok");
            model.addAttribute("sum", boxService.getSum(customUser));
        }
        return "user/user_cart";
    }

    @RequestMapping("/user_orders_work")
    public String userOrdersWork(Model model){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        CustomUser customUser = userService.getUserByLogin(login);
        model.addAttribute("login", login);
        model.addAttribute("boxes", boxService.getBoxesByClientStatusSort(customUser, 1));
        return "user/user_orders_work";
    }

    @RequestMapping("/user_orders_closed")
    public String userOrdersClosed(Model model){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        CustomUser customUser = userService.getUserByLogin(login);
        model.addAttribute("login", login);
        model.addAttribute("boxes", boxService.getBoxesByClientStatusSort(customUser, 2));
        return "user/user_orders_closed";
    }

    @RequestMapping("/user_work_box")
    public String userWorkBox(@RequestParam long box_id, Model model){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        CustomUser customUser = userService.getUserByLogin(login);
        Box box = boxService.getOne(box_id);
        if (!box.getCustomUserClient().equals(customUser))return "redirect:/user";
        List<Ord> ords = ordService.getOrdByBoxSort(box);
        if (box.getStatus() == 2) model.addAttribute("closed", "closed");
        model.addAttribute("login", login);
        if (box.getCustomUsers().size() == 2) model.addAttribute("login_manager", box.getCustomUserManager().getLogin());
        model.addAttribute("date", box.getDate());
        model.addAttribute("description", box.getDescription());
        model.addAttribute("ords", ords);
        model.addAttribute("sum", boxService.getSumBox(box));
        return "user/user_work_box";
    }
}
