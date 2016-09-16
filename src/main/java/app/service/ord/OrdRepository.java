package app.service.ord;

import app.entity.Ord;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrdRepository extends JpaRepository<Ord, Long> {
}
