<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <title>Home</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script >
            var i = 0;
              function changeImg(){
                  i++;
                var img = ["http://10771-presscdn-0-59.pagely.netdna-cdn.com/wp-content/uploads/2015/05/GourmetEuropeanPastries_657.jpg",
                "http://d3lp4xedbqa8a5.cloudfront.net/s3/digital-cougar-assets/GourmetTraveller/2014/03/28/28079/1210gtcherrytart-628.jpg",
                "http://del.h-cdn.co/assets/cm/15/10/54f63ec6bc6d3_-_gluten-free-banana-coconut-pancakes-recipe-fw0814-de.jpg",
                "http://2.bp.blogspot.com/-o58vVby9ASU/WH4RQktn3TI/AAAAAAAAFPA/oGjjpai5iPc4fbCfuOQFh3K0GcTDv48TACK4B/s1600/cheesecake%2Bspeculoos%2B4.jpg"];
                  $("#slider").fadeOut(800, function() {
                $("#slider").attr('src',img[i%4]);}).fadeIn(800); 
               setTimeout(function(){
                    changeImg();},2300); 
            }

            
        </script>
    </head>
    <body onload="changeImg()">
        
        <div id ="left">
            

        </div>


        <div id="content">
            <div class="header">
                <img id="logoImg" src="https://scontent.fotp3-2.fna.fbcdn.net/v/t1.0-0/p118x118/18557480_1627291040639162_2860161333788514278_n.jpg?oh=183896865c45d065a5d6af388b253ff5&oe=5977F4B5" width="200px"  />
              
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
                <img id="slider" src="https://scontent.fotp3-2.fna.fbcdn.net/v/t1.0-9/18620322_1627245913977008_5115909885210682813_n.jpg?oh=fa31434b9055055b22a999e7072a24b7&oe=59BF72C1">
                
            </div>
            <div id="footer">Web Application Development Project</div>
        </div>
        <div id="right">
                 
        </div>
        

    </body>

</html>