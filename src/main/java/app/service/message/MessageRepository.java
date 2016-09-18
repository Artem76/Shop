package app.service.message;

import app.entity.CustomUser;
import app.entity.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface MessageRepository extends JpaRepository<Message, Long> {
    @Query("SELECT m FROM Message m ORDER BY date DESC ")
    List<Message> findAllSort();

    @Query("SELECT m FROM Message m WHERE m.user = :customUser ORDER BY date DESC ")
    List<Message> findByUserSort(CustomUser customUser);
}
