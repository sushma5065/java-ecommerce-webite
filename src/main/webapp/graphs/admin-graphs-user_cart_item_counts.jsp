<%@page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="../images/titlelogo.png" type="image/x-icon">
        <style>
            #barContainer {
                font-family: 'Poppins', sans-serif;
            }
        </style>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <title>User Cart Item and Quantity Counts</title>
    </head>
    <body>
        <div>
            <div style="width: 400px; height: 300px;" id="barContainer"></div>
        </div>
        <script>
            var barChart = new CanvasJS.Chart("barContainer", {
                theme: "dark",
                animationEnabled: true,
                title: {
                    text: "User Cart Item and Quantity Counts",
                    fontColor: "black",
                    fontFamily: "Poppins"
                },
                axisX: {
                    title: "User Email",
                    labelFontFamily: "Poppins"
                },
                axisY: {
                    title: "Count",
                    labelFontFamily: "Poppins"
                },
                data: [{
                        type: "column",
                        dataPoints: [
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");

                    String cartQuery = "SELECT email, SUM(quantity) AS totalquantity FROM cart GROUP BY email";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(cartQuery);

                    while (rs.next()) {
                        String userEmail = rs.getString("email");
                        int totalQuantity = rs.getInt("totalquantity");
            %>
                            {label: "<%= userEmail%>", y: <%= totalQuantity%>},
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
            barChart.render();
        </script><script>
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
