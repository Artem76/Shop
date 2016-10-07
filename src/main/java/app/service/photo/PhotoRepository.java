package app.service.photo;

import app.entity.Photo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface PhotoRepository extends JpaRepository<Photo, Long> {
    @Query("SELECT p FROM Photo p where p.name = :name")
    Photo findByName(@Param("name") String name);
}
