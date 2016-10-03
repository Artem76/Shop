package app;

import app.entity.CustomUser;
import app.entity.Product;
import app.entity.enums.UserRole;
import app.service.product.ProductService;
import app.service.user.UserService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import java.util.TimeZone;

@SpringBootApplication
public class Application {

    public static void main(String[] args) {
        TimeZone.setDefault(TimeZone.getTimeZone("Etc/UTC"));
        SpringApplication.run(Application.class, args);
    }

    @Bean
    public CommandLineRunner demo(final UserService userService, final ProductService productService) {
        return new CommandLineRunner() {



            @Override
            public void run(String... strings) throws Exception {

//                PhotoService photoService=new PhotoServiceImpl();
             /*   try{
                    DataInputStream dis = new DataInputStream(new FileInputStream(new File("D:/OneDrive/Java/Pro/ShopBoot/src/main/webapp/WEB-INF/images/vvg3.png" )));
                    byte[] bytes = new byte[dis.available()];
                    System.out.println(bytes.length);
                    dis.read(bytes);
                    System.out.println(bytes.length);
                    Photo photo = new Photo("vvg3",bytes);
                    photoRepository.save(photo);
                } catch (Exception e){
                    System.out.println(e);
                }*/

                userService.addUser(new CustomUser("admin", "5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8", UserRole.ADMIN));
                userService.addUser(new CustomUser("user", "5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8", UserRole.USER));
                userService.addUser(new CustomUser("manager", "5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8", UserRole.MANAGER));
                productService.addProduct(new Product("���",3,6.0,750,38.40,"������ ������� ������ ��� �������� � ���������� �����.","vvg3.png"));
                productService.addProduct(new Product("���",4,4.0,350,25.90,"������ ������ ���� ��� ���������� �����.","pvs4.png"));
                productService.addProduct(new Product("���",2,1.5,350,9.56,"������ ������ ���� ��� ���������� �����.","pvs2.png"));
                productService.addProduct(new Product("���",5,4.0,300,35.87,"������ ������� ������ ��� �������� � ���������� �����.","vvg5.png"));
                productService.addProduct(new Product("���",2,1.5,450,12.34,"������ ������� ������ ��� �������� � ���������� �����.","vvg2.png"));
                productService.addProduct(new Product("���",5,6.0,850,42.84,"������ ������ ���� ��� ���������� �����.","pvs5.png"));
                productService.addProduct(new Product("���",3,2.5,250,17.66,"������ ������ ���� ��� ���������� �����.","pvs3.png"));
                productService.addProduct(new Product("���",4,2.5,450,24.54,"������ ������� ������ ��� �������� � ���������� �����.","vvg4.png"));
            }
        };
    }
}