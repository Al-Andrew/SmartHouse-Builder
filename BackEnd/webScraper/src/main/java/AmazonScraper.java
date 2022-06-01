import com.fasterxml.jackson.databind.ObjectMapper;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.List;

public class AmazonScraper {
    public final List<Product> listOfProducts;
    public StringBuilder url;

    ScraperApp checkIdenticalProducts;


    AmazonScraper(StringBuilder url, List<Product> prod, ScraperApp checkIdenticalProducts) {
        this.listOfProducts = prod;
        this.url = url;
        this.checkIdenticalProducts = checkIdenticalProducts;
    }

    public void startScrape(int startPage, int howManyPages) {
        mainScrape(startPage,howManyPages);
        productInformationScrape();
    }

    private void mainScrape(int startPage, int howManyPages){
            try {
                for (int i = startPage; i <= howManyPages; i++) {
                    this.url.append(i);
                    Thread.sleep(2500);
                    Connection conn = Jsoup.connect(String.valueOf(url)).userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)");
                    Document document = conn.get();

                    Elements content = document.select("div.s-card-container.s-overflow-hidden.aok-relative.s-expand-height.s-include-content-margin.s-latency-cf-section.s-card-border");

                    for (Element e : content) {
                        String img = e.select("img").attr("src");
                        String link = "https://amazon.com" + e.select("a.a-link-normal.s-no-outline").attr("href");
                        listOfProducts.add(new Product(img, link));
                    }
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            this.url.deleteCharAt(url.length() - 1);
         System.out.println(listOfProducts.size());
        }



    private void productInformationScrape(){
        for (Product temporary : this.listOfProducts) {
            try {
                ObjectMapper mapper = new ObjectMapper();
                if(checkIdenticalProducts.allNames.contains(temporary.name)){
                    continue;
                }
                Thread.sleep(2500);
                Document connectToProduct = Jsoup.connect(temporary.productUrl).userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)").get();
                Element content = connectToProduct.select("span[data-a-size='b'].a-price.a-text-price.a-size-medium span.a-offscreen").first();
                if (content != null) {
                    String price = content.text().replace("$", "").replace(",", ".");
                    temporary.addPrice(Float.parseFloat(price));
                }

                String title = connectToProduct.select("#productTitle").text();

             // if(checkIdenticalProducts.allNames.contains(title)){
             //     temporary = new Product();
             //     continue;
             // }
                //TODO(Razvan) : Trebuie sa fac treaba cu produsele identice sa functioneze
                    temporary.setName(title);
                checkIdenticalProducts.allNames.add(title);
                String rating = connectToProduct.select("span[data-hook='rating-out-of-text']").text().replace(" out of 5", "");
                if (!rating.equals(""))
                    temporary.setRating(Float.parseFloat(rating));
                String description = connectToProduct.select("#feature-bullets").text();
                temporary.setDescription(description);

                Elements details = connectToProduct.select("#prodDetails table");
                if (details.outerHtml().equals("")) {
                    Elements technicalDetails = connectToProduct.select("table.a-bordered");
                    for (Element temp : technicalDetails) {
                        Elements prodInfo = temp.select("tr");
                        for (Element tempTechnicalProd : prodInfo) {
                            String prodSectionEntry = tempTechnicalProd.select("td p strong").text();
                            String prodAttrValue = tempTechnicalProd.select("td p").text();
                            prodAttrValue = prodAttrValue.replaceAll(prodSectionEntry, "");
                            temporary.detailsOfProduct.put(prodSectionEntry, prodAttrValue);
                        }
                    }
                } else {
                    for (Element temp : details) {
                        Elements prodSection = temp.select("tr");
                        for (Element tempProd : prodSection) {
                            String prodSectionEntry = tempProd.select("th.a-color-secondary.a-size-base.prodDetSectionEntry").text();
                            String prodAttrValue = tempProd.select("td.a-size-base.prodDetAttrValue").text();
                            temporary.detailsOfProduct.put(prodSectionEntry, prodAttrValue);
                        }
                    }
                }
                temporary.specifications = mapper.writeValueAsString(temporary.detailsOfProduct);
                String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(temporary);
                System.out.println(json);
            }
            catch (
                    Exception ex) {
                ex.printStackTrace();
            }
        }
    }


    private void TestClass(){
        try {
            for (Product temporary : this.listOfProducts) {
                Document titleconn = Jsoup.connect(temporary.productUrl).userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36").get();
                String ratingElement = titleconn.select("span[data-hook='rating-out-of-text']").text().replace("out of 5", "");
                System.out.println(ratingElement + "    " + temporary.productUrl);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
    private void printProducts(){
        for (Product prod : this.listOfProducts) {
            System.out.println(prod);
        }
    }
}
