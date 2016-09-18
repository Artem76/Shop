package app.service.box;

import app.entity.Box;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface BoxRepository extends JpaRepository<Box,Long> {
    @Query("SELECT b FROM Box b WHERE b.status = :status ORDER BY date DESC ")
    List<Box> findByStatusSort(@Param("status") Boolean status);
}
