<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
            *{
                font-family: 'Poppins', sans-serif;
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
            <form method="post" action="register.jsp">
                <div>
                    <h1 style="text-align: center;">Register</h1>
                </div>
                <div class="container">
                    <label for="uname">Email</label>
                    <input type="text" placeholder="Example@gmail.com" name="email" required>
                    <label for="psw">Password</label>
                    <input type="password" placeholder="Enter Password" name="psw" required>
                    <label for="psw">Confirm Password</label>
                    <input type="password" placeholder="Re-Enter Password" name="repsw" required>
                    <button type="submit">Register</button>
                    <p>Already have an account? <a href="login.jsp" style="text-decoration: none;">Login</a></p>
                </div>
            </form>
            <%
                if (request.getMethod().equalsIgnoreCase("post")) {
                    String email = request.getParameter("email");
                    String pwd = request.getParameter("psw");
                    String repwd = request.getParameter("repsw");
                    if (email.isEmpty() || pwd.isEmpty() || repwd.isEmpty()) {
                        out.println("<div class='errors'>Please fill in all the fields.</div>");
                    } else if (!pwd.equals(repwd)) {
                        out.println("<div class='errors'>Password and Confirm Password do not match.</div>");
                    } else if (email.toLowerCase().endsWith("@admin.com")) {
                        out.println("<div class='errors'>Take the permission from ADMIN to register as an ADMIN</div>");
                    } else {
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");
                            PreparedStatement checkEmailPS = conn.prepareStatement("SELECT COUNT(*) AS count FROM registration WHERE email = ?");
                            checkEmailPS.setString(1, email);
                            ResultSet checkEmailResult = checkEmailPS.executeQuery();
                            checkEmailResult.next();
                            int emailCount = checkEmailResult.getInt("count");
                            checkEmailResult.close();
                            if (emailCount > 0) {
                                if (email.toLowerCase().endsWith("@admin.com")) {
                                    out.println("<div class='errors'>This email address is not allowed.</div>");
                                } else {
                                    out.println("<div class='errors'>User with this email already exists.</div>");
                                }
                            } else {
                                PreparedStatement ps = conn.prepareStatement("INSERT INTO registration (email, password, confirmpassword) VALUES (?, ?, ?)");
                                ps.setString(1, email);
                                ps.setString(2, pwd);
                                ps.setString(3, repwd);
                                int x = ps.executeUpdate();
                                response.sendRedirect("login.jsp");
                            }
                            conn.close();
                        } catch (Exception e) {
                            out.println(e);
                        }
                    }
                }
            %>
        </div>
    </body>
</html>
