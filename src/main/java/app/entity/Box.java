package app.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Box {
    @Id
    @GeneratedValue
    private long id;

    @ManyToMany(fetch = FetchType.EAGER)
    private List<CustomUser> customUsers = new ArrayList<>();

    @OneToMany(cascade = CascadeType.ALL)
    private List<Ord> ords = new ArrayList<>();

    private Boolean status;
    private String description;
    private Long time;

    public Box() { }

    public Box(CustomUser customUser) {
        this.customUsers.add(0,customUser);
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public CustomUser getCustomUserClient() {
        return customUsers.get(0);
    }

    public CustomUser getCustomUserManager() {
        return customUsers.get(1);
    }

    public void setCustomUserClient(CustomUser customUser) {
        this.customUsers.add(0,customUser);
    }

    public void setCustomUserManager(CustomUser customUser) {
        this.customUsers.add(1,customUser);
    }

    public List<Ord> getOrders() {
        return ords;
    }

    public void setOrders(List<Ord> ords) {
        this.ords = ords;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getTime() {
        return time;
    }

    public void setTime(Long time) {
        this.time = time;
    }
}
