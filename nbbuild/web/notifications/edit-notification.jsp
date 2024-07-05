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
            input:hover, textarea:hover{
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
                <h2>Edit Notification</h2>
                <form action="" method="post">
                    <input type="text" id="notificationId" name="notificationId" placeholder="Notification ID" required><br /><br />
                    <input type="submit" value="Fetch Notification">
                </form>
                <%
                    String notificationIdParam = request.getParameter("notificationId");
                    if (notificationIdParam != null && !notificationIdParam.isEmpty()) {
                        Connection conn = null;
                        PreparedStatement stmt = null;
                        ResultSet rs = null;
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");
                            String sqlQuery = "SELECT * FROM notifications WHERE id=?";
                            stmt = conn.prepareStatement(sqlQuery);
                            stmt.setString(1, notificationIdParam);
                            rs = stmt.executeQuery();
                            if (rs.next()) {
                                String title = rs.getString("title");
                                String description = rs.getString("description");
                                String link = rs.getString("link");
                %>
                <h2>Edit Notification Details</h2>
                <form action="" method="post">
                    <input type="hidden" name="notificationId" value="<%= notificationIdParam%>">
                    <input type="text" id="title" name="title" placeholder="Notification Title" value="<%= title%>" required><br><br>
                    <textarea id="description" name="description" rows="4" placeholder="Notification Description" required><%= description%></textarea><br><br>
                    <input type="text" id="link" name="link" placeholder="Notification Link" value="<%= link%>" required><br><br>
                    <input type="submit" name="updateNotification" value="Update Notification">
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
                    if (request.getParameter("updateNotification") != null) {
                        String updatedNotificationId = request.getParameter("notificationId");
                        String updatedTitle = request.getParameter("title");
                        String updatedDescription = request.getParameter("description");
                        String updatedLink = request.getParameter("link");
                        Connection conn = null;
                        PreparedStatement updateStmt = null;
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");
                            String sqlUpdateQuery = "UPDATE notifications SET title=?, description=?, link=? WHERE id=?";
                            updateStmt = conn.prepareStatement(sqlUpdateQuery);
                            updateStmt.setString(1, updatedTitle);
                            updateStmt.setString(2, updatedDescription);
                            updateStmt.setString(3, updatedLink);
                            updateStmt.setString(4, updatedNotificationId);
                            updateStmt.executeUpdate();
                            response.sendRedirect("../admin-notifications.jsp");
                        } catch (Exception e) {
                            out.println("<p>Error updating notification: " + e.getMessage() + "</p>");
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
