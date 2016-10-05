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

@Controller
public class UserController {
    @Autowired
    UserService userService;

    @Autowired
    ProductService productService;

    @Autowired
    BoxService boxService;

    @Autowired
    OrdService ordService;

    @RequestMapping("/user")
    public String userShop(Model model){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//��������� ������� ���������� � ������� ������� ��� ������� ��������������� ������������
        String login = user.getUsername();//��������� ������ ������������
        model.addAttribute("login", login);
        model.addAttribute("products", productService.getProductAll());
        model.addAttribute("types",productService.getTypes());
        model.addAttribute("numberOfWireses", productService.getNumberOfWires());
        model.addAttribute("areas", productService.getAreas());
        return "user_shop";
    }

    @RequestMapping("/user_filter")
    public String userShop(@RequestParam String type_cable,
                           @RequestParam Integer numberOfWires_cable,
                           @RequestParam Double area_cable,
                           Model model){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//��������� ������� ���������� � ������� ������� ��� ������� ��������������� ������������
        String login = user.getUsername();//��������� ������ ������������
        model.addAttribute("login", login);
        model.addAttribute("products", productService.getProductByTypeAndNumberOfWiresAndAreaSort(type_cable,numberOfWires_cable,area_cable));
        model.addAttribute("types",productService.getTypes());
        model.addAttribute("numberOfWireses", productService.getNumberOfWires());
        model.addAttribute("areas", productService.getAreas());
        return "user_shop";
    }

    @RequestMapping("/box_add_product")
    public void box(@RequestParam long product_id){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//��������� ������� ���������� � ������� ������� ��� ������� ��������������� ������������
        String login = user.getUsername();
        CustomUser customUser = userService.getUserByLogin(login);
        Product product = productService.getProductOne(product_id);
        boxService.addProductInBox(customUser,product,1);
    }

    @RequestMapping("/user_cart")
    public String userCart(Model model){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//��������� ������� ���������� � ������� ������� ��� ������� ��������������� ������������
        String login = user.getUsername();//��������� ������ ������������
        CustomUser customUser = userService.getUserByLogin(login);
        Box box = boxService.addBox(customUser);
        model.addAttribute("login", login);
        model.addAttribute("ords",ordService.getOrdByBoxSort(box));
        return "user_cart";
    }
}
