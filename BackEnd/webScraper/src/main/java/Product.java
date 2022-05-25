
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.*;

public class Product {
    @JsonProperty
    Integer categoryId;
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


    //TODO(Razvan): ecosystem sa fie lista!!!

    Product(String name, String linkToPng, String linkToProduct) {
        Random rand = new Random();
        this.categoryId = null;
        this.forumLink = "None";
        this.rating = null;
        this.name = name;
        this.price = null;
        this.pngUrl = linkToPng;
        this.productUrl = linkToProduct;
        this.detailsOfProduct = new HashMap<>();
    }



    public Integer getCategoryId() {
        return categoryId;
    }

    public String getForumLink() {
        return forumLink;
    }

    public Float getRating() {
        return rating;
    }

    public String getDescription() {
        return description;
    }

    public Map<String, String> getDetailsOfProduct() {
        return detailsOfProduct;
    }


    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public void setForumLink(String forumLink) {
        this.forumLink = forumLink;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public void setRating(Float rating) {
        this.rating = rating;
    }

    public void setProductUrl(String productUrl) {
        this.productUrl = productUrl;
    }

    public void setPngUrl(String pngUrl) {
        this.pngUrl = pngUrl;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public void addPrice(Float price){
        this.price = price;
    }
    public String ecosystems(String name) {
        List<String> a = new LinkedList<>();
        String ecfinal = "";
        a.add("Control4");
        a.add("Yonomi");
        a.add("Smart Life");
        a.add("IFTTT");
        a.add("Alexa");
        a.add("Logitech");
        a.add("Apple HomeKit");
        a.add("Google Asistant");
        a.add("Google Home");
        a.add("SmartThings");
        for (int i = 0; i < a.size(); i++) {
            if (name.contains(a.get(i))) {
                if (ecfinal.equals("")) {
                    ecfinal = a.get(i);
                } else {
                    ecfinal = ecfinal + ", " + a.get(i);
                }
            }
        }
        if (ecfinal.equals(""))
            return "None";
        else
            return ecfinal;
    }


    @Override
    public String toString() {
        return "Product{" +
                "categoryId=" + categoryId +
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
