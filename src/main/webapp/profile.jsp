<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User Profile</title>
        <link rel="icon" href="images/titlelogo.png" type="image/x-icon">
        <style>
            .profile-details p{
                text-align: center;
            }
            .buttonprofile{
                padding: 10px;
                border-radius: 8px;
                background-color: red;
                color: white;
                text-decoration: none;
            }
            .grid-container {
                display: flex;
                flex-direction: row;
                justify-content: space-evenly;
                padding: 25px;
                padding-top: 0px;
                justify-content: space-evenly;
            }
            .grid-container{
                margin: 50px;
                font-weight: 500;
                margin-bottom: 0px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />
        <h2 style="text-align: center;">User Profile</h2>
        <div class="profile-container">
            <%
                String userEmail = (String) session.getAttribute("userEmail");
                double totalBill = 0.0;
                if (userEmail == null) {
                    response.sendRedirect("login.jsp");
                } else {
            %>
            <div class="profile-details">
                <p><strong>Email:</strong> <%= userEmail%></p>
            </div>
            <div class="grid-container">
                <a href="cart.jsp" class="buttonprofile">Manage Cart</a>
                <a href="logout.jsp" class="buttonprofile">Logout</a>
            </div>
            <%
                }
            %>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
