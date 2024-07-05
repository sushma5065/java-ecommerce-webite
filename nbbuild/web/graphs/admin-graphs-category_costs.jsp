<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="../images/titlelogo.png" type="image/x-icon">
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <title>Graphs</title>
    </head>
    <body>
        <div>
            <div style="width: 400px;height: 300px;" id="barContainer"></div>
        </div>
        <script>
            var barChart = new CanvasJS.Chart("barContainer", {
                theme: "dark",
                animationEnabled: true,
                title: {
                    text: "Total Cost by Category",
                    fontFamily: "Poppins"
                },
                axisX: {
                    title: "Product Category",
                    labelFontFamily: "Poppins"
                },
                axisY: {
                    title: "Total Cost",
                    labelFontFamily: "Poppins"
                },
                data: [{
                        type: "bar",
                        dataPoints: [
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");

                    String categoryQuery = "SELECT productcategory, SUM(productprice) AS totalcost FROM products GROUP BY productcategory";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(categoryQuery);

                    while (rs.next()) {
                        String category = rs.getString("productcategory");
                        double totalCost = rs.getDouble("totalcost");
            %>
                            {label: "<%= category%>", y: <%= totalCost%>},
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
