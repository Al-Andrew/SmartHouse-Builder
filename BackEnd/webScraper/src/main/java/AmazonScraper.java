import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.List;

public class AmazonScraper {
    public final List<Product> listOfProducts;
    public StringBuilder url;


    AmazonScraper(StringBuilder url, List<Product> prod) {
        this.listOfProducts = prod;
        this.url = url;
    }

    public void startScrape(int startPage, int howManyPages) {
        mainScrape(startPage,howManyPages);
        productInformationScrape();
    }

    private void mainScrape(int startPage, int howManyPages){
        for (int i = startPage; i <= howManyPages; i++) {
            this.url.append(i);
            try {
                final Document document = Jsoup.connect(String.valueOf(url)).userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36").get();

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
            this.url.deleteCharAt(url.length() - 1);
        }
    }


    public void oneProductInformationScrape(Product prod) throws IOException {
        Document connectToProduct = Jsoup.connect(prod.productUrl).userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36").get();
        Elements details = connectToProduct.select("#prodDetails table");
        if (details.outerHtml().equals("")) {
            Elements technicalDetails = connectToProduct.select("table.a-bordered");
            for (Element temp : technicalDetails) {
                Elements prodInfo = temp.select("tr");
                for (Element tempTechnicalProd : prodInfo) {
                    String prodSectionEntry = tempTechnicalProd.select("td p strong").text();
                    String prodAttrValue = tempTechnicalProd.select("td p").text();
                    prodAttrValue = prodAttrValue.replaceAll(prodSectionEntry, "");
                    prod.detailsOfProduct.put(prodSectionEntry, prodAttrValue);

                }
            }
        }
        else{
            for (Element temp : details){
                Elements prodSection =  temp.select("tr");
                for(Element tempProd : prodSection){
                    String prodSectionEntry = tempProd.select("th.a-color-secondary.a-size-base.prodDetSectionEntry").text();
                    String prodAttrValue = tempProd.select("td.a-size-base.prodDetAttrValue").text();
                    prod.detailsOfProduct.put(prodSectionEntry, prodAttrValue);
                }
            }
        }
    }

    private void productInformationScrape(){
        try {
            for (Product temporary : this.listOfProducts) {
                Document connectToProduct = Jsoup.connect(temporary.productUrl).userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36").get();
                Elements contents = connectToProduct.select("div.a-box-inner");
                for (Element e : contents) {
                    Element price = e.select("div.a-section.a-spacing-micro span.a-offscreen").first();
                    if (price == null)
                        continue;
                    temporary.addPrice(Float.parseFloat(price.text().replace("$","").replace(",", "")));
                }

                //String rating = connectToProduct.select("span.a-size-medium.a-color-base").first().text();
                String description = connectToProduct.select("ul.a-unordered-list.a-vertical.a-spacing-mini li").text();

                temporary.setDescription(description);
               // System.out.println(temporary.productUrl);
               // System.out.println(rating.replace(" out of 5", "").replaceAll("[^\\d.]", ""));
               // temporary.setRating(Float.parseFloat(rating.replace(" out of 5", "").replaceAll("[^\\d.]", "")));

                //TOTO(Razvan): Trebuie facut ratingul !!!!
                Elements details = connectToProduct.select("#prodDetails table");
                if(details.outerHtml().equals("")){
                    Elements technicalDetails = connectToProduct.select("table.a-bordered");
                    for(Element temp : technicalDetails){
                        Elements prodInfo = temp.select("tr");
                        for(Element tempTechnicalProd : prodInfo){
                            String prodSectionEntry = tempTechnicalProd.select("td p strong").text();
                            String prodAttrValue = tempTechnicalProd.select("td p").text();
                            prodAttrValue = prodAttrValue.replaceAll(prodSectionEntry, "");
                            temporary.detailsOfProduct.put(prodSectionEntry,prodAttrValue);
                        }
                    }
                }
                else{
                    for (Element temp : details){
                        Elements prodSection =  temp.select("tr");
                        for(Element tempProd : prodSection){
                            String prodSectionEntry = tempProd.select("th.a-color-secondary.a-size-base.prodDetSectionEntry").text();
                            String prodAttrValue = tempProd.select("td.a-size-base.prodDetAttrValue").text();
                            temporary.detailsOfProduct.put(prodSectionEntry,prodAttrValue);
                        }
                    }
                }
            }
        } catch (
                Exception ex) {
            ex.printStackTrace();
        }
    }
    private void printProducts(){
        for (Product prod : this.listOfProducts) {
            System.out.println(prod);
        }
    }
}


