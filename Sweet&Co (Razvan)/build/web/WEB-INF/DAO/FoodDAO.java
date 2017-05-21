/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import connection.DataBase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import domain.Food;

public class FoodDAO {
    private Connection conn;
    private static FoodDAO instance;
    
    public static FoodDAO getInstance() {
        if (instance == null) {
            instance = new FoodDAO();
        }
        return instance;
    }
    
    public FoodDAO(){
        
    };
    
    public boolean insertFood(String name, String type, String description, int quantity, double price, String img){
        conn = DataBase.getConnection();
        try {
            PreparedStatement statement = conn.prepareStatement("insert into foods values (default, ?, ?, ?, ? ,?, ?)");
            statement.setString(1, name);
            statement.setString(2, type);
            statement.setString(3, description);
            statement.setInt(4, quantity);
            statement.setDouble(5, price);
            statement.setString(6, img);
            if(!foodExists(name)){
                statement.executeUpdate();
                conn.commit();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(FoodDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    return false;
    }
    
    public boolean foodExists(String foodname) throws SQLException{
    conn=DataBase.getConnection();
        PreparedStatement statement = conn.prepareStatement("SELECT * FROM foods where name = ?");
        statement.setString(1,foodname);
        ResultSet rs = statement.executeQuery();
        if (rs.next()){
            rs.close();
            return true;
        }
        return false;
    }
    
    public int getFoodId(String foodname) throws SQLException{
        conn=DataBase.getConnection();
        PreparedStatement statement = conn.prepareStatement("SELECT * FROM foods where name = ?");
        statement.setString(1,foodname);
        ResultSet rs = statement.executeQuery();
        if (rs.next()){
            return rs.getInt("id");
        }
        rs.close();
        return -1;
    }
    
    public ArrayList<Food> getFoods() {
        conn=DataBase.getConnection();
        ArrayList<Food> foods = new ArrayList<>();
        try {
            PreparedStatement prepStmt = conn.prepareStatement("select  * from foods");
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                foods.add(new Food(rs.getString("name"), rs.getString("type"), rs.getString("description"),rs.getString("img"), (float) Double.parseDouble(rs.getString("price")),  Integer.parseInt(rs.getString("quantity"))));
            }
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return foods;
    }
    
    public ArrayList<Food> getFoodsByType(String type) {
        conn=DataBase.getConnection();
        ArrayList<Food> foods = new ArrayList<>();
        try {
            PreparedStatement prepStmt = conn.prepareStatement("SELECT * FROM foods WHERE type = ?");
            prepStmt.setString(1, type);
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getString("name"));
                foods.add(new Food(rs.getString("name"), rs.getString("type"), rs.getString("description"),rs.getString("img"), (float) Double.parseDouble(rs.getString("price")),  Integer.parseInt(rs.getString("quantity"))));
            }
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return foods;
    }
    
    public void deleteFood(String foodName) throws SQLException{
        conn=DataBase.getConnection();
        PreparedStatement statement = conn.prepareStatement("DELETE FROM foods WHERE name = ?");
        statement.setString(1,foodName);
        statement.executeUpdate();
        conn.commit();
    }
}

