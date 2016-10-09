package app.service.user;

import app.entity.CustomUser;
import app.entity.enums.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserRepository extends JpaRepository<CustomUser, Long> {
    @Query("SELECT u FROM CustomUser u where u.login = :login")
    CustomUser findByLogin(@Param("login") String login);

    @Query("SELECT u FROM CustomUser u WHERE (u.login LIKE :pattern OR u.email LIKE :pattern) AND u.role = :role ORDER BY login ASC ")
    List<CustomUser> findByPatternSort(@Param("pattern") String pattern, @Param("role") UserRole role);

//    @Query("SELECT u FROM CustomUser u WHERE u.login LIKE :pattern AND u.role = :role ORDER BY login ASC ")
//    List<CustomUser> findByPatternSort(@Param("pattern") String pattern, @Param("role") UserRole role);

    @Query("SELECT u FROM CustomUser u where u.login = :login AND u.role = :role")
    CustomUser findByLogin(@Param("login") String login, @Param("role") UserRole role);

    @Query("SELECT u FROM CustomUser u where u.phone = :phone AND u.role = :role")
    CustomUser findByPhone(@Param("phone") String phone, @Param("role") UserRole role);

    @Query("SELECT u FROM CustomUser u where u.email = :email AND u.role = :role")
    CustomUser findByEmail(@Param("email") String email, @Param("role") UserRole role);
}
