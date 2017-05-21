/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import connection.DataBase;
import domain.Booking;
import domain.Table;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TableDAO {

    private Connection conn;
    private static TableDAO instance;

    public static TableDAO getInstance() {
        if (instance == null) {
            instance = new TableDAO();
        }
        return instance;
    }

    public TableDAO() {

    }

    ;
    
    public boolean addTable(int tableNo, int available, int noOfSeats) {
        conn = DataBase.getConnection();
        try {
            PreparedStatement statement = conn.prepareStatement("insert into tables values (default, ?, ?, ?)");
            statement.setInt(1, tableNo);
            statement.setInt(2, available);
            statement.setInt(3, noOfSeats);

            statement.executeUpdate();
            conn.commit();
            return true;

        } catch (SQLException ex) {
            Logger.getLogger(FoodDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }
    
    public ArrayList<Table> getAvailableTables(){
        conn=DataBase.getConnection();
        ArrayList<Table> tables = new ArrayList<>();
        try {
            PreparedStatement prepStmt = conn.prepareStatement("SELECT * FROM tables WHERE available = 1");
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                tables.add(new Table(Integer.parseInt(rs.getString("tableNo")),(1==(Integer.parseInt(rs.getString("available")))), Integer.parseInt(rs.getString("noOfSeats"))));
            }
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return tables;
    }
    
    public void occupyTable(int tableNo) throws SQLException{
        conn=DataBase.getConnection();
        PreparedStatement prepStmt = conn.prepareStatement("UPDATE tables SET available = 0 WHERE tableNo = ?");
        prepStmt.setInt(1, tableNo);
        prepStmt.executeUpdate();
        conn.commit();
    }
    
    public boolean tableExists(int tableNo) throws SQLException{
        conn=DataBase.getConnection();
        PreparedStatement statement = conn.prepareStatement("SELECT * FROM tables where tableNo = ?");
        statement.setInt(1,tableNo);
        ResultSet rs = statement.executeQuery();
        if (rs.next()){
            rs.close();
            return true;
        }
        return false;
    }
    
    public Table getTableById(int id) throws SQLException{
        conn = DataBase.getConnection();
        Table t = new Table();
        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM tables WHERE tableNo = ? ");
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        if(rs.next()){
            t.setTableNo(Integer.parseInt(rs.getString("tableNo")));
            t.setNoOfSeats(Integer.parseInt(rs.getString("noOfSeats")));
        }
        return t;
        
    
    }
    
    public Integer getTableId(int tableNo) throws SQLException {
        int id = -1;
        conn = DataBase.getConnection();
        PreparedStatement statement = conn.prepareStatement("SELECT * FROM tables where tableNo = ?");
        statement.setString(1, String.valueOf(tableNo));
        ResultSet rs = statement.executeQuery();
        if (rs.next()) {
            id = rs.getInt("id");
        }

        return id;
    }
    
    
    public void insertUser_Table(String uname, String date, String time, int tableNo) throws SQLException{
        conn=DataBase.getConnection();
        int user_id = new UserDAO().getUserId(uname);
        int table_id = getTableId(tableNo);
        PreparedStatement statement1 = conn.prepareStatement("INSERT INTO user_table VALUES(default,?,?,?,?)");
        statement1.setString(1,Integer.toString(user_id));
        statement1.setString(2,Integer.toString(table_id));
        statement1.setString(3,date);
        statement1.setString(4,time);
        statement1.executeUpdate();
        conn.commit();
    }
    
    public ArrayList<Booking> getUserBookings(String username) throws SQLException{
        conn = DataBase.getConnection();
        int user_id = new UserDAO().getUserId(username);
        ArrayList<Booking> bookings = new ArrayList<Booking>();
        PreparedStatement statement = conn.prepareStatement("SELECT * from user_table where user_id = ?");
        statement.setInt(1, user_id);
        ResultSet rs = statement.executeQuery();
        while(rs.next()){
        bookings.add(new Booking(rs.getString("dateM"),rs.getString("time"), getTableById(Integer.parseInt(rs.getString("table_id")))));
        }
        return bookings;
    
    
    }
}