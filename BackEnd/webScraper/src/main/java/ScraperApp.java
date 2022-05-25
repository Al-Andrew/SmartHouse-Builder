
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
public class ScraperApp {

    public static void main(String[] args) throws Exception {
        List<Product> listOfProducts = new ArrayList<>();

        ObjectMapper mapper = new ObjectMapper();

        String urlJson = "C:\\Users\\Razvan-PC\\Desktop\\webScraper\\src\\main\\Json\\products.json";

        AmazonScraper Scraper = new AmazonScraper(new StringBuilder("https://www.amazon.com/s?k=smart+home+devices&page="), listOfProducts);
        Scraper.startScrape(2, 7);

        for (Product temp : listOfProducts) {
            temp.detailsOfProduct.put("ecosystem", temp.ecosystems(temp.name));
            temp.specifications = mapper.writeValueAsString(temp.detailsOfProduct);
            System.out.println(mapper.writerWithDefaultPrettyPrinter().writeValueAsString(temp));
            String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(temp);
            post("https://smart-house-builder.azurewebsites.net/api/products/add", json);
            System.out.println();
            System.out.println();
        }



    }

    public static void post(String url, String json) throws Exception {
        String charset = "UTF-8";
        URLConnection connection = new URL(url).openConnection();
        connection.setDoOutput(true); // Triggers POST.
        connection.setRequestProperty("Accept-Charset", charset);
        connection.setRequestProperty("Content-Type", "application/json;charset=" + charset);

        try (OutputStream output = connection.getOutputStream()) {
            output.write(json.getBytes(charset));
        }

        InputStream response = connection.getInputStream();
    }
}
