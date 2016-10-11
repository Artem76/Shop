package app.service.product;

import app.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductRepository productRepository;

    @Override
    @Transactional(readOnly = true)
    public List<Product> getProductByTypeAndNumberOfWiresAndAreaSort(String type, Integer numberOfWires, Double area) {
        List<Product> products = new ArrayList<>(productRepository.findAll());
        List<Product> productList = new ArrayList<>();
        for (Product product:
             products) {
            if((type.equals("All") || product.getType().equals(type)) &&
                    (numberOfWires.equals(0) || product.getNumberOfWires().equals(numberOfWires)) &&
                    (area.equals(0.0) || product.getArea().equals(area))){
                productList.add(product);
            }
        }
        productList.sort((a,b) -> a.getType().compareTo(b.getType())!=0 ? a.getType().compareTo(b.getType()) :
                a.getNumberOfWires().compareTo(b.getNumberOfWires())!=0 ? a.getNumberOfWires().compareTo(b.getNumberOfWires()) :
                        a.getArea().compareTo(b.getArea()));
        return productList;
    }

    @Override
    @Transactional(readOnly = true)
    public Product getProductOne(long id) {
        return productRepository.findOne(id);
    }

    @Override
    @Transactional(readOnly = true)
    public List<String> getTypes() {
        TreeSet<String> typeSet = new TreeSet<String>();
        for (Product product:
             productRepository.findAll()) {
            typeSet.add(product.getType());
        }
        List<String> typeList = new ArrayList<>();
        typeList.addAll(typeSet);
        return typeList;
    }

    @Override
    @Transactional(readOnly = true)
    public List<Integer> getNumberOfWires() {
        TreeSet<Integer> numberOfWiresSet = new TreeSet<Integer>();
        for (Product product:
                productRepository.findAll()) {
            numberOfWiresSet.add(product.getNumberOfWires());
        }
        List<Integer> numberOfWiresList = new ArrayList<>();
        numberOfWiresList.addAll(numberOfWiresSet);
        return numberOfWiresList;
    }

    @Override
    @Transactional(readOnly = true)
    public List<Double> getAreas() {
        TreeSet<Double> areaSet = new TreeSet<Double>();
        for (Product product:
                productRepository.findAll()) {
            areaSet.add(product.getArea());
        }
        List<Double> areaList = new ArrayList<>();
        areaList.addAll(areaSet);
        return areaList;
    }

    @Override
    @Transactional(readOnly = true)
    public List<Product> getProductAll() {
        List<Product> products = new ArrayList<>(productRepository.findAll());
        products.sort((a,b) -> a.getType().compareTo(b.getType())!=0 ? a.getType().compareTo(b.getType()) :
                a.getNumberOfWires().compareTo(b.getNumberOfWires())!=0 ? a.getNumberOfWires().compareTo(b.getNumberOfWires()) :
                        a.getArea().compareTo(b.getArea()));
        return products;
    }

    @Override
    @Transactional
    public boolean addProduct(Product product) {
        if (getProductByTypeAndNumberOfWiresAndAreaSort(product.getType(),product.getNumberOfWires(),product.getArea()).size() > 0) return false;
        productRepository.save(product);
        return true;
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
    }
}
