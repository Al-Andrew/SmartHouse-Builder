import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.File;
import java.io.IOException;


public class ProductUtil {
    public static void save (AllProducts product, String path) throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();

        objectMapper.writeValue(new File(path),product);
    }

    public static AllProducts load(String path) throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();

        return objectMapper.readValue(new File(path),AllProducts.class);
    }
}
