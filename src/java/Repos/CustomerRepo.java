
package Repos;

import DBManager.DataBaseManager;
import Entities.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CustomerRepo {
    
        // insert function (register)
    public int register(Customer customer) {
        int r = 0;
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = DataBaseManager.makeConnection();

            stmt = conn.prepareStatement("INSERT INTO Customers (id, first_name, last_name, email, password, car_model) VALUES(CUSTOMERS_SEQ.NEXTVAL,?, ?, ?,?,?)");
            stmt.setString(1, customer.getFirstName());
            stmt.setString(2, customer.getLastName());
            stmt.setString(3, customer.getEmail());
            stmt.setString(4, customer.getPassword());
            stmt.setString(5, customer.getCarModel());

            r = stmt.executeUpdate();
            System.out.println(r);
        } catch (Exception e) {
            r = 0;
        } finally {
            DataBaseManager.closeStatementConnection(stmt);
            DataBaseManager.closeConnection(conn);
        }
        return r;
    }
    //return user data by id 
    public Customer login(String email, String password) {
        Customer user = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DataBaseManager.makeConnection();

            stmt = conn.prepareStatement("SELECT FIRST_NAME ,LAST_NAME,EMAIL,PASSWORD,CAR_MODEL,created_at FROM Customers WHERE email=? and password = ?");
            stmt.setString(1, email);
            stmt.setString(2, password);
            rs = stmt.executeQuery();

            if (rs.next()) {
                user = new Customer();
                user.setEmail(rs.getString("email"));
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setCarModel(rs.getString("car_model"));

            }
        } catch (Exception e) {
            user = null;
        } finally {
            DataBaseManager.closeResultSet(rs);
            DataBaseManager.closeStatementConnection(stmt);
            DataBaseManager.closeConnection(conn);
        }
        return user;
    }
    public Customer getProductByPk(int customerId) {
        Customer user = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DataBaseManager.makeConnection();

            stmt = conn.prepareStatement("SELECT FIRST_NAME ,LAST_NAME,EMAIL,PASSWORD,CAR_MODEL FROM Customers WHERE id=? ");
            stmt.setInt(1, customerId);
            rs = stmt.executeQuery();

            if (rs.next()) {
                user = new Customer();
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setCarModel(rs.getString("CAR_MODEL"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DataBaseManager.closeResultSet(rs);
            DataBaseManager.closeStatementConnection(stmt);
            DataBaseManager.closeConnection(conn);
        }
        return user;
    }


}
