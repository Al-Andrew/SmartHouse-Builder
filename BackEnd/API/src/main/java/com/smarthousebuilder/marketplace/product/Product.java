package com.smarthousebuilder.marketplace.product;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.persistence.*;
import java.util.*;
import java.util.stream.Collectors;

@Entity
@Table(name = "products")
public class Product {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "category")
    private String category;
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
    @Column(name = "png_url")
    private String pngUrl;
    @Basic
    @Column(name = "forum_link")
    private String forumLink;
    @Basic
    @Column(name = "product_url")
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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
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

    public String getPngUrl() {
        return pngUrl;
    }

    public void setPngUrl(String pngUrl) {
        this.pngUrl = pngUrl;
    }

    public String getForumLink() {
        return forumLink;
    }

    public void setForumLink(String forumLink) {
        this.forumLink = forumLink;
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
        if (!(o instanceof Product)) return false;
        Product product = (Product) o;
        return id == product.id && category.equals(product.category) && name.equals(product.name) && price.equals(product.price) && rating.equals(product.rating) && pngUrl.equals(product.pngUrl) && forumLink.equals(product.forumLink) && productUrl.equals(product.productUrl) && description.equals(product.description) && specifications.equals(product.specifications);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, category, name, price, rating, pngUrl, forumLink, productUrl, description, specifications);
    }

    public List<String> getEcosystems() throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, String> specs = new HashMap<>();
        specs = mapper.readValue(this.specifications, specs.getClass());
        String ecosystems = specs.get("ecosystem");
        if(ecosystems == null)
            return new ArrayList<>();
        return Arrays.asList(ecosystems.split(", "));
    }
}
