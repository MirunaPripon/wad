<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>    

    <head>
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
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
                <h1>Login form</h1>   
                <form method="post" action="LogInController">
                    <div class="form-element">
                        <label for="username">Username</label>
                        <input type="text" name="uname" id="uname" required>
                        <%if (request.getAttribute("LOGIN_ERROR") != null) {%>
                        <label> <%=request.getAttribute("LOGIN_ERROR")%></label>
                        <%}%>
                    </div>
                    <div class="form-element">
                        <label for="username">Password</label>
                        <input type="password" name="password" id="password" required>
                    </div>
                    Don't have an account yet? <a href="Registration.jsp">Register</a>               

                    <div class="form-element">
                        <input type="submit" value="Submit">
                        <input type="reset" value="Reset">
                    </div>
                </form>
            </div>
            <div id="footer">Web Application Development Project</div>
        </div>
        <div id="right">

        </div>


    </body>

</html>




