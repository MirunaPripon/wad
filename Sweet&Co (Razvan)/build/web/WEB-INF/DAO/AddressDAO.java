/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import connection.DataBase;
import connection.Hash;
import domain.Address;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AddressDAO {
    private Connection conn;
    private static AddressDAO instance;
    
    public static AddressDAO getInstance() {
        if (instance == null) {
            instance = new AddressDAO();
        }
        return instance;
    }
    
    public AddressDAO(){
        
    };
    
    
    
    public boolean insertAddress(String city, int district, String street, int no, int zip, int floorN, int apt, String bell){
        conn = DataBase.getConnection();
        try {
            PreparedStatement statement = conn.prepareStatement("insert into addresses values (default, ?, ?, ?, ? , ?, ?, ?, ?)");
            statement.setString(1,city);
            statement.setString(2,Integer.toString(district));
            statement.setString(3,street);
            statement.setString(4,Integer.toString(no));
            statement.setString(5,Integer.toString(zip));
            statement.setString(6,Integer.toString(floorN));
            statement.setString(7,Integer.toString(apt));
            statement.setString(8,bell);
            if(!existsAddress(city, street, no)){
                statement.executeUpdate();
                conn.commit();
                return true;
            }
            
                
        } catch (SQLException ex) {
            Logger.getLogger(AddressDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
    }
    
    public boolean existsAddress(String city, String street, int no) throws SQLException{
        conn=DataBase.getConnection();
        PreparedStatement statement = conn.prepareStatement("SELECT * FROM addresses WHERE city = ? AND street = ? AND no = ?");
        statement.setString(1, city);
        statement.setString(2, street);
        statement.setString(3, Integer.toString(no));
        ResultSet rs = statement.executeQuery();
        if (rs.next()){
            rs.close();
            return true;
        }
        return false;
    }
    
    public void mapUser_Address(String username) throws SQLException{
        conn=DataBase.getConnection();
        int user_id = new UserDAO().getUserId(username);
        PreparedStatement statement = conn.prepareStatement("SELECT id FROM addresses GROUP BY id DESC LIMIT 1");
        ResultSet rs = statement.executeQuery();
        rs = statement.executeQuery();
        rs.next();
        int address_id = rs.getInt("id");
        rs.close();
        PreparedStatement statement1 = conn.prepareStatement("INSERT INTO user_address VALUES(default,?,?)");
        statement1.setString(1,Integer.toString(address_id));
        statement1.setString(2,Integer.toString(user_id));
        statement1.executeUpdate();
        conn.commit();
    }
    
    public ArrayList<Address> getUserAddresses(String username) throws SQLException{
        conn = DataBase.getConnection();
        int user_id = new UserDAO().getUserId(username);
        ArrayList<Address> addresses = new ArrayList<Address>();
        PreparedStatement statement = conn.prepareStatement("SELECT * FROM addresses WHERE id IN (SELECT address_id FROM user_address WHERE user_id = ?)");
        statement.setInt(1, user_id);
        ResultSet rs = statement.executeQuery();
        while(rs.next()){
            Address add = new Address();
            add.setCity(rs.getString("city"));
            add.setStreet(rs.getString("street"));
            add.setBell(rs.getString("bell"));
            add.setDistrict(Integer.parseInt(rs.getString("district")));
            add.setNo(Integer.parseInt(rs.getString("no")));
            add.setZip(Integer.parseInt(rs.getString("zip")));
            add.setFloorN(Integer.parseInt(rs.getString("floorN")));
            add.setApt(Integer.parseInt(rs.getString("apt")));
            addresses.add(add);
        }
        return addresses;
    }
    
    public Address getAddressById(int id) throws SQLException{
        conn = DataBase.getConnection();
        Address add = new Address();
        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM addresses WHERE id = ? ");
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        if(rs.next()){
            add.setCity(rs.getString("city"));
            add.setStreet(rs.getString("street"));
            add.setBell(rs.getString("bell"));
            add.setDistrict(rs.getInt("district"));
            add.setNo(Integer.parseInt(rs.getString("no")));
            add.setZip(Integer.parseInt(rs.getString("zip")));
            add.setFloorN(rs.getInt("floorN"));
            add.setApt(rs.getInt("apt"));
        }
        return add;
    }
  

    public boolean insertAddress(String city, String street, int no, int zip) {
        conn = DataBase.getConnection();
        try {
            PreparedStatement statement = conn.prepareStatement("insert into addresses values (default, ?, ?, ?, ? , ?, ?, ?, ?)");
            statement.setString(1,city);
            statement.setString(2,null);
            statement.setString(3,street);
            statement.setString(4,Integer.toString(no));
            statement.setString(5,Integer.toString(zip));
            statement.setString(6,null);
            statement.setString(7,null);
            statement.setString(8,null);
            if(!existsAddress(city, street, no)){
                statement.executeUpdate();
                conn.commit();
                return true;
            }
            
                
        } catch (SQLException ex) {
            Logger.getLogger(AddressDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
        
    }
    
    public int getAddressID(String city, String street, int no){
        conn = DataBase.getConnection();
        int id = -1;
        try {
            PreparedStatement statement = conn.prepareStatement("SELECT id FROM addresses WHERE city = ? AND street = ? AND no = ?");
            statement.setString(1,city);
            statement.setString(2,street);
            statement.setInt(3, no);
            ResultSet rs = statement.executeQuery();
            rs.next();
            id=rs.getInt("id");
        } catch (SQLException ex) {
            Logger.getLogger(AddressDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    
    }

}
