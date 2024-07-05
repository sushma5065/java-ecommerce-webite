<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Website</title>
        <link rel="icon" href="images/titlelogo.png" type="image/x-icon">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
            body {
                font-family: 'Poppins', sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }
            .logindiv {
                width: 30%;
                margin: 100px auto;
                background-color: #fff;
                border-radius: 8px;
                padding: 20px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            }
            .logindiv img.avatar {
                width: 110px;
                height: 110px;
                border-radius: 50%;
                margin: 0 auto;
                display: block;
            }
            .container {
                padding: 16px;
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            .container label{
                font-size: 20px;
            }
            input[type="text"], input[type="password"] {
                width: 100%;
                padding: 18px;
                border: 1px solid #ccc;
                border-radius: 25px;
                box-sizing: border-box;
                margin-bottom: 10px;
                font-size: 18px;
            }
            button {
                background-color: red;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 25px;
                cursor: pointer;
                width: 50%;
                font-size: 18px;
            }
            button:hover {
                background-color: darkred;
                font-size: 18px;
            }
            .logindiv input,button{
                font-family: 'Poppins', sans-serif;
            }
        </style>
    </head>
    <body>
        <div class="logindiv">
            <form method="post">
                <div>
                    <h1 style="text-align: center;">Login</h1>
                </div>
                <div class="container">
                    <label for="uname">Email</label>
                    <input type="text" placeholder="Example@gmail.com" name="uname" required>
                    <label for="psw">Password</label>
                    <input type="password" placeholder="Enter Password" name="psw" required>
                    <button type="submit">Login</button>
                    <p>Don't have an account? <a href="register.jsp" style="text-decoration: none;">Register</a></p>
                </div>
            </form>
            <%
                if (request.getMethod().equalsIgnoreCase("post")) {
                    String email = request.getParameter("uname");
                    String password = request.getParameter("psw");
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");
                        PreparedStatement ps = conn.prepareStatement("SELECT * FROM registration WHERE email = ? AND password = ?");
                        ps.setString(1, email);
                        ps.setString(2, password);
                        ResultSet rs = ps.executeQuery();
                        if (rs.next()) {
                            String redirectPage;
                            if (email.endsWith("@gmail.com")) {
                                redirectPage = "index.jsp";
                                session.setAttribute("userEmail", email);
                            } else if (email.endsWith("@admin.com")) {
                                redirectPage = "admin-dashboard.jsp";
                                session.setAttribute("adminEmail", email);
                            } else {
                                redirectPage = "default.jsp";
                            }
                            response.sendRedirect(redirectPage);
                        } else {
                            out.println("<div class='errors'>Invalid credentials. Please try again.</div>");
                        }
                        rs.close();
                        conn.close();
                    } catch (Exception e) {
                        out.println(e);
                    }
                }
            %>
        </div>
    </body>
</html>