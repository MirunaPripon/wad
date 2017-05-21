/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import DAO.AddressDAO;
import DAO.OrderDAO;
import domain.Food;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrderNewController extends HttpServlet {

    AddressDAO addressDAO = AddressDAO.getInstance();
    OrderDAO orderDAO = OrderDAO.getInstance();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String city = request.getParameter("city");
            int district = Integer.parseInt(request.getParameter("district"));
            String street = request.getParameter("street");
            int no = Integer.parseInt(request.getParameter("no"));
            int zip = Integer.parseInt(request.getParameter("zip"));
            int floor = Integer.parseInt(request.getParameter("floor"));
            int apt = Integer.parseInt(request.getParameter("apt"));
            String bell = request.getParameter("bell");
            ArrayList<Food> products = (ArrayList<Food>)request.getSession().getAttribute("products");
            out.println(products.get(0));
            addressDAO.insertAddress(city, district, street, no, zip, floor, apt, bell);
            int addressId = addressDAO.getAddressID(city, street, no);
            addressDAO.mapUser_Address((String)request.getSession().getAttribute("user"));
            orderDAO.insertOrder((String)request.getSession().getAttribute("user"), addressId, (Double)request.getSession().getAttribute("totalPrice"));
            orderDAO.mapFood_Order(products);
            RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(OrderNewController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(OrderNewController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
