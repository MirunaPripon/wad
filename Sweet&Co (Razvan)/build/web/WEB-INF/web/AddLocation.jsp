<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="style1.css" type="text/css"/>
        <title>[Admin]Add location</title>
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
            
            <form method="post" action="AddLocationController">
                <h2>Add new restaurant location</h2>
                <%if(request.getAttribute("ADD_LOCATION_SUCCESS")!=null){%>
                    <label> <%=request.getAttribute("ADD_LOCATION_SUCCESS") %></label>
                <%}else if(request.getAttribute("ADD_LOCATION_ERROR")!=null){%>
                <label> <%=request.getAttribute("ADD_LOCATION_ERROR") %></label>
                <%}%>
                <br>
                <div class="form-element">
                    <label for="city">Restaurant Name:</label>
                    <input class="name" type="text" name="name" id="name" required >
                </div>
                
                <div class="form-element">
                    <label for="phone">Phone Number:</label>
                    <input class="phone" type="phone" name="phone" id="phone" required >
                </div>
                
                <div class="form-element">
                    <label for="city">City:</label>
                    <input class="dis" type="text" name="city" id="city" required >
                </div>
                <div class="form-element">
                    <label for="street">Street</label>
                    <input class="dis" type="text" name="street" id="street" required >
                </div>
                <div class="form-element">
                    <label for="no">Number:</label>
                    <input class="dis" type="number" name="no" id="no" required >
                </div>
                <div class="form-element">
                    <label for="zip">ZIP Code:</label>
                    <input class="dis" type="text" pattern="[0-9]{6}" name="zip" id="zip" required >
                </div>
                <div class="form-element">
                    <label for="description">Description:</label>
                    <input class="dis" type="text" rows="4" cols="40" name="description" id="description" required >
                </div>
                <div class="form-element">
                    <label for="image">Add location image:</label>
                    <input class="dis" type="text" name="image">
                </div>
                <div class="form-element">
                    <input class="dis" type="submit" value="Submit" >
                    <input class="dis" type="reset" value="Reset" >
                </div>                 

            </form>
                
                <div id="footerr">
                    <!--<div class="row">-->

                    <!--</div>-->
                </div>
    </body>
</html>
