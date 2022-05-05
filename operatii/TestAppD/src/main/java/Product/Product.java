package Product;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Product")
public class Product {
    @Id
    @GeneratedValue
    private Integer id;

    private Integer category_id;

    private String name;

    private Double price;

    private Double rating;

    private String forumLink;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCategory_id() {
        return category_id;
    }

    public void setCategory_id(Integer category_id) {
        this.category_id = category_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getRating() {
        return rating;
    }

    public void setRating(Double rating) {
        this.rating = rating;
    }

    public String getForumLink() {
        return forumLink;
    }

    public void setForumLink(String forumLink) {
        this.forumLink = forumLink;
    }

    public Product(Integer id, Integer category_id, String name, Double price, Double rating, String forumLink) {
        this.id = id;
        this.category_id = category_id;
        this.name = name;
        this.price = price;
        this.rating = rating;
        this.forumLink = forumLink;
    }

    public Product() {
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", category_id=" + category_id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", rating=" + rating +
                ", forumLink='" + forumLink + '\'' +
                '}';
    }
}
