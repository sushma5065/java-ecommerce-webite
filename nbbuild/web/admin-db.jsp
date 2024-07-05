<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Execute SQL Query</title>
        <style>
            .content {
                margin-left: 20%;
                padding: 1px 16px;
                height: 1000px;
            }
            .content {
                margin-left: 20%;
                padding: 1px 16px;
                height: 1000px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            }

            h1, h2 {
                text-align: center;
            }

            form {
                margin-top: 20px;
                text-align: center;
            }

            label, textarea {
                display: block;
                margin: 10px 0;
                text-align: center;
            }

            textarea {
                width: 100%;
                padding: 10px;
                height: 150px;
                border: 1px solid #ccc;
                border-radius: 5px;
                resize: none;
                font-size: 18px;
            }

            input[type="submit"] {
                background-color: black;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 40px;
                cursor: pointer;
                font-family: 'Poppins', sans-serif;
            }

            input[type="submit"]:hover {
                background-color: black;
                color: white;
            }

            .query-result {
                margin-top: 20px;
                text-align: center;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
            }
            .content-in{
                margin: 50px;
            }
        </style>
    </head>
    <jsp:include page="admin-navbar.jsp" />
    <body>
        <div class="content">
            <div class="content-in">
                <h1 style="font-weight: 500" >Execute SQL Query</h1>

                <form action="" method="post">
                    <textarea id="sqlQuery" name="sqlQuery" rows="5" cols="50" required></textarea><br><br>
                    <input type="submit" value="Execute">
                </form>

                <div>
                    <h2 style="font-weight: 500" >Query Result:</h2>
                    <%
                        if (request.getMethod().equals("POST")) {
                            String sqlQuery = request.getParameter("sqlQuery");
                            if (sqlQuery.contains("DROP") || sqlQuery.contains("DELETE") || sqlQuery.contains("drop") || sqlQuery.contains("delete")) {
                                out.println("<p>Sorry, you are not allowed to execute this query.</p>");
                            } else {
                                Connection conn = null;
                                Statement stmt = null;
                                ResultSet rs = null;
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");
                                    stmt = conn.createStatement();
                                    boolean isResultSet = stmt.execute(sqlQuery);
                                    if (isResultSet) {
                                        rs = stmt.getResultSet();
                                        out.println("<table border='1'>");
                                        ResultSetMetaData metaData = rs.getMetaData();
                                        int columnCount = metaData.getColumnCount();
                                        out.println("<tr>");
                                        for (int i = 1; i <= columnCount; i++) {
                                            out.println("<th>" + metaData.getColumnName(i) + "</th>");
                                        }
                                        out.println("</tr>");

                                        while (rs.next()) {
                                            out.println("<tr>");
                                            for (int i = 1; i <= columnCount; i++) {
                                                out.println("<td>" + rs.getString(i) + "</td>");
                                            }
                                            out.println("</tr>");
                                        }

                                        out.println("</table>");
                                    } else {
                                        int rowsAffected = stmt.getUpdateCount();
                                        out.println("<p>" + rowsAffected + " rows affected.</p>");
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
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
