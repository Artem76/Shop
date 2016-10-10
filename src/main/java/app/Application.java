package app;

import app.entity.CustomUser;
import app.entity.Photo;
import app.entity.Product;
import app.entity.enums.UserRole;
import app.service.photo.PhotoService;
import app.service.product.ProductService;
import app.service.user.UserService;
import app.service.box.BoxService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import javax.sql.rowset.serial.SerialBlob;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Blob;
import java.util.TimeZone;

@SpringBootApplication
public class Application {

    public static void main(String[] args) {
        TimeZone.setDefault(TimeZone.getTimeZone("Etc/UTC"));
        SpringApplication.run(Application.class, args);
    }

    @Bean
    public CommandLineRunner demo(final UserService userService, final ProductService productService, final BoxService boxService, final PhotoService photoService) {
        return new CommandLineRunner() {

            @Override
            public void run(String... strings) throws Exception {

                String [] pName = {"vvg2","vvg3","vvg4","vvg5","pvs2","pvs3","pvs4","pvs5"};
                for (String name:
                     pName) {
                    try{
                        DataInputStream dis = new DataInputStream(new FileInputStream(new File("D:/photo/" + name + ".png" )));
                        byte[] bytes = new byte[dis.available()];
                        dis.read(bytes);
                        Blob blob = new SerialBlob(bytes);
                        Photo photo = new Photo(name,blob);
                        photoService.addPhoto(photo);
                    } catch (Exception e){
                        System.out.println(e);
                    }
                }
                userService.addUser(new CustomUser("admin", "5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8", UserRole.ADMIN));
                userService.addUser(new CustomUser("user", "5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8", UserRole.USER, "cmua76@outlook.com", "+380979468925", "�.����, ��. ���������� 48"));
                userService.addUser(new CustomUser("user1", "5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8", UserRole.USER, "inset@live.ru", "+380950138166", "�.����, ��. ���������� 50"));
                userService.addUser(new CustomUser("manager", "5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8", UserRole.MANAGER));
                userService.addUser(new CustomUser("manager1", "5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8", UserRole.MANAGER));
                productService.addProduct(new Product("���",3,6.0,750,38.40,"������ ������� ������ ��� �������� � ���������� �����.",photoService.getPhotoByName("vvg3")));
                productService.addProduct(new Product("���",4,4.0,350,25.90,"������ ������ ���� ��� ���������� �����.",photoService.getPhotoByName("pvs4")));
                productService.addProduct(new Product("���",2,1.5,350,9.56,"������ ������ ���� ��� ���������� �����.",photoService.getPhotoByName("pvs2")));
                productService.addProduct(new Product("���",5,4.0,300,35.87,"������ ������� ������ ��� �������� � ���������� �����.",photoService.getPhotoByName("vvg5")));
                productService.addProduct(new Product("���",2,1.5,450,12.34,"������ ������� ������ ��� �������� � ���������� �����.",photoService.getPhotoByName("vvg2")));
                productService.addProduct(new Product("���",5,6.0,850,42.84,"������ ������ ���� ��� ���������� �����.",photoService.getPhotoByName("pvs5")));
                productService.addProduct(new Product("���",3,2.5,250,17.66,"������ ������ ���� ��� ���������� �����.",photoService.getPhotoByName("pvs3")));
                productService.addProduct(new Product("���",4,2.5,450,24.54,"������ ������� ������ ��� �������� � ���������� �����.",photoService.getPhotoByName("vvg4")));
            }
        };
    }
}