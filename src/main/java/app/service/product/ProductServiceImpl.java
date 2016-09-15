package app.service.product;

import app.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
  /*  @Autowired
    private ProductRepository productRepository;

    @Override
    @Transactional
    public List<Product> getProductAll() {
        return productRepository.findAll();
    }

    @Override
    @Transactional
    public void addProduct(Product product) {
        productRepository.save(product);
    }

    @Override
    @Transactional
    public void updateProduct(Product product) {
        productRepository.save(product);
    }

    @Override
    @Transactional
    public void deleteProduct(Product product) {
        productRepository.delete(product);
    }*/
}
