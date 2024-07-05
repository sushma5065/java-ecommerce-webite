<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Website</title>
        <link rel="icon" href="images/titlelogo.png" type="image/x-icon">
        <style>
            .table-container {
                border-radius: 10px;
                overflow: hidden;
            }
            table {
                border-collapse: collapse;
                width: 100%;
                display: flex;
                flex-direction: row;
                justify-content: space-evenly;
                padding: 25px;
                border-radius: 15px;
            }
            th, td {
                border: 1px solid #ccc;
                padding: 8px;
                text-align: left;
                padding-left: 25px;
                padding-right: 25px;
                justify-content: space-evenly;
            }
            th {
                background-color: #f2f2f2;
            }
            .remove-button {
                background-color: #dc3545;
                color: white;
                border: none;
                padding: 10px;
                border-radius: 30px;
                cursor: pointer;
                font-family: 'Poppins', sans-serif;
            }
            .remove-button:hover{
                background-color: darkred;
                transform: scale(1.10);
            }
            .bill {
                padding: 0 20px 20px 20px;
                background-color: white;
                border-radius: 10px;
                display: flex;
                flex-direction: column;
                justify-content: space-evenly;
                align-items: center;
                width: 25%;
            }
            .bill h3{
                font-weight: 500;
            }
            .proceed-button {
                padding: 15px;
                background-color: red;
                color: white;
                border-radius: 50px;
                font-size: 18px;
                border: none;
                width: 75%;
                font-family: 'Poppins', sans-serif;
                text-align: center;
                text-decoration: none;
            }
            .proceed-button:hover {
                background-color: darkred;
                transform: scale(1.03);
            }
            .div1{
                width: 100%;
                display: flex;
                justify-content: center;
                margin: 25px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />
        <h2 style="text-align: center;">Shopping Cart</h2>
        <div class="table-container">
            <table>
                <tr>
                    <th>Image</th>
                    <th>Product Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Action</th>
                </tr>
                <%
                    String userEmail = (String) session.getAttribute("userEmail");
                    double totalBill = 0.0;
                    if (userEmail == null) {
                        response.sendRedirect("login.jsp");
                    } else {
                        Connection conn = null;
                        PreparedStatement stmt = null;
                        ResultSet rs = null;

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");

                            stmt = conn.prepareStatement("SELECT * FROM cart WHERE email = ?");
                            stmt.setString(1, userEmail);
                            rs = stmt.executeQuery();
                            while (rs.next()) {
                                String productId = rs.getString("productid");
                                String productName = rs.getString("productname");
                                String productDescription = rs.getString("productdescription");
                                String productImageUrl = rs.getString("productimage_url");
                                String productPrice = rs.getString("productprice");
                                int quantity = rs.getInt("quantity");
                                double itemTotal = quantity * Double.parseDouble(productPrice);
                                totalBill += itemTotal;

                %>
                <tr>
                    <td><img src="<%= productImageUrl%>" style="border-radius: 15px;" alt="<%= productName%>" width="100"></td>
                    <td><%= productName%></td>
                    <td><%= productDescription%></td>
                    <td>$<%= productPrice%></td>
                    <td><%= quantity%></td>
                    <td>$<%= quantity * Double.parseDouble(productPrice)%></td>
                    <td><button class="remove-button" onclick="removeFromCart('<%= productId%>')">Remove</button></td>
                </tr>
                <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            try {
                                if (rs != null) {
                                    rs.close();
                                }
                                if (stmt != null) {
                                    stmt.close();
                                }
                                if (conn != null) {
                                    conn.close();
                                }
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }
                        }
                    }
                %>
            </table>
            <div class="div1">
                <div class="bill">
                    <h3>Total Bill: $<%= totalBill%></h3>               
                    <a href="payment.jsp" class="proceed-button">Proceed to Checkout</a>
                </div>
            </div>
        </div>
        <script>
            function removeFromCart(productId) {
                if (confirm("Are you sure you want to remove this item from your cart?")) {
                    var xhr = new XMLHttpRequest();
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === XMLHttpRequest.DONE) {
                            if (xhr.status === 200) {
                                location.reload();
                            } else {
                                alert('An error occurred while removing the item.');
                            }
                        }
                    };
                    xhr.open('GET', 'removecartitem.jsp?productId=' + encodeURIComponent(productId), true);
                    xhr.send();
                }
            }
        </script>

        <jsp:include page="footer.jsp" />
    </body>
</html>
