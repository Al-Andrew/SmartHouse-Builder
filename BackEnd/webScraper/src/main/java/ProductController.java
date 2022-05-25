import java.util.*;
import java.sql.*;
import java.sql.SQLException;

public class ProductController  {
    public void create(String name, String linkPNG, String linkProduct, String price, String sizeofprod, Map<String, String> details) throws SQLException {
        int idul = 0;
        idul = idul * 10 + name.charAt(0)-'A';
        idul = idul * 10 + name.charAt(1)-'A';
        idul = idul * 10 + name.charAt(2)-'A';
        String id = Integer.toString(idul);
        Connection con = DatabaseConnection.getConnection();

        PreparedStatement pstate = con.prepareStatement("DELETE FROM continents WHERE id = '" + id + "'");
        pstate.executeUpdate();

        try(PreparedStatement state = con.prepareStatement("INSERT INTO products  (id, name, linkpng, linkproduct, price, sizeofprod) VALUES ('" + id + "','" + name + "','" + linkPNG + "','" + linkProduct + "','" + price + "','" + sizeofprod + "')")){
            state.executeUpdate();
        }
        catch (SQLException e) {
            System.out.println(e);
        }

    }

}
