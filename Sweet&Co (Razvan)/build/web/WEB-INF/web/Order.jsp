<%@page import="domain.Food"%>
<%@page import="DAO.AddressDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.Address"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%AddressDAO addressDAO = AddressDAO.getInstance();
    ArrayList<domain.Address> userAddresses = addressDAO.getUserAddresses((String) request.getSession().getAttribute("user"));
    double totalPrice = 0;
%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <title>Order</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

        <script>
            $(document).ready(function () {
                $("#addrButton").click(function () {
                    if ($("#formNew").css("display") == "none") {
                        $("#formNew").css("display", "block");
                        $("#formExisting").css("display", "none");
                        $("#addrButton").attr("value", "Choose existing address");
                    } else {
                        $("#formNew").css("display", "none");
                        $("#formExisting").css("display", "block");
                        $("#addrButton").attr("value", "Add new address");
                    }
                });
                $(".del").click(function () {
                    $(".onDeletion").css("display", "none");
                    $("#formDeletion").css("display", "block");
                })
            });

        </script>
    </head>
    <body>
        <div id ="left">


        </div>


        <div id="content">
            <div class="header">
                <img id="logoImg" src="https://scontent.fotp3-2.fna.fbcdn.net/v/t1.0-0/p118x118/18557480_1627291040639162_2860161333788514278_n.jpg?oh=183896865c45d065a5d6af388b253ff5&oe=5977F4B5" width="100px"  />

            </div>
            <nav>
                <%if (request.getSession().getAttribute("user") != null) {%>

                <ul>
                    <li><a href="Home.jsp">Home</a></li>
                    <li><a href="Menu.jsp">Menu</a></li>
                    <li><a href="Contact.jsp">Contact</a></li>
                    <li><a href="Profile.jsp">Profile</a></li>
                    <li id = "tail"><a href="LogOutController">Logout</a></li>
                </ul>
                <%} else {%>
                <ul>
                    <li><a href="Home.jsp">Home</a></li>
                    <li><a href="Menu.jsp">Menu</a></li>
                    <li><a href="Contact.jsp">Contact</a></li>
                    <li id = "tail" ><a href="Login.jsp">Log In</a></li>
                    <li id = "tail" ><a href="Registration.jsp">Register</a></li>
                </ul>
                <%}%>
            </nav>

            <div id="center">
                <h1 class="onDeletion"> Your Order: </h1> </br>

                <form class="onDeletion" id="formExisting" method="post" action="OrderExistingController">
                    <%if (request.getAttribute("products") != null) {
                        ArrayList<Food> products = (ArrayList<Food>) request.getAttribute("products");%>
                    <ol>
                        <%totalPrice = 0;
                            for (int i = 0; i < products.size(); i++) {
                                totalPrice += products.get(i).getPrice();
                        %>
                        <li><%=products.get(i).getName() + ", " + products.get(i).getQuantity() + "g, " + products.get(i).getPrice() + "€"%></li><br>

                        <%}%>
                    </ol>
                        <h3>Total Price: </h3><%=totalPrice + "€"%><br>
                    <% request.getSession().setAttribute("totalPrice", totalPrice);%>
                    <%}%>
                    <br>
                    <input class = "del" type ="button" value="Delete items">
                    <div class="form-element">
                        <label>Your Addresses:</label>
                        <select class="dis1" name="addressSelected" required>
                            <%for (int i = 0; i < userAddresses.size(); i++) {%>
                            <option value = "<%=userAddresses.get(i).getCity() + "#" + userAddresses.get(i).getStreet() + "#" + userAddresses.get(i).getNo()%>"> <%=userAddresses.get(i).toString()%></option>
                            <%}%>
                        </select> 
                    </div>
                    <div class="form-element">
                        <input class="dis1" type="submit" value="Submit">
                        <input class="dis1" type="reset" value="Reset">
                    </div>
                </form>

                <form class="onDeletion" id="formNew" method="post" action="AddressController">
                    <%if (request.getAttribute("products") != null) {
                        ArrayList<Food> products = (ArrayList<Food>) request.getAttribute("products");%>
                    <ol>
                        <%totalPrice = 0;
                            for (int i = 0; i < products.size(); i++) {
                                totalPrice += products.get(i).getPrice();
                        %>
                        <li><%=products.get(i).getName() + ", " + products.get(i).getQuantity() + "g, " + products.get(i).getPrice() + "€"%></li>

                        <%}%>
                    </ol>
                    <h3>Total Price: </h3><%=totalPrice + "€"%>
                    <%}%>
                    <br>
                    <input class="del" type ="button" value="Delete items">
                    <h1>Add Address:</h1>
                    <div class="form-element">
                        <label for="city">City:</label>
                        <input class="dis" type="text" name="city" id="city" required >
                    </div>
                    <div class="form-element">
                        <label for="district">District:</label>
                        <input class="dis" type="text" name="district" id="district" required >
                    </div>
                    <div class="form-element">
                        <label for="street">Street</label>
                        <input class="dis" type="text" name="street" id="street" required >
                    </div>
                    <div class="form-element">
                        <label for="no">Number:</label>
                        <input class="dis" type="text" name="no" id="no" required >
                    </div>
                    <div class="form-element">
                        <label for="zip">ZIP Code:</label>
                        <input class="dis" type="text" name="zip" id="zip" required >
                    </div>
                    <div class="form-element">
                        <label for="floor">Floor No.:*</label>
                        <input class="dis" type="text" name="floor" id="floor" >
                    </div>
                    <div class="form-element">
                        <label for="apt">Apartment:*</label>
                        <input class="dis" type="text" name="apt" id="apt" >
                    </div>
                    <div class="form-element">
                        <label for="bell">Bell:*</label>
                        <input class="dis" type="text" name="bell" id="bell" >
                    </div>
                    <div class="form-element">
                        <input class="dis" type="submit" value="Submit" >
                        <input class="dis" type="reset" value="Reset" >
                    </div>                 

                </form>

                <form id="formDeletion" method="post" action="DeleteSelectionsController">
                    <%if (request.getAttribute("products") != null) {
                        ArrayList<Food> products = (ArrayList<Food>) request.getAttribute("products");%>
                    <%for (int i = 0; i < products.size(); i++) {%>
                    <input type="checkbox" name="check" value="<%=products.get(i).getName() + "#" + products.get(i).getQuantity() + "#" + products.get(i).getPrice()%>" checked/>
                    <%= products.get(i).getName() + ", " + products.get(i).getQuantity() + "g, " + products.get(i).getPrice() + "€"%>
                    <br>  
                    <%}%>
                    <%}%>

                    <div class="form-element">
                        <input class="dis1" type="submit" value="Delete Selected">
                    </div>
                </form>

                <div class="onDeletion">
                    <input id="addrButton" type="button" value = "Add new address">
                </div>
            </div>
            <div id="footer">Web Application Development Project</div>
        </div>
        <div id="right">

        </div>


    </body>

</html>