import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.*;

public class DatabaseConnection {
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String USER = "PROGAVAN";
    private static final String PASSWORD = "PROGAVAN";
    private static Connection conn;

    public static void createconnection() {
        //this.dbURL = System.getenv("DB_URL_SECRET");
        //this.user = System.getenv("DB_USER_SECRET");
        //this.pass = System.getenv("DB_PASS_SECRET");

        try {
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            if (conn != null) {
                DatabaseMetaData dm = conn.getMetaData();
                System.out.println("Driver name: " + dm.getDriverName());
                System.out.println("Driver version: " + dm.getDriverVersion());
                System.out.println("Product name: " + dm.getDatabaseProductName());
                System.out.println("Product version: " + dm.getDatabaseProductVersion());
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static Connection getConnection() {
        return conn;
    }


}
