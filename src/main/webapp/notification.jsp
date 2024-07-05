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
        <title>Notification Page</title>
        <link rel="icon" href="images/titlelogo.png" type="image/x-icon">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                margin: 0;
                padding: 0;
            }

            .notification-container {
                display: flex;
                justify-content: space-evenly;
                background-color: #fff;
                border-radius: 25px;
                padding: 20px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                margin: 20px;
            }

            .notification-container h2 {
                font-size: 24px;
                margin-bottom: 20px;
            }

            .notification-left,
            .notification-right {
                flex: 1;
                padding: 20px;
                border-radius: 10px;
                margin: 25px;
                background-color: #f7f7f7;
                box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
            }

            .notification h3 {
                font-weight: 600;
                color: #333;
            }

            .notification h4 {
                font-weight: 500;
                color: #555;
                margin-top: 5px;
            }

            .notification p {
                font-weight: 400;
                color: #777;
            }

            .notification a {
                text-decoration: none;
                color: #007bff;
                font-weight: bold;
            }
            .notification{
                background-color: white;
                padding: 20px;
                border-radius: 25px;
                border: 2px solid black;
                margin: 15px;
            }

            .notification a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />
        <h1 style="text-align: center">Notifications</h1>
        <div class="notification-container">
            <div class="notification-left">
                <h2 style="color: green">Today's Notifications</h2>
                <%
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");
                        String sqlQuery = "SELECT * FROM notifications WHERE DATE(datetime) = CURDATE() ORDER BY datetime DESC";
                        stmt = conn.prepareStatement(sqlQuery);
                        rs = stmt.executeQuery();
                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String title = rs.getString("title");
                            String description = rs.getString("description");
                            String datetime = rs.getString("datetime");
                            String link = rs.getString("link");
                %>
                <div class="notification">
                    <h3><%=title%></h3>
                    <h4>Date & Time: <%=datetime%></h4>
                    <p><%=description%></p>
                    <p><a href="<%=link%>" target="_blank">Link</a></p>
                </div>
                <%
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
            </div>
            <div class="notification-right">
                <h2 style="color: red">All Notifications</h2>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");
                        String sqlQuery = "SELECT * FROM notifications WHERE DATE(datetime) < CURDATE() ORDER BY datetime DESC";
                        stmt = conn.prepareStatement(sqlQuery);
                        rs = stmt.executeQuery();
                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String title = rs.getString("title");
                            String description = rs.getString("description");
                            String datetime = rs.getString("datetime");
                            String link = rs.getString("link");
                %>
                <div class="notification">
                    <h3><%=title%></h3>
                    <h4>Date & Time: <%=datetime%></h4>
                    <p><%=description%></p>
                    <p><a href="<%=link%>" target="_blank">Link</a></p>
                </div>
                <%
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
            </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
