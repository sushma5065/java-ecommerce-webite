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
        <h2 style="text-align:center">Grocery Products</h2>
        <div class="grid-container-section2">
            <a href="products.jsp?find=fruitsandveg">
                <div class="card">
                    <div>
                        <img src="https://images.unsplash.com/photo-1488459716781-31db52582fe9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80" alt="Avatar" style="width:100%">
                        <div class="container">
                            <h4><b>Fruits & Vegetables</b></h4>
                            <p>Fresh Fruits & Veggies</p>
                        </div>
                    </div>
                </div>
            </a>
            <a href="products.jsp?find=dairyandeggsandsnacks">
                <div class="card">
                    <div>
                        <img src="https://images.unsplash.com/photo-1664802460230-3d4eda8a8d7a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2071&q=80" alt="Avatar" style="width:100%">
                        <div class="container">
                            <h4><b>Dairy & Eggs & snacks</b></h4>
                            <p>Fresh Dairy & Eggs</p>
                        </div>
                    </div>
                </div>
            </a>
            <a href="products.jsp?find=graindsandcereals">
                <div class="card">
                    <div>
                        <img src="https://images.unsplash.com/photo-1571748982800-fa51082c2224?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2071&q=80" alt="Avatar" style="width:100%">
                        <div class="container">
                            <h4><b>Grains & Cereals</b></h4>
                            <p>Fresh Grains & Cereals</p>
                        </div>
                    </div>
                </div>
            </a>
            <a href="products.jsp?find=meatandprotein">
                <div class="card">
                    <div>
                        <img src="https://images.unsplash.com/photo-1527324688151-0e627063f2b1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80" alt="Avatar" style="width:100%">
                        <div class="container">
                            <h4><b>Meat and Protein</b></h4>
                            <p>Fresh Meat & Protein</p>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <h2 style="text-align:center">Clothing</h2>
        <div class="grid-container-section2">
            <a href="products.jsp?find=casualclothing">
                <div class="card">
                    <div>
                        <img src="https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80" alt="Avatar" style="width:100%">
                        <div class="container">
                            <h4><b>Casual Clothing</b></h4>
                            <p>Premium Quality Casual Clothing</p>
                        </div>
                    </div>
                </div>
            </a>
            <a href="products.jsp?find=formalclothing">
                <div class="card">
                    <div>
                        <img src="https://images.unsplash.com/photo-1580657018950-c7f7d6a6d990?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80" alt="Avatar" style="width:100%">
                        <div class="container">
                            <h4><b>Formal Clothing</b></h4>
                            <p>Premium Quality Formal Clothing</p>
                        </div>
                    </div>
                </div>
            </a>
            <a href="products.jsp?find=nightwear">
                <div class="card">
                    <div>
                        <img src="https://images.unsplash.com/photo-1523381210434-271e8be1f52b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80" alt="Avatar" style="width:100%">
                        <div class="container">
                            <h4><b>Night Wear</b></h4>
                            <p>Premium Quality Night Clothing</p>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <h2 style="text-align:center">Electronics</h2>
        <div class="grid-container-section2">
            <a href="products.jsp?find=mobiles">
                <div class="card">
                    <div>
                        <img src="https://images.unsplash.com/photo-1556656793-08538906a9f8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80" alt="Avatar" style="width:100%">
                        <div class="container">
                            <h4><b>Mobiles</b></h4>
                            <p>Replacement Guaranteed Mobiles</p>
                        </div>
                    </div>
                </div>
            </a>
            <a href="products.jsp?find=laptops">
                <div class="card">
                    <div>
                        <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1926&q=80" alt="Avatar" style="width:100%">
                        <div class="container">
                            <h4><b>Laptops</b></h4>
                            <p>Replacement Guaranteed Laptops</p>
                        </div>
                    </div>
                </div>
            </a>
            <a href="products.jsp?find=accessories">
                <div class="card">
                    <div>
                        <img src="https://images.unsplash.com/photo-1590658268037-6bf12165a8df?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1932&q=80" alt="Avatar" style="width:100%">
                        <div class="container">
                            <h4><b>Accessories</b></h4>
                            <p>Replacement Guaranteed Accessories</p>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>