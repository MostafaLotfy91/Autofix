package DBManager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Mostafa Lotfy
 */
public class DataBaseManager {

    // The Connection To Data base Method [1-load driver - connection]
    public static Connection makeConnection() throws ClassNotFoundException, SQLException {
        String jdbc = "jdbc:oracle:thin:@localhost:1521:XE";
        String user = "Autofix";
        String pass = "autofix";

        Class.forName("oracle.jdbc.OracleDriver"); //Oracle Driver 
        Connection conn = DriverManager.getConnection(jdbc, user, pass);//Database Url
        return conn;

    }

    // close stmt 
    public static void closeStatementConnection(PreparedStatement stmt) {
        try {
            stmt.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    // close ResultSet
    public static void closeResultSet(ResultSet rs) {
        try {
            rs.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    //close connection
    public static void closeConnection(Connection conn) {
        try {
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
