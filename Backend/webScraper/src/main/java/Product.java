
import java.util.List;
import java.util.Map;

public class Product {
    String name;
    String price;
    String linkToProduct;
    String linkToPng;

    List<String> details;
    String Size;


    Product(String name, String linkToPng, String linkToProduct){
        this.name = name;
        this.price = "Out of Stock";
        this.linkToPng = linkToPng;
        this.linkToProduct = linkToProduct;
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
        return Size;
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
                '}';
    }

    public void setLinkToPng(String linkToPng) {
        this.linkToPng = linkToPng;
    }

    public void setSize(String size) {
        Size = size;
    }

}
