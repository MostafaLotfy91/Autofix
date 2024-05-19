package Repos;

import DBManager.DataBaseManager;
import Entities.Services;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ServicesRepo {

    public static ArrayList showAllServices() {
        ArrayList list = new ArrayList();
        Services s = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DataBaseManager.makeConnection();

            stmt = conn.prepareStatement("SELECT ID,NAME, PRICE, image ,HTML_PAGE FROM SERVICES ");
            rs = stmt.executeQuery();

            while (rs.next()) {
                s = new Services();
                s.setServicesId(rs.getInt("id"));
                s.setServicesName(rs.getString("name"));
                s.setServicesPrice(rs.getInt("price"));
                s.setImage(rs.getString("image"));
                s.setHtmlPage(rs.getString("html_page"));
                list.add(s);
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

    public Services getServicesByPk(int servicesId) {
        Services s = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DataBaseManager.makeConnection();

            stmt = conn.prepareStatement("SELECT id,name, price, image,html_page FROM Services where id = ?");
            stmt.setInt(1, servicesId);
            rs = stmt.executeQuery();

            if (rs.next()) {
                s = new Services();
                s.setServicesId(rs.getInt("id"));
                s.setServicesName(rs.getString("name"));
                s.setServicesPrice(rs.getInt("price"));
                s.setImage(rs.getString("image"));
                s.setHtmlPage(rs.getString("html_page"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DataBaseManager.closeResultSet(rs);
            DataBaseManager.closeStatementConnection(stmt);
            DataBaseManager.closeConnection(conn);
        }
        return s;
    }

}
