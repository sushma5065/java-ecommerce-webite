<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            }
            .grid-container-section2 {
                display: flex;
                flex-direction: row;
                justify-content: space-evenly;
                padding: 25px;
                padding-top: 0px;
            }
            .card{
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
                border-radius: 15px;
                margin: 25px;
                padding: 10px;
                transition: 0.3s;
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
            </style>
        </head>
        <body>
            <jsp:include page="navbar.jsp" />
            <div class="grid-container-section1">
                <div class="grid-item">
                    <div>
                        <h1 style="text-align: justify;
                            padding: 30px;
                            padding-bottom: 0px;">Welcome To The Store</h1>
                        <p style="text-align: justify;
                           padding: 30px;
                           padding-bottom: 0px;">Welcome to Website, your one-stop destination for all things. At our Store, we pride ourselves on offering a wide range of high-quality Products and Services that cater to your every need. Whether you're looking for specific products, services, or benefits, we have you covered.</p>
                        <p style="text-align: justify;
                           padding: 30px;
                           padding-bottom: 0px;">Our mission is to provide an exceptional shopping experience that combines top-notch products with excellent customer service. With a diverse selection of Products or Services, we aim to meet the unique preferences and requirements of our valued customers.</p>
                    </div>
                </div>
                <div class="grid-item">
                    <div>
                        <img style="width: 100%;
                             height: 100%;
                             border-radius: 30px;
                             margin: auto" src="https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80" alt="Image">
                        </div>
                    </div>
                </div>
                <h2 style="text-align:center;">Product Categories</h2>
            <div class="grid-container-section2">
                <a href="productscategories.jsp">
                    <div class="card">
                        <div>
                            <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80" alt="Avatar" style="width:100%">
                                <div class="container">
                                    <h4><b>FOODS</b></h4>
                                    <p>Fresh Foods</p>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a href="productscategories.jsp">
                        <div class="card">
                            <div>
                                <img src="https://images.unsplash.com/photo-1540221652346-e5dd6b50f3e7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2069&q=80" alt="Avatar" style="width:100%">
                                <div class="container">
                                    <h4><b>Clothing</b></h4>
                                    <p>Branded Clothes</p>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a href="productscategories.jsp">
                        <div class="card">
                            <div>
                                <img src="https://images.unsplash.com/photo-1550009158-9ebf69173e03?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1802&q=80" alt="Avatar" style="width:100%">
                                <div class="container">
                                    <h4><b>Electronics</b></h4>
                                    <p>Premium Electronics</p>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a href="productscategories.jsp">
                        <div class="card">
                            <div>
                                <img src="https://images.unsplash.com/photo-1609097828576-3b620e86039e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80" alt="Avatar" style="width:100%">
                                <div class="container">
                                    <h4><b>Services</b></h4>
                                    <p>Long-Term Services</p>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <jsp:include page="footer.jsp" />
            </body>
        </html>