<%@page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="../images/titlelogo.png" type="image/x-icon">
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <title>Pie Chart</title>
    </head>
    <body>
        <div>
            <div style="width: 400px; height: 300px;" id="pieContainer"></div>
        </div>
        <script>
            var pieChart = new CanvasJS.Chart("pieContainer", {
            theme: "dark",
                    animationEnabled: true,
                    title: {
                    text: "User and Admin Counts",
                            fontFamily: "Poppins"
                    },
                    data: [{
                    type: "pie",
                            showInLegend: true,
                            legendText: "{label}",
                            dataPoints: [
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");

                    String userQuery = "SELECT COUNT(*) AS usercount FROM registration WHERE email LIKE '%@gmail.com'";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(userQuery);

                    if (rs.next()) {
                        int userCount = rs.getInt("usercount");
            %>
                            {label: "Users", y: <%= userCount%>},
            <%
                }

                String adminQuery = "SELECT COUNT(*) AS admincount FROM registration WHERE email LIKE '%@admin.com'";
                rs = stmt.executeQuery(adminQuery);

                if (rs.next()) {
                    int adminCount = rs.getInt("admincount");
            %>
                            {label: "Admins", y: <%= adminCount%>},
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
                            ]
                    }]
            });
            pieChart.render();
        </script>
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
    </body>
</html>
