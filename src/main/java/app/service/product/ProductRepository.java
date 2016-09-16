package app.service.product;

import app.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {
    @Query("SELECT p FROM Product p where p.type = :type AND p.numberOfWires = :numberOfWires AND p.area = :area")
    List<Product> findByTypeAndNumberOfWiresAndArea(
            @Param("type") String type,
            @Param("numberOfWires") Integer numberOfWires,
            @Param("area") Double area);
}
