package app.entity;


import javax.persistence.*;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Photo {
    @Id
    @GeneratedValue
    private long id;

    private String name;

    private Blob body;

    @OneToMany(cascade = CascadeType.ALL)
    private List<Product> products = new ArrayList<>();


    public Photo() {
    }

    public Photo(String name,Blob body) {
        this.name = name;
        this.body = body;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Blob getBody() {
        return body;
    }

    public void setBody(Blob body) {
        this.body = body;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }
}
