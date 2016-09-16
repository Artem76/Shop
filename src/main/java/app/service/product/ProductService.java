package app.service.product;

import app.entity.Product;

import java.util.List;

public interface ProductService {
    List<Product> getProductByTypeAndNumberOfWiresAndArea(String type, Integer numberOfWires, Double area);
    List<Product> getProductAll();
    Product getProductOne(long id);
    void addProduct(Product product);
    void updateProduct(Product product);
    void deleteProduct(Product product);
}
