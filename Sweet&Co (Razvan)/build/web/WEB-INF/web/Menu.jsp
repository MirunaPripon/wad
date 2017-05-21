<%@page import="DAO.FoodDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.Food"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% FoodDAO FoodDao = FoodDAO.getInstance();
    ArrayList<domain.Food> tarts = (ArrayList<domain.Food>)request.getServletContext().getAttribute("Tarts");
    ArrayList<domain.Food> pies = (ArrayList<domain.Food>)request.getServletContext().getAttribute("Pies");
    ArrayList<domain.Food> pancakes = (ArrayList<domain.Food>)request.getServletContext().getAttribute("Pancakes");
    ArrayList<domain.Food> cakes = (ArrayList<domain.Food>)request.getServletContext().getAttribute("Cakes");
    ArrayList<domain.Food> sweets = (ArrayList<domain.Food>)request.getServletContext().getAttribute("Sweets");
    ArrayList<domain.Food> chocolate = (ArrayList<domain.Food>)request.getServletContext().getAttribute("Chocolate");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <title>Menu</title>
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
            <h1>Menu</h1>
            <%if(request.getSession().getAttribute("user")!=null){%>
            <form method="post" action="CheckoutController">
                <div class="form-element">
                    <h3>Tarts:</h3>
                </div>
                
                    <%for (int i = 0; i < tarts.size(); i++) {%>
                    <div class="form-element">
                    <input type="checkbox" name="check" value="<%=tarts.get(i).getName()+"#"+tarts.get(i).getQuantity() +"#"+tarts.get(i).getPrice()%>"/>
                    <label> <%=tarts.get(i).getName()+" Quantity:"+tarts.get(i).getQuantity() +"g Price:"+tarts.get(i).getPrice()%></label><br>
                    <label><%=" Description:"+tarts.get(i).getDescription() +"."%></label>
                    </div>
                    <%}%>
                
                <div class="form-element">
                    <h3>Pies:</h3>
                </div>
                
                    <%for (int i = 0; i < pies.size(); i++) {%>
                    <div class="form-element">
                    <input type="checkbox" name="check" value="<%=pies.get(i).getName()+"#"+pies.get(i).getQuantity() +"#"+pies.get(i).getPrice()%>"/>
                    <label> <%=pies.get(i).getName()+" Quantity:"+pies.get(i).getQuantity() +"g Price:"+pies.get(i).getPrice()%></label><br>
                    <label><%=" Description:"+pies.get(i).getDescription() +"."%></label>
                    </div>
                    <%}%>    
                
                <div class="form-element">
                    <h3>Pancakes:</h3>
                </div>
                
                    <%for (int i = 0; i < pancakes.size(); i++) {%>
                    <div class="form-element">
                    <input type="checkbox" name="check" value="<%=pancakes.get(i).getName()+"#"+pancakes.get(i).getQuantity() +"#"+pancakes.get(i).getPrice()%>"/>
                    <label> <%=pancakes.get(i).getName()+" Quantity:"+pancakes.get(i).getQuantity() +"g Price:"+pancakes.get(i).getPrice()%></label><br>
                    <label><%=" Description:"+pancakes.get(i).getDescription() +"."%></label>
                    </div>
                    <%}%>
                    
                <div class="form-element">
                    <h3>Sweets:</h3>
                </div>
                
                    <%for (int i = 0; i < sweets.size(); i++) {%>
                    <div class="form-element">
                    <input type="checkbox" name="check" value="<%=sweets.get(i).getName()+"#"+sweets.get(i).getQuantity() +"#"+sweets.get(i).getPrice()%>"/>
                    <label> <%=sweets.get(i).getName()+" Quantity:"+sweets.get(i).getQuantity() +"g Price:"+sweets.get(i).getPrice()%></label><br>
                    <label><%=" Description:"+sweets.get(i).getDescription() +"."%></label>
                    </div>
                    <%}%>
                    
                <div class="form-element">
                    <h3>Chocolate:</h3>
                </div>
                
                    <%for (int i = 0; i < chocolate.size(); i++) {%>
                    <div class="form-element">
                    <input type="checkbox" name="check" value="<%=chocolate.get(i).getName()+"#"+chocolate.get(i).getQuantity() +"#"+chocolate.get(i).getPrice()%>"/>
                    <label> <%=chocolate.get(i).getName()+" Quantity:"+chocolate.get(i).getQuantity() +"g Price:"+chocolate.get(i).getPrice()%></label><br>
                    <label><%=" Description:"+chocolate.get(i).getDescription() +"."%></label>
                    </div>
                    <%}%>
                    
                <div class="form-element">
                    <h3>Cakes:</h3>
                </div>
                
                    <%for (int i = 0; i < cakes.size(); i++) {%>
                    <div class="form-element">
                    <input type="checkbox" name="check" value="<%=cakes.get(i).getName()+"#"+cakes.get(i).getQuantity() +"#"+cakes.get(i).getPrice()%>"/>
                    <label> <%=cakes.get(i).getName()+" Quantity:"+cakes.get(i).getQuantity() +"g Price:"+cakes.get(i).getPrice()%></label><br>
                    <label><%=" Description:"+cakes.get(i).getDescription() +"."%></label>
                    </div>
                    <%}%>
                    
                <div class="form-element">
                    <input type="submit" value="Checkout">
                    <input type="reset" value="Cancel">
                </div>                 

            </form>
                    <%}else{%>
                    <div class="form-element">
                    <h3>Tarts:</h3>
                </div>
                
                    <%for (int i = 0; i < tarts.size(); i++) {%>
                    <div class="form-element">
                    <label> <%=tarts.get(i).getName()+" Quantity:"+tarts.get(i).getQuantity() +"g Price:"+tarts.get(i).getPrice()%></label><br>
                    <label><%=" Description:"+tarts.get(i).getDescription() +"."%></label>
                    </div>
                    <%}%>
                
                <div class="form-element">
                    <h3>Pies:</h3>
                </div>
                
                    <%for (int i = 0; i < pies.size(); i++) {%>
                    <div class="form-element">
                    <label> <%=pies.get(i).getName()+" Quantity:"+pies.get(i).getQuantity() +"g Price:"+pies.get(i).getPrice()%></label><br>
                    <label><%=" Description:"+pies.get(i).getDescription() +"."%></label>
                    </div>
                    <%}%>    
                
                <div class="form-element">
                    <h3>Pancakes:</h3>
                </div>
               
                    <%for (int i = 0; i < pancakes.size(); i++) {%>
                    <div class="form-element">
                    <label> <%=pancakes.get(i).getName()+" Quantity:"+pancakes.get(i).getQuantity() +"g Price:"+pancakes.get(i).getPrice()%></label><br>
                    <label><%=" Description:"+pancakes.get(i).getDescription() +"."%></label>
                   </div>
                    <%}%>
                    
                <div class="form-element">
                    <h3>Sweets:</h3>
                </div>
                
                    <%for (int i = 0; i < sweets.size(); i++) {%>
                    <div class="form-element">
                    <label> <%=sweets.get(i).getName()+" Quantity:"+sweets.get(i).getQuantity() +"g Price:"+sweets.get(i).getPrice()%></label><br>
                    <label><%=" Description:"+sweets.get(i).getDescription() +"."%></label>
                    </div>
                    <%}%>
                    
                <div class="form-element">
                    <h3>Chocolate:</h3>
                </div>
                
                    <%for (int i = 0; i < chocolate.size(); i++) {%>
                    <div class="form-element">
                    <label> <%=chocolate.get(i).getName()+" Quantity:"+chocolate.get(i).getQuantity() +"g Price:"+chocolate.get(i).getPrice()%></label><br>
                    <label><%=" Description:"+chocolate.get(i).getDescription() +"."%></label>
                    </div>
                    <%}%>
                    
                <div class="form-element">
                    <h3>Cakes:</h3>
                </div>
                
                    <%for (int i = 0; i < cakes.size(); i++) {%>
                    <div class="form-element">
                    <label> <%=cakes.get(i).getName()+" Quantity:"+cakes.get(i).getQuantity() +"g Price:"+cakes.get(i).getPrice()%></label><br>
                    <label><%=" Description:"+cakes.get(i).getDescription() +"."%></label>
                    </div>
                    <%}%>
                    
               
                    <%}%>

 
        <div id="footer">Web Application Development Project</div>
        <div id="right">
                 
        </div>
        

    </body>

</html>