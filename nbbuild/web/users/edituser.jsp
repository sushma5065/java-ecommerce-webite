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
                <h2>Edit User</h2>
                <form action="" method="post">
                    <input type="text" id="userId" name="userId" placeholder="User ID" required><br /><br />
                    <input type="submit" value="Fetch User">
                </form>
                <%
                    String userIdParam = request.getParameter("userId");
                    if (userIdParam != null && !userIdParam.isEmpty()) {
                        Connection conn = null;
                        PreparedStatement stmt = null;
                        ResultSet rs = null;
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");
                            String sqlQuery = "SELECT * FROM registration WHERE id=?";
                            stmt = conn.prepareStatement(sqlQuery);
                            stmt.setString(1, userIdParam);
                            rs = stmt.executeQuery();
                            if (rs.next()) {
                                String email = rs.getString("email");
                                String password = rs.getString("password");
                                String confirmPassword = rs.getString("confirmpassword");
                %>
                <h2>Edit User Details</h2>
                <form action="" method="post">
                    <input type="hidden" name="userId" value="<%= userIdParam%>">
                    <input type="text" id="email" name="email" placeholder="Email" value="<%= email%>" required><br><br>
                    <input type="password" id="password" name="password" placeholder="Password" value="<%= password%>" required><br><br>
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" value="<%= confirmPassword%>" required><br><br>
                    <input type="submit" name="updateUser" value="Update User">
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
                    if (request.getParameter("updateUser") != null) {
                        String updatedUserId = request.getParameter("userId");
                        String updatedEmail = request.getParameter("email");
                        String updatedPassword = request.getParameter("password");
                        String updatedConfirmPassword = request.getParameter("confirmPassword");
                        Connection conn = null;
                        PreparedStatement updateStmt = null;
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");
                            String sqlUpdateQuery = "UPDATE registration SET email=?, password=?, confirmpassword=? WHERE id=?";
                            updateStmt = conn.prepareStatement(sqlUpdateQuery);
                            updateStmt.setString(1, updatedEmail);
                            updateStmt.setString(2, updatedPassword);
                            updateStmt.setString(3, updatedConfirmPassword);
                            updateStmt.setString(4, updatedUserId);
                            updateStmt.executeUpdate();
                            response.sendRedirect("../admin-users.jsp");
                        } catch (Exception e) {
                            out.println("<p>Error updating user: " + e.getMessage() + "</p>");
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
