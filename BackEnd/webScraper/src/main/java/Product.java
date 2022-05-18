
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;
import java.util.List;

public class Product extends AllProducts{
    String name;
    String price;
    String linkToProduct;
    String linkToPng;

    Map<String, String> detailsOfProduct;
    String sizeOfProduct;
    String ecosystem;


    Product(String name, String linkToPng, String linkToProduct){
        this.name = name;
        this.price = "Out of Stock";
        this.linkToPng = linkToPng;
        this.linkToProduct = linkToProduct;
        this.ecosystem = "None";
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

    public void setEcosystem(String ecosystem) {
        this.ecosystem = ecosystem;
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


    public void setLinkToPng(String linkToPng) {
        this.linkToPng = linkToPng;
    }

    public void setSize(String size) {
        sizeOfProduct = size;
    }

    public String ecosystems(String name){
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
        for(int i = 0; i < a.size(); i++){
            if(name.contains(a.get(i))){
                if(ecfinal.equals("")){
                    ecfinal = a.get(i);
                }
                else{
                    ecfinal = ecfinal + ", " + a.get(i);
                }
            }
        }
        if(ecfinal.equals(""))
            return "None";
        else
            return ecfinal;
    }

    @Override
    public String toString() {
        return "Product{" +
                "name='" + name + '\'' +
                ", price='" + price + '\'' +
                ", ecosystem='" + ecosystem + '\'' +
                ", linkToProduct='" + linkToProduct + '\'' +
                ", linkToPng='" + linkToPng + '\'' +
                ", detailsOfProduct=" + detailsOfProduct +
                ", sizeOfProduct='" + sizeOfProduct + '\'' +
                '}';
    }
}
