package app.service.product;

import app.entity.Product;

import java.util.List;

public interface ProductService {
    List<Product> getProductByTypeAndNumberOfWiresAndAreaSort(String type, Integer numberOfWires, Double area);
    List<Product> getProductAll();
    Product getProductOne(long id);
    List<String> getTypes();
    List<Integer> getNumberOfWires();
    List<Double> getAreas();
    boolean addProduct(Product product);
    void updateProduct(Product product);
    void deleteProduct(Product product);
}
