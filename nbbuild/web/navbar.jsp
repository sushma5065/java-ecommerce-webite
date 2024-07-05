<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@page import="java.sql.*" %>
<%
    if (session == null || session.getAttribute("userEmail") == null) {
        response.sendRedirect("login.jsp");
    }
    int todayNotificationCount = 0;
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");
        String todaySqlQuery = "SELECT COUNT(*) AS count FROM notifications WHERE DATE(datetime) = CURDATE()";
        stmt = conn.prepareStatement(todaySqlQuery);
        rs = stmt.executeQuery();
        if (rs.next()) {
            todayNotificationCount = rs.getInt("count");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) {
            rs.close();
        }
        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Website</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
            *{
                text-decoration: none;
            }
            body {
                font-family: 'Poppins', sans-serif;
                margin: 0;
                padding: 0;
            }
            nav{
                display: flex;
                flex-direction: row;
                background-color: white;
            }
            .navlinks, .navlogo{
                margin: auto;
            }
            .navlogo a{
                text-decoration: none;
            }
            .navlink{
                margin: 20px;
                text-decoration: none;
                color: black;
                background-color: white;
                padding:10px;
                border-radius: 10px;
            }
            .navlink:hover{
                color:red;
            }
            .navlogotit{
                color: red;
            }
            .navlinkloginbutton {
                background-color: red;
                padding: 10px;
                padding-left: 15px;
                padding-right: 15px;
                border-radius: 20px;
                color: white;
                text-decoration: none;
                transition: background-color 0.3s ease-in-out;
                font-weight: bold;
            }
            .navlinkloginbutton:hover {
                background-color: darkred;
            }
            /*dropdown CSS*/
            .dropdown {
                position: relative;
                display: inline-block;
            }
            .dropdown-content {
                display: none;
                position: absolute;
                background-color: white;
                border: 1px solid #ccc;
                border-radius: 5px;
                z-index: 1;
                top: calc(100% + 10px);
                left: 50%;
                transform: translateX(-50%);
                width: auto;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            }
            .dropdown:hover .dropdown-content {
                display: block;
                display: flex;
                flex-direction: row;
            }
            .dropdown-content a {
                color: black;
                margin: 20px;
                width: 100%;
                text-decoration: none;
                display: block;
                animation: fadeInDown 1.0s ease forwards;
            }
            @keyframes fadeInDown {
                0% {
                    opacity: 0;
                    transform: translateY(-10px);
                }
                100% {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            .dropdown-content a:hover {
                color: red;
            }
            .navcategory{
                margin: 20px;
                font-weight: bold;
            }
            .dropdowncol{
                width: 200px;
            }
            .notification-icon {
                display: inline-block;
                animation: wobble 1s ease-in-out infinite;
            }
            @keyframes wobble {
                0% {
                    transform: translateX(0);
                }
                25% {
                    transform: translateX(-2px) rotate(-2deg);
                }
                50% {
                    transform: translateX(2px) rotate(2deg);
                }
                75% {
                    transform: translateX(-2px) rotate(-2deg);
                }
                100% {
                    transform: translateX(2px) rotate(2deg);
                }
            }
            .notification-countactive{
                color: white;
                background-color: red;
                border-radius: 100px;
                padding-left: 7px;
                padding-right: 7px;
                font-weight: 500;
            }
            .chatbuttonallpages{
                position: fixed;
                bottom: 20px;
                right: 20px;
                background-color: red;
                padding: 15px;
                border-radius: 50px;
            }
            .chatbuttonallpages a{
                color: white;
            }
        </style>
    </head>
    <body>
        <div class="chatbuttonallpages">
            <a href="chat.jsp">Chat With Us</a>
        </div>
        <nav>
            <div class="navlogo">
                <a href="index.jsp">
                    <h2 class="navlogotit">Ecom</h2>
                </a>
            </div>
            <div class="navlinks">
                <a class="navlink" href="index.jsp">Home</a>
                <div class="dropdown">
                    <a class="navlink" href="productscategories.jsp">Products &#9662;</a>
                    <div class="dropdown-content">
                        <div class="dropdowncol">
                            <p class="navcategory">Groceries</p>
                            <a href="products.jsp?find=fruitsandveg">Fruits & Vegetables</a>
                            <a href="products.jsp?find=dairyandeggsandsnacks">Dairy & Eggs</a>
                            <a href="products.jsp?find=graindsandcereals">Grains & Cereals</a>
                            <a href="products.jsp?find=meatandprotein">Meat & Protein</a>
                        </div>
                        <div class="dropdowncol">
                            <p class="navcategory">Clothing</p>
                            <a href="products.jsp?find=casualclothing">Casual Clothing</a>
                            <a href="products.jsp?find=formalclothing">Formal Clothing</a>
                            <a href="products.jsp?find=nightwear">Night Wear</a>
                        </div>
                        <div class="dropdowncol">
                            <p class="navcategory">Electronics</p>
                            <a href="products.jsp?find=mobiles">Mobiles</a>
                            <a href="products.jsp?find=laptops">Laptops</a>
                            <a href="products.jsp?find=accessories">Accessories</a>
                        </div>

                    </div>
                </div>
                <a class="navlink" href="about.jsp">About</a>
                <a class="navlink" href="contact.jsp">Contact</a>
            </div>
            <div class="navlinksright navlinks">
                <a class="navlink navlinknoti" href="notification.jsp">
                    <span class="notification-icon">&#x1F514;</span> Notifications
                    <% if (todayNotificationCount > 0) {%>
                    <span class="notification-countactive"><%= todayNotificationCount%></span>
                    <% } else {%>
                    <span class="notification-count"><%= todayNotificationCount%></span>
                    <% } %>
                </a>
                <a class="navlink" href="cart.jsp">Cart</a>
                <%
                    String userEmail = (String) session.getAttribute("userEmail");
                    if (userEmail != null) {
                %>
                <div class="dropdown">
                    <a style="cursor: pointer" class="navlink">Account &#9662;</a>
                    <div class="dropdown-content">
                        <div class="dropdowncol">
                            <a href="profile.jsp">Profile</a>
                            <a href="logout.jsp">Logout</a>
                        </div>
                    </div>
                </div>
                <%
                } else {
                %>
                <a class="navlinkloginbutton" href="login.jsp">Login</a>
                <%
                    }
                %>
            </div>
        </nav>
    </body>
    <script>
        window.addEventListener('contextmenu', function (e) {
            e.preventDefault();
            alert("Copyright Issues: This content is protected by copyright. Unauthorized use is prohibited.");
        });
        document.addEventListener('keydown', function (e) {
            if (e.ctrlKey && e.shiftKey && e.key === 'I') {
                e.preventDefault();
                alert("Copyright Issues: This content is protected by copyright. Unauthorized use is prohibited.");
            }
        });
        document.addEventListener('keydown', function (e) {
            if (e.ctrlKey && e.key === 'u') {
                e.preventDefault();
                alert("Copyright Issues: This content is protected by copyright. Unauthorized use is prohibited.");
            }
        });
    </script>
</html>
