
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.*;

public class ScraperApp {
    @JsonProperty
    public Set<String> allNames = new HashSet<>();

    public static void main(String[] args) throws Exception {
        try {

            ScraperApp checkIdenticalProducts = new ScraperApp();
            List<Product> listOfProducts = new ArrayList<>();


            ObjectMapper mapper = new ObjectMapper();


            AmazonScraper Scraper = new AmazonScraper(new StringBuilder("https://www.amazon.com/s?k=smart+home+devices&page="), listOfProducts, checkIdenticalProducts);
            Scraper.startScrape(3, 3);
            Scraper.startScrape(4, 4);
            Scraper.startScrape(5, 5);
            Scraper.startScrape(6, 6);
            Scraper.startScrape(7, 7);

            for (Product temp : listOfProducts) {
                if (!Objects.equals(temp.name, "") && temp.name != null)
                    temp.detailsOfProduct.put("ecosystem", temp.ecosystems(temp.name));
                else
                    continue;

                changeFormatOfSize(temp.detailsOfProduct);
                System.out.println("\n\n\n\n\n\n" + temp.detailsOfProduct.get("Size") + "\n\n\n\n\n\n");
                temp.specifications = mapper.writeValueAsString(temp.detailsOfProduct);
                System.out.println(mapper.writerWithDefaultPrettyPrinter().writeValueAsString(temp));
                String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(temp);
                post("https://smart-house-builder.azurewebsites.net/api/products/add", json);
                System.out.println();
                System.out.println();
            }
            // SAVE
           //mapper.writeValue(new File("C:\\Users\\Razvan-PC\\Desktop\\webScraper\\src\\main\\ASIN\\Asin.json"), checkIdenticalProducts.allNames);
           //System.out.println(checkIdenticalProducts.allNames);

            // LOAD
            //checkIdenticalProducts.Asin = mapper.readValue(new File("C:\\Users\\Razvan-PC\\Desktop\\webScraper\\src\\main\\ASIN\\Asin.json"), Set.class);
            // System.out.println(checkIdenticalProducts.Asin);

        } catch (Exception ex) {
            ex.printStackTrace();
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

    public static void changeFormatOfSize(Map<String, String> details){
        if(details.containsKey("Size") && details.containsKey("Product Dimensions"))
        {
            String sizeReformat = details.get("Product Dimensions");
            sizeReformat = sizeReformat.replaceAll(" x", ",");
            sizeReformat = sizeReformat.replace("inches", "");
            System.out.println("AICI");
            StringBuilder finalFormat = new StringBuilder("[");

            finalFormat.append(sizeReformat);
            finalFormat.append(']');

            details.put("Size", String.valueOf(finalFormat));
            details.remove("Product Dimensions");
        }
        else if(details.containsKey("Size") && !details.containsKey("Product Dimensions")){
            String sizeReformat = details.get("Size");
            int index;
            System.out.println("AiCi");
            sizeReformat = sizeReformat.replaceAll("”", "");
            sizeReformat = sizeReformat.replaceAll(" x", ",");
            sizeReformat = sizeReformat.replaceAll("[a-z*]", "");
            StringBuilder finalFormat = new StringBuilder("[ ");
            if(sizeReformat.contains("(")) {
                index = sizeReformat.lastIndexOf('(') - 1;
            }
            else{

                finalFormat.append(sizeReformat);
            }
            if(finalFormat.charAt(finalFormat.length()-1) != ' ')
            finalFormat.append(" ]");
            else
                finalFormat.append("]");

            details.put("Size", String.valueOf(finalFormat));
        }
        else if(!details.containsKey("Size") && details.containsKey("Product Dimensions"))
        {
            String sizeReformat = details.get("Product Dimensions");
            sizeReformat = sizeReformat.replaceAll(" x", ",");
            sizeReformat = sizeReformat.replace("inches", "");
            System.out.println("AiCisa");
            StringBuilder finalFormat = new StringBuilder("[ ");

            finalFormat.append(sizeReformat);
            finalFormat.append(']');

            details.put("Size", String.valueOf(finalFormat));
            details.remove("Product Dimensions");
        }
        else if(details.containsKey("Package Dimensions")){
            String sizeReformat = details.get("Package Dimensions");
            sizeReformat = sizeReformat.replaceAll(" x", ",");
            StringBuilder finalFormat = new StringBuilder("[ ");
            finalFormat.append(sizeReformat.substring(0,sizeReformat.lastIndexOf('i')));
            finalFormat.append(']');
            System.out.println("AiCisasa");
            details.put("Size", String.valueOf(finalFormat));
            details.remove("Package Dimensions");
        }
        else
            details.put("Size", "[ 2.0, 2.0, 2.0 ]");

    }
}
