package app.controller;

import app.entity.CustomUser;
import app.entity.enums.UserRole;
import app.service.photo.PhotoService;
import app.service.product.ProductService;
import app.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


@Controller
public class MainController {
    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @Autowired
    private PhotoService photoService;

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

    @RequestMapping("/shop")
    public String shop(Model model){
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        String role = userService.getUserByLogin(login).getRole().toString();
        switch (role){
            case "ROLE_ADMIN":
                return "redirect:/admin";
            case "ROLE_MANAGER":
                return "redirect:/manager";
            case "ROLE_USER":
                return "redirect:/user";
        }
        return "redirect:/";
    }

   /* @RequestMapping("/ind")
    public String ind(Model model){
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();//��������� ������� ���������� � ������� ������� ��� ������� ��������������� ������������
        String login = user.getUsername();//��������� ������ ������������

        CustomUser dbUser = userService.getUserByLogin(login);//��������� ���� ���������� �� �� �� ������������

        model.addAttribute("login", login);
        model.addAttribute("roles", user.getAuthorities());
        model.addAttribute("email", dbUser.getEmail());
        model.addAttribute("phone", dbUser.getPhone());

        return "ind";
    }*/

    @RequestMapping(value = "/reg", method = RequestMethod.POST)
    public String update(@RequestParam(required = false) String login,
                         @RequestParam(required = false) String password1,
                         @RequestParam(required = false) String password2,
                         @RequestParam(required = false) String email,
                         @RequestParam(required = false) String phone,
                         @RequestParam(required = false) String address,
                         Model model){

        if (login.equals("") || password1.equals("") || password2.equals("") || !password1.equals(password2) || email.equals("") || phone.equals("") ||address.equals("") ){
            model.addAttribute("error", "error");
            return "redirect:/login";
        }
        MessageDigest mDigest = null;
        try {
            mDigest = MessageDigest.getInstance("SHA1");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        byte[] result = mDigest.digest(password1.getBytes());
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < result.length; i++) {
            sb.append(Integer.toString((result[i] & 0xff) + 0x100, 16).substring(1));
        }
        String passwordSHA1 = sb.toString();
        CustomUser customUser = new CustomUser(login, passwordSHA1, UserRole.USER, email, phone ,address);

        if(!userService.addUser(customUser)){
            model.addAttribute("log","error");
            return "redirect:/login";
        }
        model.addAttribute("reg", "ok");

        return "redirect:/login";
    }

    /*@RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestParam(required = false) String email, @RequestParam(required = false) String phone) {
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        CustomUser dbUser = userService.getUserByLogin(login);
        dbUser.setEmail(email);
        dbUser.setPhone(phone);

        userService.updateUser(dbUser);

        return "redirect:/ind";
    }*/

   /* @RequestMapping("/admin")
    public String admin(){
        return "admin";
    }
*/
    /*@RequestMapping("/unauthorized")
    public String unauthorized(Model model){
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        model.addAttribute("login", user.getUsername());
        return "unauthorized";
    }*/

    @RequestMapping(value = "/photo/{photo_id}")
    public void getImage(HttpServletRequest request, HttpServletResponse response, @PathVariable("photo_id") long photoId){
        try {
            byte [] bytes = photoService.getPhotoOne(photoId).getBody();
            response.setContentType("images/png");
            response.getOutputStream().write(bytes);
        }catch (IOException e){
            System.out.println(e);
        }
    }


}
