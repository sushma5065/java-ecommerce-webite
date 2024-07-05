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
            }
            .content h2{
                font-weight: 500;
                text-align: center;
            }
            .content table {
                margin: 50px;
                border-collapse: collapse;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .content th, .content td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ccc;
                font-weight: lighter;
            }
            .content th {
                background-color: #f2f2f2;
                font-weight: 500;
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
            }
            .grid-container a{
                padding: 40px;
                background-color: black;
                color: white;
                border-radius: 100px;
                text-decoration: none;
            }
            .grid-container a:hover{
                transform: scale(1.10);
            }
            .grid-container iframe{
                width: 640px;
                height: 360px;
                overflow: hidden;
                border: none;
            }
        </style>
    </head>
    <jsp:include page="admin-navbar.jsp" />
    <body>
        <div class="content">
            <h2>Manage Users</h2>
            <div class="grid-container">
                <a href="users/adduser.jsp">Add User</a>
                <a href="users/edituser.jsp">Edit User</a>
                <a href="users/deleteuser.jsp">Delete User</a>
            </div>
            <div class="grid-container">
                <iframe src="http://localhost:8080/graphs/admin-graphs-user_cart_item_counts.jsp"></iframe>
                <iframe src="http://localhost:8080/graphs/admin-graphs-user_counts.jsp"></iframe>
            </div>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Confirm Password</th>
                </tr>
                <%
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");
                        String sqlQuery = "SELECT * FROM registration";
                        stmt = conn.prepareStatement(sqlQuery);
                        rs = stmt.executeQuery();
                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String email = rs.getString("email");
                            String password = rs.getString("password");
                            String confirmPassword = rs.getString("confirmpassword");
                %>
                <tr>
                    <td><%=id%></td>
                    <td><%=email%></td>
                    <td><%=password%></td>
                    <td><%=confirmPassword%></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                    }
                %>
            </table>
        </div>
    </body>
</html>