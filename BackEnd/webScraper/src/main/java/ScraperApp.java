
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class ScraperApp {

    public static void main(String[] args) throws IOException {
        List<Product> listOfProducts = new ArrayList<>();
        List<String> ecosystem = new LinkedList<>();

        String urlJson = "C:\\Users\\Razvan-PC\\Desktop\\webScraper\\src\\main\\Json\\products.json";

        AmazonScraper Scraper = new AmazonScraper(new StringBuilder("https://www.amazon.com/s?k=smart+home+devices&page="), listOfProducts);
        Scraper.startScrape(1);
        for(Product temp : listOfProducts){
            Scraper.oneProductInformationScrape(temp);
            String nume = temp.name;
            temp.ecosystem = temp.ecosystems(temp.name);
            System.out.println(temp);
            System.out.println();
            System.out.println();
        }

    }
}
