package app.entity;

import javax.persistence.*;

@Entity
public class Ord {
    @Id
    @GeneratedValue
    private long id;

//    @ManyToOne(fetch = FetchType.EAGER)
//    private Box box;
//
//    @ManyToOne(fetch = FetchType.EAGER)
//    private Product product;

    private Integer numberProduct;

    public Ord() { }

 /*   public Ord(Box box, Product product, Integer numberProduct) {
        this.box = box;
        this.product = product;
        this.numberProduct = numberProduct;
    }
*/
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
/*

    public Box getBox() {
        return box;
    }

    public void setBox(Box box) {
        this.box = box;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
*/

    public Integer getNumberProduct() {
        return numberProduct;
    }

    public void setNumberProduct(Integer numberProduct) {
        this.numberProduct = numberProduct;
    }
}
