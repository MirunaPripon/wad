
<%@page import="DAO.FoodDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.Food"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    FoodDAO foodDao = FoodDAO.getInstance();
    ArrayList<domain.Food> foods = foodDao.getFoods();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <title>[Admin]Delete Food</title>
    </head>
    <body>
            <header >
                    <div class="row">
                        <div class="col-md-8 col-md-offset-3 col-sm-8 col-sm-offset-1 col-xs-10 col-xs-offset-1">
                            <span class="text-muted">
                                <h1 id="head-text">Admin panel</h1>
                            </span>
                        </div>
            </header>
            <nav role="navigation" class="nav nav-tabs" id="mynav">
                <div class="row" id="navtext">
                    <a href="Admin.jsp" class="col-md-1 col-sm-2  col-xs-2">Home</a>
                    <a href="AddFood.jsp" class="col-md-2 col-sm-2  col-xs-2  ">Add Food</a>
                    <a href="DeleteFood.jsp" class="col-md-2 col-sm-2 col-xs-2"> Delete Food </a>
                    <a href="AddLocation.jsp" class="col-md-2 col-sm-2 col-xs-2">Add Location</a>
                    <a href="AddTables.jsp" class="col-md-2 col-sm-2 col-xs-2">Add Table</a>
                    <a href="CheckOrders.jsp" class="col-md-2 col-sm-2 col-xs-2">Check Orders</a>
                    <a href="LogOutController" class="col-md-1 col-sm-2  col-xs-2 "><p >Logout</p></a>
                   
                </div>
                     </nav>
        
               
            <form method="post" action="DeleteFoodController">
                <h1>Select a food item to delete from the menu:</h1>
                <div class="form-element">
                    <label for="name">Foods</label>
                </div>
                <div id="nav">
                <%for (Food f : foods) {%>
                <div class="form-element">
                    <input type="radio" name="food" value="<%=f.getName()%>"><%=f.getName()+" Quantity:"+f.getQuantity() +"g Price:"+f.getPrice()%><br>
                </div>
                <%}%>
                </div>
                <div class="form-element">
                    <input type="submit" value="Remove Food">
                </div>
                <%if (request.getAttribute("del") != null) {%>
            <label> <%=request.getAttribute("del")%></label>
            <%}%>

            </form>
            
            <div id="footerr">
                    <!--<div class="row">-->
                    <!--</div>-->
                </div>
    </body>
</html>