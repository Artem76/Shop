package app.service.message;

import app.entity.CustomUser;
import app.entity.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MessageRepository extends JpaRepository<Message, Long> {
    @Query("SELECT m FROM Message m where m.customUser = :customUser ORDER BY m.date desc ")
    List<Message> findByCustomUser(@Param("customUser")CustomUser customUser);

    @Query("SELECT m FROM Message m where m.customUser = :customUser ORDER BY m.date desc ")
    List<Message> findAllSort();
}
