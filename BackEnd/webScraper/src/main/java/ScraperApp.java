
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.ArrayList;
import java.util.List;

public class ScraperApp {

    public static void main(String[] args) {
        List<Product> listOfProducts = new ArrayList<Product>();
        // JUST AMAZON -> 7 pages of smart home products
        for (int i = 1; i <= 7; i++) {
            StringBuilder url = new StringBuilder("https://www.amazon.com/s?k=smart+home+devices&page=");
            url.append(i);
            try {
                final Document document = Jsoup.connect(String.valueOf(url)).userAgent("").get();

                Elements content = document.select("div.s-card-container.s-overflow-hidden.aok-relative.s-expand-height.s-include-content-margin.s-latency-cf-section.s-card-border");

                for (Element e : content) {

                    String nameProduct = e.select("img").attr("alt");
                    nameProduct = nameProduct.replaceAll("Sponsored Ad - ", "");
                    String img = e.select("img").attr("src");
                    String link = "https://amazon.com" + e.select("a.a-link-normal.s-no-outline").attr("href");
                    listOfProducts.add(new Product(nameProduct, img, link));
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            url.deleteCharAt(url.length() - 1);
        }

        try {
            for (Product temporary : listOfProducts) {
                    Document connectToProduct = Jsoup.connect(temporary.linkToProduct).userAgent("").get();
                    Elements contents = connectToProduct.select("div.a-box-inner");

                    for (Element e : contents) {
                        Element price = e.select("div.a-section.a-spacing-micro span.a-offscreen").first();
                        if (price == null)
                            continue;
                        temporary.addPrice(price.text());
                    }
            }
        }
        catch(Exception ex){
                ex.printStackTrace();
            }

        for(Product prod : listOfProducts){
            System.out.println(prod);
        }
    }


}