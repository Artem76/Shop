package app.controller;

import app.entity.Box;
import app.entity.CustomUser;
import app.entity.Ord;
import app.entity.Product;
import app.entity.enums.UserRole;
import app.service.box.BoxService;
import app.service.ord.OrdService;
import app.service.photo.PhotoService;
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
public class ManagerController {
    @Autowired
    private UserService userService;

    @Autowired
    private BoxService boxService;

    @Autowired
    private OrdService ordService;

    @Autowired
    private ProductService productService;

    @Autowired
    private PhotoService photoService;

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
        } else {
            model.addAttribute("closed", "closed");
        }
        model.addAttribute("login", login);
        model.addAttribute("login_client", box.getCustomUserClient().getLogin());
        model.addAttribute("id_client", box.getCustomUserClient().getId());
        if (box.getCustomUsers().size() == 2)
            model.addAttribute("login_manager", box.getCustomUserManager().getLogin());
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
    public String boxUpdateOrd(@RequestParam long box_id,
                               @RequestParam long ord_id,
                               @RequestParam String numberProduct,
                               Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        CustomUser customUser = userService.getUserByLogin(login);
        Box box = boxService.getOne(box_id);
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
        List<Ord> ords = ordService.getOrdByBoxSort(box);
        if (box.getStatus() < 2) {
            if (box.getCustomUsers().size() == 2 && box.getCustomUserManager().equals(customUser)) {
                model.addAttribute("edit", "ok");
                model.addAttribute("box_id", box_id);
            }
            for (Ord o :
                    ords) {
                if (o.getNumberProduct() > o.getProduct().getNumber()) {
                    model.addAttribute("complete", "ok");
                    break;
                }
            }
        } else {
            model.addAttribute("closed", "closed");
        }
        model.addAttribute("login", login);
        model.addAttribute("login_client", box.getCustomUserClient().getLogin());
        model.addAttribute("id_client", box.getCustomUserClient().getId());
        if (box.getCustomUsers().size() == 2)
            model.addAttribute("login_manager", box.getCustomUserManager().getLogin());
        model.addAttribute("date", box.getDate());
        model.addAttribute("description", box.getDescription());
        model.addAttribute("phone", box.getCustomUserClient().getPhone());
        model.addAttribute("email", box.getCustomUserClient().getEmail());
        model.addAttribute("address", box.getCustomUserClient().getAddress());
        model.addAttribute("ords", ords);
        model.addAttribute("sum", boxService.getSumBox(box));
        return "manager/manager_work_box";
    }

    @RequestMapping("/manager_box_complete")
    public String boxComplete(@RequestParam long box_id) {
        Box box = boxService.getOne(box_id);
        boxService.completeBox(box);
        return "redirect:/manager";
    }

    @RequestMapping("/manager_search_client")
    public String searchClient(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        model.addAttribute("login", login);
        model.addAttribute("users", userService.getUserByPatternSort("%%", UserRole.USER));
        return "manager/manager_search_client";
    }

    @RequestMapping("/manager_search_client_pattern")
    public String searchClientPattern(@RequestParam String pattern, Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        model.addAttribute("login", login);
        model.addAttribute("users", userService.getUserByPatternSort("%" + pattern + "%", UserRole.USER));
        return "manager/manager_search_client";
    }

    @RequestMapping("/manager_client")
    public String managerClient(@RequestParam long id_client, Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        CustomUser userClient = userService.getOne(id_client);
        model.addAttribute("login", login);
        model.addAttribute("login_client", userClient.getLogin());
        model.addAttribute("boxes", boxService.getBoxesByClientStatus12Sort(userClient));
        return "manager/manager_client";
    }

    @RequestMapping("/manager_product_add")
    public String managerProductAdd(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        model.addAttribute("login", login);
        model.addAttribute("photoNames", photoService.getNames());
        return "manager/manager_product_add";
    }

    @RequestMapping("/manager_product_add_post")
    public String managerProductAddPost(@RequestParam String type_cable,
                                        @RequestParam String numberOfWires_cable,
                                        @RequestParam String area_cable,
                                        @RequestParam String photo_name,
                                        @RequestParam String number_cable,
                                        @RequestParam String price_cable,
                                        @RequestParam String description_cable,
                                        Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        model.addAttribute("login", login);
        model.addAttribute("photoNames", photoService.getNames());
        int numberOfWires = 0;
        double area = 0.0;
        int number = 0;
        double price = 0.0;
        try {
            numberOfWires = Integer.parseInt(numberOfWires_cable);
            area = Double.parseDouble(area_cable);
            number = Integer.parseInt(number_cable);
            price = Double.parseDouble(price_cable);
        } catch (NumberFormatException e) {
            System.out.println(e);
            model.addAttribute("data_error", "error");
            return "manager/manager_product_add";
        }
        if (type_cable.equals("") ||
                numberOfWires == 0 ||
                area == 0.0 ||
                price == 0.0 ||
                description_cable.equals("") ||
                photo_name.equals("")) {
            model.addAttribute("data_error", "error");
            return "manager/manager_product_add";
        }
        Product product = new Product(type_cable, numberOfWires, area, number, ((double) Math.round(price * 100)) / 100, description_cable, photoService.getPhotoByName(photo_name));
        if (!productService.addProduct(product)) {
            model.addAttribute("type_error", "error");
            return "manager/manager_product_add";
        }
        model.addAttribute("add", "ok");
        return "manager/manager_product_add";
    }

    @RequestMapping("/manager_product_all")
    public String managerProductAll(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        model.addAttribute("login", login);
        model.addAttribute("products", productService.getProductAll());
        model.addAttribute("types", productService.getTypes());
        model.addAttribute("numberOfWireses", productService.getNumberOfWires());
        model.addAttribute("areas", productService.getAreas());
        return "manager/manager_product_all";
    }

    @RequestMapping("/manager_product_all_filter")
    public String managerProductAllFilter(@RequestParam String type_cable,
                                          @RequestParam Integer numberOfWires_cable,
                                          @RequestParam Double area_cable,
                                          Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        model.addAttribute("login", login);
        model.addAttribute("products", productService.getProductByTypeAndNumberOfWiresAndAreaSort(type_cable, numberOfWires_cable, area_cable));
        model.addAttribute("types", productService.getTypes());
        model.addAttribute("numberOfWireses", productService.getNumberOfWires());
        model.addAttribute("areas", productService.getAreas());
        return "manager/manager_product_all";
    }

    @RequestMapping("/manager_product_delete")
    public String managerProductDelete(@RequestParam long product_id) {
        Product product = productService.getProductOne(product_id);
        productService.deleteProduct(product);
        return "redirect:/manager_product_all";
    }

    @RequestMapping("/manager_product_update")
    public String managerProductUpdate(@RequestParam String product_price,
                                       @RequestParam String product_number,
                                       @RequestParam long product_id,
                                       Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        model.addAttribute("login", login);
        model.addAttribute("types", productService.getTypes());
        model.addAttribute("numberOfWireses", productService.getNumberOfWires());
        model.addAttribute("areas", productService.getAreas());
        int number = 0;
        double price = 0.0;
        try {
            number = Integer.parseInt(product_number);
            price = Double.parseDouble(product_price);
        } catch (NumberFormatException e) {
            System.out.println(e);
            model.addAttribute("data_error", "error");
            model.addAttribute("products", productService.getProductAll());
            return "manager/manager_product_all";
        }
        if (price == 0.0) {
            model.addAttribute("data_error", "error");
            model.addAttribute("products", productService.getProductAll());
            return "manager/manager_product_all";
        }
        Product product = productService.getProductOne(product_id);
        product.setNumber(number);
        product.setPrice(price);
        productService.updateProduct(product);
        model.addAttribute("products", productService.getProductAll());
        model.addAttribute("update", "ok");
        return "manager/manager_product_all";
    }
//    /manager_photo_add
}
