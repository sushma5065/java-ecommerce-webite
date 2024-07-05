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
            form input{
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
                <h2>Delete Notification</h2>
                <form action="" method="post">
                    <input type="text" id="notificationId" name="notificationId" placeholder="Enter Notification ID" required><br><br>
                    <input type="submit" value="Delete Notification">
                </form>
                <%
                    if (request.getMethod().equals("POST")) {
                        String notificationId = request.getParameter("notificationId");
                        Connection conn = null;
                        PreparedStatement stmt = null;
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");
                            String sqlQuery = "DELETE FROM notifications WHERE id = ?";
                            stmt = conn.prepareStatement(sqlQuery);
                            stmt.setString(1, notificationId);
                            int rowsAffected = stmt.executeUpdate();
                            out.println("<p>");
                            if (rowsAffected > 0) {
                                out.println("Notification deleted successfully!");
                                response.sendRedirect("../admin-notifications.jsp");
                            } else {
                                out.println("Error deleting notification.");
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
