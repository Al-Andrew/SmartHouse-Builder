package com.smarthousebuilder.marketplace.product;

import javax.persistence.*;

@Entity
@Table(name="products")
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
    @Basic
    @Column(name = "png_URL")
    private String pngUrl;
    @Basic
    @Column(name = "product_URL")
    private String productUrl;
    @Basic
    @Column(name = "description")
    private String description;
    @Basic
    @Column(name = "specifications")
    private String specifications;

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

    public String getPngUrl() {
        return pngUrl;
    }

    public void setPngUrl(String pngUrl) {
        this.pngUrl = pngUrl;
    }

    public String getProductUrl() {
        return productUrl;
    }

    public void setProductUrl(String productUrl) {
        this.productUrl = productUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSpecifications() {
        return specifications;
    }

    public void setSpecifications(String specifications) {
        this.specifications = specifications;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Product product = (Product) o;

        if (id != product.id) return false;
        if (categoryId != null ? !categoryId.equals(product.categoryId) : product.categoryId != null) return false;
        if (name != null ? !name.equals(product.name) : product.name != null) return false;
        if (price != null ? !price.equals(product.price) : product.price != null) return false;
        if (rating != null ? !rating.equals(product.rating) : product.rating != null) return false;
        if (forumLink != null ? !forumLink.equals(product.forumLink) : product.forumLink != null) return false;
        if (pngUrl != null ? !pngUrl.equals(product.pngUrl) : product.pngUrl != null) return false;
        if (productUrl != null ? !productUrl.equals(product.productUrl) : product.productUrl != null) return false;
        if (description != null ? !description.equals(product.description) : product.description != null)
            return false;
        if (specifications != null ? !specifications.equals(product.specifications) : product.specifications != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (categoryId != null ? categoryId.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (rating != null ? rating.hashCode() : 0);
        result = 31 * result + (forumLink != null ? forumLink.hashCode() : 0);
        result = 31 * result + (pngUrl != null ? pngUrl.hashCode() : 0);
        result = 31 * result + (productUrl != null ? productUrl.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (specifications != null ? specifications.hashCode() : 0);
        return result;
    }
}
