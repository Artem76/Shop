package app.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
public class Box {
    @Id
    @GeneratedValue
    private long id;

    @ManyToMany(fetch = FetchType.EAGER)
    private List<CustomUser> customUsers = new ArrayList<>();

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Ord> ords = new ArrayList<>();

    private Integer status;
    private String description;

    @Temporal(value = TemporalType.TIMESTAMP)
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    private Date date;

    public Box() { }

    public Box(CustomUser customUser) {
        this.customUsers.add(0,customUser);
        this.status = 0;
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

    public List<Ord> getOrds() {
        return ords;
    }

    public void setOrds(List<Ord> ords) {
        this.ords = ords;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
