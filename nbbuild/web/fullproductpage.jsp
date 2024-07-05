<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
    if (session == null || session.getAttribute("userEmail") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Product Details</title>
        <link rel="icon" href="images/titlelogo.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .section {
                display: flex;
                flex-direction: row;
                margin: 100px auto;
                margin-top: 25px;
                border-radius: 15px;
                padding: 25px;
                justify-content: space-evenly;
                width: 50%;
            }
            .section img{
                height: 400px;
                width: 400px;
                border-radius: 15px;
            }
            .section .column1{
                justify-content: right;
            }
            .section .column2{
                justify-content: left;
            }
            .section a{
                padding: 10px;
                background-color: red;
                color: white;
                border-radius: 30px;
                text-decoration: none;
                width: 75%;
            }
            form input{
                padding: 10px;
                border-radius: 30px;
            }
            form button{
                padding: 10px;
                margin: 10px;
                background-color: red;
                color: white;
                border-radius: 30px;
                cursor: pointer;
            }
            form button:hover{
                background-color: darkred;
            }
            form label{
                margin: 10px;
            }
            .checked {
                color: orange;
            }
            .success-message {
                color: green;
                margin-top: 1rem;
            }

            .error-message {
                color: red;
                margin-top: 1rem;
            }
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />
        <%
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");

                String productId = request.getParameter("product-id");

                if (productId != null && !productId.isEmpty()) {
                    stmt = conn.prepareStatement("SELECT * FROM products WHERE productid = ?");
                    stmt.setString(1, productId);
                    rs = stmt.executeQuery();

                    if (rs.next()) {
                        String id = rs.getString("productid");
                        String name = rs.getString("productname");
                        String description = rs.getString("productdescription");
                        String imageUrl = rs.getString("productimage_url");
                        String price = rs.getString("productprice");
        %>
        <h2 style="text-align:center"><%= name%></h2>
        <div class="section">
            <div class="column1">
                <img src="<%= imageUrl%>" />
            </div>
            <div class="column2">
                <h3><%= name%></h3>
                <p><%= description%></p>
                <p>$<%= price%></p>
                <hr style="border:3px solid #f1f1f1">
                <span class="heading">User Rating</span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star"></span>
                <span class="fa fa-star"></span>
                <p>3.2 average based on 3092 reviews.</p>
                <hr style="border:3px solid #f1f1f1">
                <form style="display: flex;flex-direction: column;justify-content: space-between" method="post" action="AddToCartServlet" >
                    <input type="hidden" name="productid" value="<%= id%>">
                    <input type="hidden" name="productname" value="<%= name%>">
                    <input type="hidden" name="productdescription" value="<%= description%>">
                    <input type="hidden" name="productimage_url" value="<%= imageUrl%>">
                    <input type="hidden" name="productprice" value="<%= price%>">
                    <label>Quantity : </label>
                    <input type="number" name="quantity" value="1" min="1"/>
                    <button type="submit">Add to Cart</button>
                </form>
            </div>
        </div>
        <%
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
            }
        %>
        <jsp:include page="footer.jsp" />
    </body>
</html>
