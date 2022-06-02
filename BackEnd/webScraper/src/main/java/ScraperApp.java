
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.*;

public class ScraperApp {
    public static void main(String[] args) {
        try {
            Set<Product> setOfProducts = new HashSet<>();

            List<String> categories = new ArrayList<>(
                    List.of("Home Appliances")
            );

            AmazonScraper Scraper = new AmazonScraper(new StringBuilder("https://www.amazon.com/s?k=home+smart+`"), setOfProducts);

            for (String category : categories) {
                Scraper.setUrl(new StringBuilder("https://www.amazon.com/s?k=smart+home+"));
                Scraper.setCategory(category);
                Scraper.getUrl().append(category);

                System.out.println(Scraper.getUrl());

                Scraper.startScrape();

            }

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

    public static void changeFormatOfSize(Map<String, String> details) throws JsonProcessingException {
        String packageDimensions;
        ObjectMapper mapper = new ObjectMapper();

        if (details.containsKey("Product Dimensions")) {
            packageDimensions = details.get("Product Dimensions");
            details.remove("Product Dimensions");
        }
        else if (details.containsKey("Package Dimensions")) {
            packageDimensions = details.get("Package Dimensions");
            details.remove("Package Dimensions");
        }
        else {
            List<Float> result = new ArrayList<>();
            for (int i=0 ; i<3; ++i)
                result.add((float) 0);
            details.remove("Size");
            details.put("Size", mapper.writeValueAsString(result));
            mapper.writeValueAsString(result);
            return;
        }

        packageDimensions = packageDimensions.replace("inches", "");
        packageDimensions = packageDimensions.replace(" ", "");
        packageDimensions = packageDimensions.replaceAll("[^\\x00-\\x7F]", "");
        packageDimensions = packageDimensions.replaceAll("[\\p{Cntrl}&&[^\r\n\t]]", "");
        packageDimensions = packageDimensions.replaceAll("\\p{C}", "");

        List<String> temp = List.of(packageDimensions.split("x"));
        List<Float> result = new ArrayList<>();

        for (String dims : temp) {
            try {
                float tempFloat = Float.parseFloat(dims);
                result.add(tempFloat);
            }
            catch (NumberFormatException ex) {
                List<Float> badResult = new ArrayList<>();
                for (int i=0 ; i<3; ++i)
                    badResult.add((float) 0);
                details.put("Size", mapper.writeValueAsString(result));
                mapper.writeValueAsString(badResult);
                return;
            }
        }
        details.put("Size", mapper.writeValueAsString(result));
        mapper.writeValueAsString(result);
    }
}
