/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package listeners;

import DAO.FoodDAO;
import DAO.LocationDAO;
import domain.Food;
import java.util.ArrayList;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ContextListener implements ServletContextListener {
    FoodDAO foodDAO = FoodDAO.getInstance();
    
    LocationDAO locationDAO = LocationDAO.getInstance();
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
    
    //Bakery by type
        
    ArrayList <Food> tarts = foodDAO.getFoodsByType("Tarts");
    sce.getServletContext().setAttribute("Tarts", tarts);
    
    ArrayList <Food> pies = foodDAO.getFoodsByType("Pies");
    sce.getServletContext().setAttribute("Pies", pies);
    
    ArrayList <Food> pancakes = foodDAO.getFoodsByType("Pancakes");
    sce.getServletContext().setAttribute("Pancakes", pancakes);
    
    ArrayList <Food> cakes = foodDAO.getFoodsByType("Cakes");
    sce.getServletContext().setAttribute("Cakes", cakes);
    
    ArrayList <Food> sweets = foodDAO.getFoodsByType("Sweets");
    sce.getServletContext().setAttribute("Sweets", sweets);
    
    ArrayList<domain.Food> chocolate = foodDAO.getFoodsByType("Chocolate");
    sce.getServletContext().setAttribute("Chocolate", chocolate);

      
    //Locations
    
    ArrayList<domain.Location> locations = locationDAO.getLocations();
    sce.getServletContext().setAttribute("LOCATIONS", locations);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
