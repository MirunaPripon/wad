<%@page import="java.util.ArrayList"%>
<%@page import="domain.Location"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList<domain.Location> locations = (ArrayList<domain.Location>)request.getServletContext().getAttribute("LOCATIONS");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <title>Contact</title>
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
                <h1>Locations:</h1>
            <%for(Location l : locations){%>
            <div id="location">
                <h3><%=l.getName()%></h3>
                <h4>Address</h4>
                <label>City: <%= l.getAddress().getCity() %></label><br>
                <label>Street: <%= l.getAddress().getStreet() %></label><br>
                <label>Number: <%= l.getAddress().getNo() %></label><br>
                <img src="<%= l.getImg() %>" class="locationImg"><br>
                <label>Phone: <%= l.getPhoneNo()%></label><br>
                <label>Description: <%= l.getDescription() %></label><br>
                
            </div>
            
            <%}%>

        

            <%if (request.getSession().getAttribute("user") != null) {%>
            <a href="Booking.jsp">Get a Booking!<a> <%}%>
            
        </div>
            <div id="footer">Web Application Development Project</div>
        </div>
        <div id="right">
                 
        </div>
        

    </body>

</html>