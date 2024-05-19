package Repos;

import DBManager.DataBaseManager;
import Entities.Reservation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReservationRepo {

    public static ArrayList showAllReservations() {
        ArrayList list = new ArrayList();
        Reservation r = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DataBaseManager.makeConnection();

            stmt = conn.prepareStatement("SELECT * FROM RESERVATIONS");
            rs = stmt.executeQuery();

            while (rs.next()) {
                r = new Reservation();
                r.setId(rs.getInt("ID"));
                r.setCustomerId(rs.getInt("CUSTOMER_ID"));
                r.setServiceId(rs.getInt("SERVICE_ID"));
                r.setProductId(rs.getInt("PRODUCT_ID"));
                r.setReservationDate(rs.getTimestamp("RESERVATION_DATE"));
                list.add(r);
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

    public static int insert(Reservation p) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int r = 0;
        try {
            conn = DataBaseManager.makeConnection();

            stmt = conn.prepareStatement("INSERT INTO RESERVATIONS (id,CUSTOMER_ID, SERVICE_ID, PRODUCT_ID) VALUES (?,?,?,?)");

            stmt.setInt(1, p.getId());
            stmt.setInt(2, p.getCustomerId());
            stmt.setInt(3, p.getServiceId());
            stmt.setInt(4, p.getProductId());

            r = stmt.executeUpdate();
            System.out.println(r);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DataBaseManager.closeStatementConnection(stmt);
            DataBaseManager.closeConnection(conn);
        }

        return r;
    }
}
