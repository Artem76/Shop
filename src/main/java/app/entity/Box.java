package app.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Box {
    @Id
    @GeneratedValue
    private long id;

  /*  @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name="BoxCustomUser",
            joinColumns={@JoinColumn(name="box_id", referencedColumnName="id")},
            inverseJoinColumns={@JoinColumn(name="customUser_id", referencedColumnName="id")})*/
//    private List<CustomUser> customUsers = new ArrayList<>();

//    @OneToMany(cascade = CascadeType.ALL)
//    private List<Ord> ords = new ArrayList<>();

    private Boolean status;
    private String description;
    private Long time;

    public Box() { }

 /*   public Box(List<CustomUser> customUsers) {
        this.customUsers = customUsers;
    }*/

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

  /*  public List<CustomUser> getCustomUsers() {
        return customUsers;
    }*/
/*
    public void setCustomUsers(List<CustomUser> customUsers) {
        this.customUsers = customUsers;
    }*/
/*

    public List<Ord> getOrders() {
        return ords;
    }

    public void setOrders(List<Ord> ords) {
        this.ords = ords;
    }
*/

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
