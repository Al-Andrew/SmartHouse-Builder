package WebScraper.demo;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
public class ScriptApplication {

	public static void main(String[] args) {
		SpringApplication.run(ScriptApplication.class, args);
		
		// JUST AMAZON -> 7 pages of smart home products
		for(int i = 1; i<=7;i++) {
			StringBuilder url = new StringBuilder("https://www.amazon.com/s?k=smart+home+devices&page=");
			url.append(i);

			try {
				final Document document = Jsoup.connect(String.valueOf(url)).userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36").get();


				Elements content = document.select("div.a-section.aok-relative.s-image-square-aspect");

				for (Element e : content) {

					String nameProduct = e.select("img").attr("alt");
					String img = e.select("img").attr("src");
					System.out.println(nameProduct + " [link to png]-> " + img);
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			url.deleteCharAt(url.length()-1);
		}
	}

}
