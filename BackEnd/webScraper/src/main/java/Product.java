
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.*;

public class Product {
    @JsonProperty
    String category;
    @JsonProperty
    String forumLink;
    @JsonProperty
    String name;
    @JsonProperty
    Float price;
    @JsonProperty
    Float rating;
    @JsonProperty
    String productUrl;
    @JsonProperty
    String pngUrl;
    @JsonProperty
    String description;
    @JsonProperty("specifications")
    String specifications;
    @JsonIgnore
    Map<String, String> detailsOfProduct;

    Product(String linkToPng, String linkToProduct, String category) {
        this.category = category;
        this.forumLink = "None";
        this.rating = null;
        this.name = null;
        this.price = null;
        this.pngUrl = linkToPng;
        this.productUrl = linkToProduct;
        this.detailsOfProduct = new HashMap<>();
    }

    public void setCategory(String category) {
        this.category = category;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setRating(Float rating) {
        this.rating = rating;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public void addPrice(Float price){
        this.price = price;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Product product = (Product) o;
        return  Objects.equals(forumLink, product.forumLink) && Objects.equals(name, product.name) && Objects.equals(price, product.price) && Objects.equals(rating, product.rating) && Objects.equals(productUrl, product.productUrl) && Objects.equals(pngUrl, product.pngUrl) && Objects.equals(description, product.description) && Objects.equals(specifications, product.specifications) && Objects.equals(detailsOfProduct, product.detailsOfProduct);
    }

    @Override
    public int hashCode() {
        return Objects.hash(category, forumLink, name, price, rating, productUrl, pngUrl, description, specifications, detailsOfProduct);
    }

    public List<String> getEcosystems(String name) {
        List<String> ecosystemList = new LinkedList<>(
                Arrays.asList("Control4", "Yonomi", "Smart Life", "IFTTT", "Alexa", "Logitech", "Apple HomeKit", "Google Asistant", "Google Home", "SmartThings")
        );

        List<String> result = new ArrayList<>();
        for (var ecosystem : ecosystemList) {
            if (name.contains(ecosystem))
                result.add(ecosystem);
        }
        if(result.size() == 0)
            result.add("None");
        return result;
    }

    @Override
    public String toString() {
        return "Product{" +
                "categoryId=" + category +
                ", forumLink='" + forumLink + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", rating=" + rating +
                ", productUrl='" + productUrl + '\'' +
                ", pngUrl='" + pngUrl + '\'' +
                ", description='" + description + '\'' +
                ", detailsOfProduct=" + detailsOfProduct +
                '}';
    }
}
