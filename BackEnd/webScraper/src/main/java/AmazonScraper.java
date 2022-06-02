import com.fasterxml.jackson.databind.ObjectMapper;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.*;

public class AmazonScraper {

    public final Set<Product> totalSetOfProducts;
    public  Set<Product> currentSet;
    private StringBuilder url;
    public String category;

    public void setCategory(String category) {
        this.category = category;
    }
    public StringBuilder getUrl() {
        return url;
    }
    public void setUrl(StringBuilder url) {
        this.url = url;
    }

    AmazonScraper(StringBuilder url, Set<Product> prod) {
        this.totalSetOfProducts = prod;
        this.url = url;
    }

    public void startScrape() {
        mainScrape();
        productInformationScrape();
    }

    private void mainScrape() {
        try {
            currentSet = new HashSet<>();
            Thread.sleep(5000);
            Connection conn = Jsoup.connect(String.valueOf(url)).userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.63 Safari/537.36").referrer("https://www.google.ro/");
            Document document = conn.get();
            Elements content;
            content = document.select("div.sg-col-inner");
            for (Element e : content) {
                String img = e.select("img").attr("src");
                String link = "https://amazon.com" + e.select("a.a-link-normal.s-no-outline").attr("href");
                Product currentProduct = new Product(img, link, category);
                if(totalSetOfProducts.add(currentProduct))
                    currentSet.add(currentProduct);
            }
        } catch (Exception ex){
            ex.printStackTrace();
        }
    }

    private void productInformationScrape() {
        for (Product temporary : this.currentSet) {
            try {
                ObjectMapper mapper = new ObjectMapper();
                Thread.sleep(5000);
                Connection connect = Jsoup.connect(temporary.productUrl).userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.63 Safari/537.36").referrer("https://www.google.ro/");
                Document connectToProduct = connect.get();
                Element content = connectToProduct.select("span[data-a-size='b'].a-price.a-text-price.a-size-medium span.a-offscreen").first();
                temporary.setCategory(category);
                if (content != null) {
                    String price = content.text().replace("$", "").replace(",", ".");
                    System.out.println(price);
                    temporary.addPrice(Float.parseFloat(price));
                }

                if (temporary.price == null) {
                    continue;
                }

                String title = connectToProduct.select("#productTitle").text();

                temporary.setName(title);
                System.out.println(temporary.name);
                if (temporary.name == null) {
                    continue;
                }

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

                temporary.detailsOfProduct.put("ecosystem", mapper.writeValueAsString(temporary.getEcosystems(temporary.name)));

                ScraperApp.changeFormatOfSize(temporary.detailsOfProduct);

                temporary.specifications = mapper.writeValueAsString(temporary.detailsOfProduct);
                String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(temporary);
                ScraperApp.post("https://smart-house-builder.azurewebsites.net/api/products/add", json);

            } catch (
                    Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
