<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
            body {
                font-family: 'Poppins', sans-serif;
                margin: 0;
                padding: 0;
            }
            .sidebar {
                margin: 10px;
                padding: 0;
                width: 20%;
                background-color: black;
                position: fixed;
                height: 100%;
                border-radius: 10px;
            }
            .sidebar a {
                display: block;
                font-weight: lighter;
                color: white;
                padding: 15px;
                margin: 20px;
                border-radius: 50px;
                text-decoration: none;
                font-size: 20px;
            }
            .sidebar a:hover{
                transform: scale(1.05);
                background-color: white;
                color: black;
            }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <a href="../admin-dashboard.jsp">Dashboard</a>
            <a href="../admin-users.jsp">Manage Users</a>
            <a href="../admin-products.jsp">Manage Products</a>
            <a href="../admin-notifications.jsp">Manage Notifications</a>
            <a href="../admin-chats.jsp">Manage Chats</a>
            <a href="../admin-db.jsp">Direct DB Access</a>
            <a href="../admin-logout.jsp">Logout</a>
        </div>
    </body>
    <script>
        window.addEventListener('contextmenu', function (e) {
            e.preventDefault();
            alert("Copyright Issues: This content is protected by copyright. Unauthorized use is prohibited.");
        });
        document.addEventListener('keydown', function (e) {
            if (e.ctrlKey && e.shiftKey && e.key === 'I') {
                e.preventDefault();
                alert("Copyright Issues: This content is protected by copyright. Unauthorized use is prohibited.");
            }
        });
        document.addEventListener('keydown', function (e) {
            if (e.ctrlKey && e.key === 'u') {
                e.preventDefault();
                alert("Copyright Issues: This content is protected by copyright. Unauthorized use is prohibited.");
            }
        });
    </script>
</html>
