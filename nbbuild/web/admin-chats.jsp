<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.Date, javax.servlet.http.HttpSession"%>
<%
    if (session == null || session.getAttribute("adminEmail") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin Chat</title>
        <link rel="icon" href="images/titlelogo.png" type="image/x-icon">
        <style>
            * {
                text-decoration: none;
            }

            .content {
                margin-left: 20%;
                padding: 1px 16px;
                height: 1000px;
            }

            .content h2 {
                font-weight: 500;
                text-align: center;
            }

            .user-email-list {
                text-align: center;
                font-size: 18px;
            }

            .search-form {
                text-align: center;
                margin-bottom: 20px;
            }

            .search-input {
                font-family: 'Poppins', sans-serif;
                font-size: 15px;
                padding: 10px;
                border-radius: 100px;
            }

            .search-button {
                padding: 15px;
                font-family: 'Poppins', sans-serif;
                font-size: 12px;
                background-color: black;
                color: white;
                border: none;
                border-radius: 100px;
                cursor: pointer;
            }

            .user-emails-container {
                display: flex;
                flex-direction: row;
                flex-wrap: wrap;
                justify-content: space-evenly;
            }

            .user-email {
                margin: 10px;
            }

            .user-email-link {
                color: white;
                background-color: black;
                padding: 10px;
                border-radius: 100px;
                text-align: center;
                display: block;
            }
        </style>
    </head>
    <jsp:include page="admin-navbar.jsp" />

    <body>
        <div class="content">
            <h2 style="text-align: center; font-weight: 500">Admin Chat</h2>
            <div class="search-form">
                <form method="post" action="">
                    <input type="text" class="search-input" placeholder="Search by email" name="searchEmail" />
                    <button type="submit" class="search-button">Search</button>
                </form>
            </div>
            <div class="user-email-list">
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");
                        String adminEmail = (String) session.getAttribute("adminEmail");
                        String searchEmail = request.getParameter("searchEmail");
                        PreparedStatement usersStmt;
                        if (searchEmail != null && !searchEmail.isEmpty()) {
                            usersStmt = conn.prepareStatement("SELECT DISTINCT sender FROM chat WHERE receiver = ? AND sender LIKE ?");
                            usersStmt.setString(1, adminEmail);
                            usersStmt.setString(2, "%" + searchEmail + "%");
                        } else {
                            usersStmt = conn.prepareStatement("SELECT DISTINCT sender FROM chat WHERE receiver = ?");
                            usersStmt.setString(1, adminEmail);
                        }

                        ResultSet usersRs = usersStmt.executeQuery();
                        while (usersRs.next()) {
                            String userEmail = usersRs.getString("sender");
                            if (userEmail.endsWith("@gmail.com")) {
                %>
                <div class="user-emails-container">
                    <div class="user-email">
                        <a class="user-email-link" href="#" onclick="openNewTab('<%= userEmail%>')"><%= userEmail%></a>
                    </div>
                </div>
                <%
                            }
                        }
                        usersRs.close();
                        usersStmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
        </div>
        <script>
            function openNewTab(userEmail) {
                window.open('adminuserchat.jsp?userEmail=' + userEmail, '_blank');
            }
        </script>
    </body>
</html>
