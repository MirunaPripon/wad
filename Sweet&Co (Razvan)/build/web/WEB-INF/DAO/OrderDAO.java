/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import connection.DataBase;
import domain.Address;
import domain.Food;
import domain.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrderDAO {
     private Connection conn;
    private static OrderDAO instance;
    UserDAO userDAO = new UserDAO();
    FoodDAO foodDAO = new FoodDAO();
    public static OrderDAO getInstance() {
        if (instance == null) {
            instance = new OrderDAO();
        }
        return instance;
    }
    
    public OrderDAO(){
        
    };
    
    public void insertOrder(String username, int addressId, double totalPrice) throws SQLException{
        conn = DataBase.getConnection();
        int userId = userDAO.getUserId(username);
        PreparedStatement statement = conn.prepareStatement("INSERT INTO orders VALUES(default, ?, ?, ?)");
        statement.setInt(1, addressId);
        statement.setInt(2, userId);
        statement.setDouble(3, totalPrice);
        statement.executeUpdate();
        conn.commit();
    }
    
    public void mapFood_Order(ArrayList<Food> foods) throws SQLException{
        conn=DataBase.getConnection();
        PreparedStatement statement = conn.prepareStatement("SELECT id FROM orders GROUP BY id DESC LIMIT 1");
        ResultSet rs = statement.executeQuery();
        rs.next();
        int orderId = rs.getInt("id");
        rs.close();
        for(Food f : foods){
            PreparedStatement s = conn.prepareStatement("SELECT id FROM foods WHERE name=?");
            s.setString(1,f.getName());
            rs = s.executeQuery();
            rs.next();
            int foodId = rs.getInt("id");
            rs.close();
            PreparedStatement statement1 = conn.prepareStatement("INSERT INTO food_order VALUES (default, ?, ?, ?)");
            statement1.setInt(1, orderId);
            statement1.setInt(2, foodId);
            statement1.setDouble(3, f.getPrice());
            statement1.executeUpdate();
            conn.commit();
            
        }
    }
    
    public ArrayList<Order> getUserOrders(int userId) throws SQLException{
        conn = DataBase.getConnection();
        ArrayList<Order> orders = new ArrayList<Order>();
        ArrayList<Integer> ids = new ArrayList<Integer>();
        PreparedStatement statement = conn.prepareStatement("SELECT id FROM orders WHERE user_id = " + userId + ";");
        ResultSet rs = statement.executeQuery();
        while(rs.next()){
            ids.add(rs.getInt("id"));
        }
        rs.close();
        
        for(int i : ids){
            ArrayList<Food> foods = new ArrayList<Food>();
            Address a = new Address();
            double totalPrice;
            statement = conn.prepareStatement("SELECT city, street, no FROM addresses WHERE id = (SELECT address_id FROM orders WHERE id ="+ i + ");");
            rs = statement.executeQuery();
            rs.next();
            a.setCity(rs.getString("city"));
            a.setStreet(rs.getString("street"));
            a.setNo(rs.getInt("no"));
            rs.close();
            
            statement = conn.prepareStatement("SELECT name, quantity, price FROM foods WHERE id IN (SELECT food_id FROM food_order WHERE order_id = "+ i +");");
            rs = statement.executeQuery();
            while(rs.next()){
                Food f = new Food(rs.getString("name"), rs.getDouble("price"), rs.getInt("quantity"));
                foods.add(f);
            }
            rs.close();
            
            statement = conn.prepareStatement("SELECT total_price FROM orders WHERE id = "+i+";");
            rs = statement.executeQuery();
            rs.next();
            totalPrice = rs.getDouble("total_price");
            
            orders.add(new Order(foods, totalPrice, a));
        }
        return orders;
    }
    
    public ArrayList<Order> getAllOrders() throws SQLException{
        conn = DataBase.getConnection();
        ArrayList<Order> orders = new ArrayList<Order>();
        ArrayList<Integer> ids = new ArrayList<Integer>();
        PreparedStatement statement = conn.prepareStatement("SELECT id FROM orders;");
        ResultSet rs = statement.executeQuery();
        while(rs.next()){
            ids.add(rs.getInt("id"));
        }
        rs.close();
        
        for(int i : ids){
            ArrayList<Food> foods = new ArrayList<Food>();
            Address a = new Address();
            double totalPrice;
            statement = conn.prepareStatement("SELECT city, street, no FROM addresses WHERE id = (SELECT address_id FROM orders WHERE id ="+ i + ");");
            rs = statement.executeQuery();
            rs.next();
            a.setCity(rs.getString("city"));
            a.setStreet(rs.getString("street"));
            a.setNo(rs.getInt("no"));
            rs.close();
            
            statement = conn.prepareStatement("SELECT name, quantity, price FROM foods WHERE id IN (SELECT food_id FROM food_order WHERE order_id = "+ i +");");
            rs = statement.executeQuery();
            while(rs.next()){
                Food f = new Food(rs.getString("name"), rs.getDouble("price"), rs.getInt("quantity"));
                foods.add(f);
            }
            rs.close();
            
            statement = conn.prepareStatement("SELECT total_price FROM orders WHERE id = "+i+";");
            rs = statement.executeQuery();
            rs.next();
            totalPrice = rs.getDouble("total_price");
            
            orders.add(new Order(foods, totalPrice, a, i));
        }
        return orders;
    }
    
    public void deleteOrder(String orderName) throws SQLException{
        conn=DataBase.getConnection();
        PreparedStatement statement = conn.prepareStatement("DELETE FROM orders WHERE id = ?");
        statement.setString(1,orderName);
        statement.executeUpdate();
        conn.commit();
    }
}
