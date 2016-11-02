package app.controller;

import app.entity.CustomUser;
import app.entity.enums.UserRole;
import app.service.photo.PhotoService;
import app.service.product.ProductService;
import app.service.user.UserService;
import app.utils.SHA;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;


@Controller
public class MainController {
    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @Autowired
    private PhotoService photoService;

    @RequestMapping("/")
    public String index(Model model) {
        model.addAttribute("products", productService.getProductAll());
        model.addAttribute("types", productService.getTypes());
        model.addAttribute("numberOfWireses", productService.getNumberOfWires());
        model.addAttribute("areas", productService.getAreas());
        return "index";
    }

    @RequestMapping("/index")
    public String index(@RequestParam String type_cable,
                        @RequestParam Integer numberOfWires_cable,
                        @RequestParam Double area_cable,
                        Model model) {
        model.addAttribute("products", productService.getProductByTypeAndNumberOfWiresAndAreaSort(type_cable, numberOfWires_cable, area_cable));
        model.addAttribute("types", productService.getTypes());
        model.addAttribute("numberOfWireses", productService.getNumberOfWires());
        model.addAttribute("areas", productService.getAreas());
        return "index";
    }

    @RequestMapping("/shop")
    public String shop(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        String role = userService.getUserByLogin(login).getRole().toString();
        switch (role) {
            case "ROLE_ADMIN":
                return "redirect:/admin";
            case "ROLE_MANAGER":
                return "redirect:/manager";
            case "ROLE_USER":
                return "redirect:/user";
            case "ROLE_NOT_ACTIVATED_USER":
                return "redirect:/not_activated";
        }
        return "redirect:/";
    }

    @RequestMapping(value = "/reg", method = RequestMethod.POST)
    public String update(@RequestParam(required = false) String login,
                         @RequestParam(required = false) String password1,
                         @RequestParam(required = false) String password2,
                         @RequestParam(required = false) String email,
                         @RequestParam(required = false) String phone,
                         @RequestParam(required = false) String address,
                         Model model) {

        if (login.equals("") || password1.equals("") || password2.equals("") || !password1.equals(password2) || email.equals("") || phone.equals("") || address.equals("")) {
            model.addAttribute("error", "error");
            return "redirect:/login";
        }
        String passwordSHA1 = SHA.coderSHA1(password1).toString();
        CustomUser customUser = new CustomUser(login, passwordSHA1, UserRole.USER, email, phone, address);

        if (!userService.addUser(customUser)) {
            model.addAttribute("log", "error");
            return "redirect:/login";
        }
        model.addAttribute("reg", "ok");

        return "redirect:/login";
    }

    @RequestMapping(value = "/photo/{photo_id}")
    public void getImage(HttpServletRequest request, HttpServletResponse response, @PathVariable("photo_id") long photoId) {
        try {
            Blob blob = photoService.getPhotoOne(photoId).getBody();
            response.setContentType("images/png");
            response.getOutputStream().write(blob.getBytes(1, (int) blob.length()));
        } catch (IOException e) {
            System.out.println(e);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @RequestMapping(value = "/photo_name/{photo_name}")
    public void getImage(HttpServletRequest request, HttpServletResponse response, @PathVariable("photo_name") String photoName) {
        try {
            Blob blob = photoService.getPhotoByName(photoName).getBody();
            response.setContentType("images/png");
            response.getOutputStream().write(blob.getBytes(1, (int) blob.length()));
        } catch (IOException e) {
            System.out.println(e);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @RequestMapping("/contact")
    public String contact() {
        return "contact";
    }
}
