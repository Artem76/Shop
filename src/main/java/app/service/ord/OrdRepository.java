package app.service.ord;

import app.entity.Box;
import app.entity.Ord;
import app.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OrdRepository extends JpaRepository<Ord, Long> {
    @Query("SELECT o FROM Ord o WHERE o.product = :product and o.box = :box")
    List<Ord> findByProductBox(@Param("product") Product product, @Param("box") Box box);

    @Query("SELECT o FROM Ord o WHERE o.box = :box")
    List<Ord> findByBox(@Param("box") Box box);
}
