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
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
            body {
                font-family: 'Poppins', sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }
            .contactdiv {
                width: 30%;
                margin: 100px auto;
                background-color: #fff;
                border-radius: 8px;
                padding: 20px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
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
            input[type="text"], textarea {
                width: 100%;
                padding: 18px;
                border: 1px solid #ccc;
                border-radius: 25px;
                box-sizing: border-box;
                margin-bottom: 10px;
                font-size: 18px;
            }
            textarea {
                resize: vertical;
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
            .contactdiv input, textarea, button {
                font-family: 'Poppins', sans-serif;
            }
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />
        <div class="contactdiv">
            <form action="https://api.web3forms.com/submit" method="post">
                <div>
                    <h1 style="text-align: center;">Contact Us</h1>
                </div>
                <div class="container">
                    <input type="hidden" name="access_key" value="e0b0e361-47cb-4866-8502-19d1033088c1">
                    <input type="hidden" name="subject" value="New Submission from Web3Forms">
                    <input type="checkbox" name="botcheck" id="" style="display: none;">
                    <input type="text" placeholder="Your Name" name="name" required>
                    <input type="text" placeholder="Your Email" name="email" required>
                    <textarea rows="6" placeholder="Your Message" name="message" required></textarea>
                    <button type="submit">Send Message</button>
                </div>
            </form>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
