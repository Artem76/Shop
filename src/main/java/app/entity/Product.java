package app.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Product {
    @Id
    @GeneratedValue
    private long id;

    private String type;
    private Integer numberOfWires;
    private Double area;
    private Integer number;
    private String description;

   /* @OneToMany(
mappedBy = "product",
cascade = CascadeType.ALL)
    private List<Ord> orders = new ArrayList<>();*/

    @ManyToOne(fetch = FetchType.EAGER)
    private Photo photo;

    public Product() { }

    public Product(String type, Integer numberOfWires, Double area, Integer number, String description, Photo photo) {
        this.type = type;
        this.numberOfWires = numberOfWires;
        this.area = area;
        this.number = number;
        this.description = description;
        this.photo = photo;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getNumberOfWires() {
        return numberOfWires;
    }

    public void setNumberOfWires(Integer numberOfWires) {
        this.numberOfWires = numberOfWires;
    }

    public Double getArea() {
        return area;
    }

    public void setArea(Double area) {
        this.area = area;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
/*
    public List<Ord> getOrders() {
        return orders;
    }

    public void setOrders(List<Ord> ords) {
        this.orders = ords;
    }
*/

    public Photo getPhoto() {
        return photo;
    }

    public void setPhoto(Photo photo) {
        this.photo = photo;
    }
}
