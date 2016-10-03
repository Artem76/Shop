package app.controller;

import app.entity.Product;
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

    @RequestMapping("/user")
    public String userShop(Model model){
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//получение обьекта связанного с учегной записью под которой авторизировался пользователь
        String login = user.getUsername();//получение логина пользователя
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
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//получение обьекта связанного с учегной записью под которой авторизировался пользователь
        String login = user.getUsername();//получение логина пользователя
        model.addAttribute("login", login);
        model.addAttribute("products", productService.getProductByTypeAndNumberOfWiresAndAreaSort(type_cable,numberOfWires_cable,area_cable));
        model.addAttribute("types",productService.getTypes());
        model.addAttribute("numberOfWireses", productService.getNumberOfWires());
        model.addAttribute("areas", productService.getAreas());
        return "user_shop";
    }

    @RequestMapping("/box")
    public void box(@RequestParam long product_id){
        Product product = productService.getProductOne(product_id);
        System.out.println(product.getType()+product.getNumberOfWires()+"x"+product.getArea());
    }
}
