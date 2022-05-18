
import java.util.HashMap;
import java.util.Map;

public class Product extends AllProducts{
    String name;
    String price;
    String linkToProduct;
    String linkToPng;

    Map<String, String> detailsOfProduct;
    String sizeOfProduct;


    Product(String name, String linkToPng, String linkToProduct){
        this.name = name;
        this.price = "Out of Stock";
        this.linkToPng = linkToPng;
        this.linkToProduct = linkToProduct;
        this.detailsOfProduct = new HashMap<>();
    }


    void addPrice(String price){
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public String getPrice() {
        return price;
    }

    public String getLinkToProduct() {
        return linkToProduct;
    }

    public String getLinkToPng() {
        return linkToPng;
    }

    public String getSize() {
        return sizeOfProduct;
    }


    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public void setLinkToProduct(String linkToProduct) {
        this.linkToProduct = linkToProduct;
    }

    @Override
    public String toString() {
        return "Product{" +
                "name='" + name + '\'' +
                ", price='" + price + '\'' +
                ", linkToProduct='" + linkToProduct + '\'' +
                ", linkToPng='" + linkToPng + '\'' +
                ", detailsOfProduct=" + detailsOfProduct +
                ", sizeOfProduct='" + sizeOfProduct + '\'' +
                '}';
    }

    public void setLinkToPng(String linkToPng) {
        this.linkToPng = linkToPng;
    }

    public void setSize(String size) {
        sizeOfProduct = size;
    }

}
