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
        <title>Website</title>
        <link rel="icon" href="images/titlelogo.png" type="image/x-icon">
        <style>
            .grid-container-section1 {
                display: flex;
                flex-direction: row;
                justify-content: space-evenly;
                padding: 25px;
                justify-content: space-evenly;
            }
            .grid-container-section2 {
                display: flex;
                flex-direction: row;
                justify-content: space-evenly;
                padding: 25px;
                padding-top: 0px;
                justify-content: space-evenly;
            }
            .card{
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
                border-radius: 15px;
                margin: 25px;
                padding: 10px;
                transition: 0.3s;
                width: 300px;
                height: 350px;
            }
            .card:hover {
                box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
                transform: scale(1.05);
            }
            .card img{
                border-radius: 15px;
            }
            .card .container{
                padding: 25px;
                padding-bottom: 0px;
                padding-top: 0px;
            }
            a{
                text-decoration: none;
                color: black;
            }
            .card img {
                border-radius: 15px;
                width: 100%;
                height: 200px;
                object-fit: cover;
            }
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />
        <h2 style="text-align:center"><%= request.getParameter("find")%> Products</h2>
        <div class="grid-container-section2">
            <%
                String category = request.getParameter("find");
                String jdbcUrl = "jdbc:mysql://localhost:3306/ecommerce";
                String dbUsername = "root";
                String dbPassword = "";
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);
                    String query = "SELECT * FROM products WHERE productcategory = ?";
                    PreparedStatement preparedStatement = connection.prepareStatement(query);
                    preparedStatement.setString(1, category);
                    ResultSet resultSet = preparedStatement.executeQuery();
                    int cardCount = 0;
                    while (resultSet.next()) {
                        String id = resultSet.getString("productid");
                        String productName = resultSet.getString("productname");
                        String productDescription = resultSet.getString("productdescription");
                        String productImageURL = resultSet.getString("productimage_url");
            %>
            <a href="#">
                <div class="card">
                    <div>
                        <a href="fullproductpage.jsp?product-id=<%=id%>" target="_blank" >
                            <img src="<%= productImageURL%>" alt="<%= productName%>" style="width:100%">
                        </a> 
                        <div class="container">
                            <h4><b><%= productName%></b></h4>
                            <p><%= productDescription%></p>
                        </div>
                    </div>
                </div>
            </a>
            <%
                cardCount++;
                if (cardCount == 4) {
            %>
        </div>
        <div class="grid-container-section2">
            <%
                            cardCount = 0;
                        }
                    }
                    resultSet.close();
                    preparedStatement.close();
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>