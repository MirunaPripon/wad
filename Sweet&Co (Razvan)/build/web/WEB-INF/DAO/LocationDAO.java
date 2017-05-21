/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import connection.DataBase;

import domain.Location;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LocationDAO {
    private Connection conn;
    private static LocationDAO instance;
    
    public static LocationDAO getInstance() {
        if (instance == null) {
            instance = new LocationDAO();
        }
        return instance;
    }
    
    public LocationDAO(){
        
    };
    
    public ArrayList<Location> getLocations() {
        conn=DataBase.getConnection();
        AddressDAO addressDao = AddressDAO.getInstance();
        ArrayList<Location> locations = new ArrayList<Location>();
        try {
            PreparedStatement prepStmt = conn.prepareStatement("SELECT  * from locations WHERE id > 1");
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                locations.add(new Location(addressDao.getAddressById(Integer.parseInt(rs.getString("address_id"))), rs.getString("description"),rs.getString("img"),rs.getString("name"),rs.getString("phoneNo")));           
            }
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return locations;
    }
    
    public boolean insertLocation( String description, String img, String name, String phoneNo){
        try {
            conn = DataBase.getConnection();
            PreparedStatement prep = conn.prepareStatement("SELECT id FROM addresses GROUP BY id DESC LIMIT 1;");
            ResultSet rs = prep.executeQuery();
            rs.next();
            PreparedStatement prep1 = conn.prepareStatement("INSERT INTO locations VALUES (default, ?, ?, ?, ?, ?);");
            prep1.setInt(1, rs.getInt("id"));
            prep1.setString(2,description);
            prep1.setString(3, img);
            prep1.setString(4, name);
            prep1.setString(5, phoneNo);
            prep1.executeUpdate();
            conn.commit();
            
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(LocationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
}
