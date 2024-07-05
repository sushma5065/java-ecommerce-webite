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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .grid-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-evenly;
                padding: 25px;
                margin: 50px;
                font-weight: 500;
                margin-top: 0px;
            }
            .card{
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
                border-radius: 15px;
                margin: 25px;
                padding: 10px;
                transition: 0.3s;
                width: 300px;
                height: 475px;
                margin-top: 0px;
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
            .icons {
                display: flex;
                justify-content: space-around;
                margin-top: 20px;
            }
            .icons a {
                color: #333;
                text-decoration: none;
                font-size: 24px;
            }
            .icons a:hover {
                color: #007bff;
            }
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />
        <h2 style="text-align: center; font-weight: 500;">About Page</h2>
        <div class="grid-container">
            <div class="card">
                <div>
                    <img src="https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1931&q=80" style="width:100%">
                    <div class="container">
                        <h2 style="text-align: center"><b>Karthik</b></h2>
                        <h3 style="text-align: center"><b>Designer & Developer</b></h3>
                        <p style="text-align: justify;">Passionate about creating functional websites.</p>
                        <div class="icons">
                            <a href="https://www.linkedin.com/in/gruhesh-sri-sai-karthik-kurra-178249227/" target="_blank"><i class="fab fa-linkedin" style="color: #0e76a8;"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div>
                    <img src="https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1931&q=80" style="width:100%">
                    <div class="container">
                        <h2 style="text-align: center"><b>Sushma</b></h2>
                        <h3 style="text-align: center"><b>Designer & Developer</b></h3>
                        <p style="text-align: justify;">Passionate about creating functional websites.</p>
                        <div class="icons">
                            <a href="https://www.linkedin.com/in/gruhesh-sri-sai-karthik-kurra-178249227/" target="_blank"><i class="fab fa-linkedin" style="color: #0e76a8;"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
