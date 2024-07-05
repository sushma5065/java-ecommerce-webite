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
                <h2>Edit Product</h2>
                <form action="" method="post">
                    <input type="text" id="productId" name="productId" placeholder="Product ID" required><br /><br />
                    <input type="submit" value="Fetch Product">
                </form>
                <%
                    String productIdParam = request.getParameter("productId");
                    if (productIdParam != null && !productIdParam.isEmpty()) {
                        Connection conn = null;
                        PreparedStatement stmt = null;
                        ResultSet rs = null;
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");
                            String sqlQuery = "SELECT * FROM products WHERE productid=?";
                            stmt = conn.prepareStatement(sqlQuery);
                            stmt.setString(1, productIdParam);
                            rs = stmt.executeQuery();
                            if (rs.next()) {
                                String productName = rs.getString("productname");
                                String productCategory = rs.getString("productcategory");
                                String description = rs.getString("productdescription");
                                double price = rs.getDouble("productprice");
                                String imageURL = rs.getString("productimage_url");
                %>
                <h2>Edit Product Details</h2>
                <form action="" method="post">
                    <input type="hidden" name="productId" value="<%= productIdParam%>">
                    <input type="text" id="productName" name="productName" placeholder="Product Name" value="<%= productName%>" required><br><br>
                    <input type="text" id="productCategory" name="productCategory" placeholder="Product Category" value="<%= productCategory%>" required><br><br>
                    <textarea id="description" name="description" rows="4" placeholder="Product Description" required><%= description%></textarea><br><br>
                    <input type="number" id="price" name="price" step="0.01" placeholder="Product Price" value="<%= price%>" required><br><br>
                    <input type="text" id="imageURL" name="imageURL" placeholder="Product Image URL" value="<%= imageURL%>" required><br><br>
                    <input type="submit" name="updateProduct" value="Update Product">
                </form>
                <%
                            }
                        } catch (Exception e) {
                            out.println("<p>Error: " + e.getMessage() + "</p>");
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
                    }
                %>
                <%
                    if (request.getParameter("updateProduct") != null) {
                        String updatedProductId = request.getParameter("productId");
                        String updatedProductName = request.getParameter("productName");
                        String updatedProductCategory = request.getParameter("productCategory");
                        String updatedDescription = request.getParameter("description");
                        double updatedPrice = Double.parseDouble(request.getParameter("price"));
                        String updatedImageURL = request.getParameter("imageURL");
                        Connection conn = null;
                        PreparedStatement updateStmt = null;
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");
                            String sqlUpdateQuery = "UPDATE products SET productname=?, productcategory=?, productdescription=?, productprice=?, productimage_url=? WHERE productid=?";
                            updateStmt = conn.prepareStatement(sqlUpdateQuery);
                            updateStmt.setString(1, updatedProductName);
                            updateStmt.setString(2, updatedProductCategory);
                            updateStmt.setString(3, updatedDescription);
                            updateStmt.setDouble(4, updatedPrice);
                            updateStmt.setString(5, updatedImageURL);
                            updateStmt.setString(6, updatedProductId);
                            updateStmt.executeUpdate();
                            response.sendRedirect("../admin-products.jsp");
                        } catch (Exception e) {
                            out.println("<p>Error updating product: " + e.getMessage() + "</p>");
                            e.printStackTrace();
                        } finally {
                            if (updateStmt != null) {
                                updateStmt.close();
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

