import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = null;
    private static final String USER = null;
    private static final String PASSWORD = null;
    private static Connection conn;

    public static Connection createconnection() {
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
        return conn;
    }

    public static Connection getConnection() {
        return conn;
    }


}
