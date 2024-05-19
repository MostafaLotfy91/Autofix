
package Repos;

import DBManager.DataBaseManager;
import Entities.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductRepo {
    // select by fk 
    public Product getProductByPk(int productId) {
        Product p = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DataBaseManager.makeConnection();

            stmt = conn.prepareStatement("SELECT id,name, price, image FROM PRODUCTS where id = ?");
            stmt.setInt(1, productId);
            rs = stmt.executeQuery();

            if (rs.next()) {
                p = new Product();
                p.setProductId(rs.getInt("id"));
                p.setProductName(rs.getString("name"));
                p.setProductPrice(rs.getInt("price"));
                p.setImage(rs.getString("image"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DataBaseManager.closeResultSet(rs);
            DataBaseManager.closeStatementConnection(stmt);
            DataBaseManager.closeConnection(conn);
        }
        return p;
    }

     public static ArrayList showAllProducts() {
        ArrayList list = new ArrayList();
        Product p = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DataBaseManager.makeConnection();

            stmt = conn.prepareStatement("SELECT ID,NAME, PRICE, image FROM PRODUCTS ");
            rs = stmt.executeQuery();

            while (rs.next()) {
                p = new Product();
                p.setProductId(rs.getInt("ID"));
                p.setProductName(rs.getString("NAME"));
                p.setProductPrice(rs.getInt("PRICE"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (Exception e) {
            list = null;
        } finally {
            DataBaseManager.closeResultSet(rs);
            DataBaseManager.closeStatementConnection(stmt);
            DataBaseManager.closeConnection(conn);
        }
        return list;

    }
}
