<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    if (session == null || session.getAttribute("adminEmail") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/titlelogo.png" type="image/x-icon">
        <title>Admin Dashboard</title>
        <style>
            .content {
                margin-left: 20%;
                padding: 1px 16px;
                height: 1000px;
                display: flex;
                flex-direction: row;
                justify-content: space-evenly;
            }
            .content h2{
                font-weight: 500;
                text-align: center;
            }
            form{
                background-color: #fff;
                border-radius: 15px;
                padding: 50px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            }
            form input,textarea{
                padding: 20px;
                width: 300px;
                border-radius: 50px;
                font-family: 'Poppins', sans-serif;
                font-size: 15px;
            }
            form input[type="submit"]{
                padding: 20px;
                width: 300px;
                border-radius: 50px;
                background-color: black;
                color: white;
            }
            input:hover{
                transform: scale(1.10);
            }
            textarea:hover{
                transform: scale(1.10);
            }
            form input[type="submit"]:hover{
                background-color: black;
                color: white;
                transform: scale(1.10);
            }

        </style>
    </head>
    <jsp:include page="../admin-navbar.jsp" />
    <body>
        <div class="content">
            <div>

            </div>
            <div>
                <h2>Add Product</h2>
                <form action="" method="post">
                    <input type="text" id="productName" name="productName" placeholder="Product Name" required><br><br>
                    <input type="text" id="productCategory" name="productCategory" placeholder="Product Category" required><br><br>
                    <textarea id="description" name="description" rows="4" placeholder="Product Description" required></textarea><br><br>
                    <input type="number" id="price" name="price" step="0.01" placeholder="Product Price" required><br><br>
                    <input type="text" id="imageURL" name="imageURL" placeholder="Product Image URL" required><br><br>
                    <input type="submit" value="Add Product">
                </form>
                <%
                    if (request.getMethod().equals("POST")) {
                        String productName = request.getParameter("productName");
                        String productCategory = request.getParameter("productCategory");
                        String description = request.getParameter("description");
                        String price = request.getParameter("price");
                        String imageURL = request.getParameter("imageURL");
                        Connection conn = null;
                        PreparedStatement stmt = null;
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");
                            String sqlQuery = "INSERT INTO products (productname, productcategory, productdescription, productprice, productimage_url) VALUES (?, ?, ?, ?, ?)";
                            stmt = conn.prepareStatement(sqlQuery);
                            stmt.setString(1, productName);
                            stmt.setString(2, productCategory);
                            stmt.setString(3, description);
                            stmt.setString(4, price);
                            stmt.setString(5, imageURL);
                            int rowsAffected = stmt.executeUpdate();
                            out.println("<p>");
                            if (rowsAffected > 0) {
                                response.sendRedirect("../admin-products.jsp");
                                out.println("Product added successfully!");
                            } else {
                                out.println("Error adding product.");
                            }
                            out.println("</p>");
                        } catch (Exception e) {
                            out.println("<p>Error: " + e.getMessage() + "</p>");
                            e.printStackTrace();
                        } finally {
                            if (stmt != null) {
                                stmt.close();
                            }
                            if (conn != null) {
                                conn.close();
                            }
                        }
                    }
                %>
            </div>
            <div>

            </div>
        </div>
    </body>
</html>