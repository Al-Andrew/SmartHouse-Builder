package com.example.marketplace.Product;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "products")
public class Product {
    @GeneratedValue()
    @Id
    @Column(name = "id")
    private int id;

    @Basic
    @Column(name = "category_id")
    private Integer categoryId;

    @Basic
    @Column(name = "name")
    private String name;
    @Basic
    @Column(name = "price")
    private Double price;
    @Basic
    @Column(name = "rating")
    private Double rating;
    @Basic
    @Column(name = "forum_link")
    private String forumLink;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Product that = (Product) o;

        if (id != that.id) return false;
        if (!Objects.equals(categoryId, that.categoryId)) return false;
        if (!Objects.equals(name, that.name)) return false;
        if (!Objects.equals(price, that.price)) return false;
        if (!Objects.equals(rating, that.rating)) return false;
        return Objects.equals(forumLink, that.forumLink);
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (categoryId != null ? categoryId.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (rating != null ? rating.hashCode() : 0);
        result = 31 * result + (forumLink != null ? forumLink.hashCode() : 0);
        return result;
    }
}
