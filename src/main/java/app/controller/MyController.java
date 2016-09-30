package app.controller;

import app.entity.CustomUser;
import app.entity.Product;
import app.service.photo.PhotoService;
import app.service.photo.PhotoServiceImpl;
import app.service.product.ProductService;
import app.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;


@Controller
public class MyController {
    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;
/*
    @Autowired
    private PhotoService photoService;*/

    @RequestMapping("/")
    public String index(Model model){
        model.addAttribute("products", productService.getProductAll());
        model.addAttribute("types",productService.getTypes());
        model.addAttribute("numberOfWireses", productService.getNumberOfWires());
        model.addAttribute("areas", productService.getAreas());
        return "index";
    }

    @RequestMapping("/index")
    public String index(@RequestParam String type_cable,
                        @RequestParam Integer numberOfWires_cable,
                        @RequestParam Double area_cable,
                        Model model) {
        model.addAttribute("products", productService.getProductByTypeAndNumberOfWiresAndAreaSort(type_cable,numberOfWires_cable,area_cable));
        model.addAttribute("types",productService.getTypes());
        model.addAttribute("numberOfWireses", productService.getNumberOfWires());
        model.addAttribute("areas", productService.getAreas());
        return "index";
    }

    @RequestMapping("/ind")
    public String ind(Model model){
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();//��������� ������� ���������� � ������� ������� ��� ������� ��������������� ������������
        String login = user.getUsername();//��������� ������ ������������

        CustomUser dbUser = userService.getUserByLogin(login);//��������� ���� ���������� �� �� �� ������������

        model.addAttribute("login", login);
        model.addAttribute("roles", user.getAuthorities());
        model.addAttribute("email", dbUser.getEmail());
        model.addAttribute("phone", dbUser.getPhone());

        return "ind";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestParam(required = false) String email, @RequestParam(required = false) String phone) {
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        CustomUser dbUser = userService.getUserByLogin(login);
        dbUser.setEmail(email);
        dbUser.setPhone(phone);

        userService.updateUser(dbUser);

        return "redirect:/ind";
    }

    @RequestMapping("/admin")
    public String admin(){
        return "admin";
    }

    @RequestMapping("/unauthorized")
    public String unauthorized(Model model){
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        model.addAttribute("login", user.getUsername());
        return "unauthorized";
    }

  /*  @RequestMapping(value = "/images/{photo_id}", method=RequestMethod.GET)
    public void getImage(HttpServletRequest request, HttpServletResponse response, @PathVariable("photo_id") long photoId){
        PhotoService photoService=new PhotoServiceImpl();
        try {
            byte [] bytes = photoService.getPhotoOne(photoId).getBody();
            response.setContentType("images/png");
            response.getOutputStream().write(bytes);
        }catch (IOException e){
            System.out.println(e);
        }
    }*/


}
