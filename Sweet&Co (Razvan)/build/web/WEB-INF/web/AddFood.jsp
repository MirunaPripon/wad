<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <title>[Admin]Add Food</title>
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
              
            <form method="post" action="AddFoodController">
                <h1>Add Food:</h1> 
                <div class="form-element">
                    <label for="name">Food name:</label>
                    <input type="text" name="name" id="name" required>
                </div>
                <div class="form-element">
                    <label for="type">Type of food:</label>
                    <select name="type" id="type" required>
                        <option value="Drinks">Tarts</option>
                        <option value="Appetizers">Pies</option>
                        <option value="Soups">Pancakes</option>
                        <option value="Grills">Cakes</option>
                        <option value="MainCourses">Sweets</option>
                        <option value="Deserts">Chocolate</option>
                    </select>
                </div>
                <div class="form-element">
                    <label for="description">Description:</label>
                    <input type="text" name="description" id="description" required>
                </div>
                <div class="form-element">
                    <label for="quantity">Quantity (g):</label>
                    <input type="number" name="quantity" id="quantity" required>
                </div>
                <div class="form-element">
                    <label for="price">Price (€):</label>
                    <input type="number" step="0.01" name="price" id="price" required>
                </div>
                <div class="form-element">
                    <label for="img">Image URL:</label>
                    <input type="text" name="img" id="img" required>
                </div>
                <div class="form-element">
                    <input type="submit" value="Add Food">
                    <input type="reset" value="Reset">
                </div>
                <div class="form-element">
                    <%if (request.getAttribute("msg") != null) {%>
                    <label> <%=request.getAttribute("msg")%></label>
                    <%}%>

                </div>

            </form>
            <footer id="footerr">
                <!--<div class="row">-->
                
                <!--</div>-->
            </footer>

    </body>

</html>