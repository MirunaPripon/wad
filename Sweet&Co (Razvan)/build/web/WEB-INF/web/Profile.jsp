<%@page import="domain.Address"%>
<%@page import="domain.Food"%>
<%@page import="domain.Order"%>
<%@page import="DAO.OrderDAO"%>
<%@page import="domain.Booking"%>
<%@page import="DAO.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.User"%>
<%@page import="DAO.TableDAO"%>
<%@page import="domain.Table"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    OrderDAO orderDAO = OrderDAO.getInstance();
    UserDAO userDAO = UserDAO.getInstance();
    TableDAO tableDAO = TableDAO.getInstance();
    domain.User u = userDAO.getUserInfo((String) request.getSession().getAttribute("user"));
    ArrayList<Booking> bookings = tableDAO.getUserBookings((String) request.getSession().getAttribute("user"));
    ArrayList<Order> orders = orderDAO.getUserOrders(userDAO.getUserId((String) request.getSession().getAttribute("user")));
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <title>Profile</title>
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
                <h1>User Info:</h1>
                <form method="post">

                    <div class="form-element">
                        <label>Username:</label>
                    </div>
                    <div class="form-element">
                        <label><%= u.getUsername()%></label>
                    </div>

                    <div class="form-element">
                        <label>First Name:</label>
                    </div>
                    <div class="form-element">
                        <label><%= u.getFname()%></label>
                    </div>

                    <div class="form-element">
                        <label>Last Name:</label>
                    </div>
                    <div class="form-element">
                        <label><%= u.getLname()%></label>
                    </div>

                    <div class="form-element">
                        <label>Phone number:</label>
                    </div>
                    <div class="form-element">
                        <label><%= u.getPhone()%></label>
                    </div>

                    <div class="form-element">
                        <label>Email:</label>
                    </div>
                    <div class="form-element">
                        <label><%= u.getEmail()%></label>
                    </div>
                </form>  
                <%if (bookings.size() > 0) {%>
                <div>
                    <h1>Booking History:</h1>

                    <% for (Booking b : bookings) {%>
                    <div class="form-element">
                        <label>Date: <%= b.getDate()%> , Time: <%= b.getTime()%>, At table number: <%= b.getT().getTableNo()%>, with <%= b.getT().getNoOfSeats()%> seats.</label>
                    </div>
                    <%}%>

                </div>
                <%}%>
                <%if (orders.size() > 0) {%>
                <div>
                    <h1>Order History:</h1>
                    <div>
                        <% for (Order o : orders) {
                                ArrayList<Food> foods = o.getFoods();
                                Address address = o.getAddress();
                                double totalPrice = o.getTotalPrice();
                                for (Food f : foods) {%>
                        <label><%=f.getName()%>, <%=f.getQuantity()%>, Price: <%=f.getPrice()%></label><br>
                        <%}%>
                        <label><b>Total Price:</b> <%=totalPrice%></label>
                        <label>Address: <%=address.getStreet()%>, no.<%=address.getNo()%>, <%=address.getCity()%></label>

                        <%}%>
                        <%}%>



                    </div>


                </div>
            </div>
            <div id="footer">Web Application Development Project</div>
        </div>
        <div id="right">

        </div>


    </body>

</html>