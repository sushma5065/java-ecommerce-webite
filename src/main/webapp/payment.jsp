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
        <!-- Include Font Awesome CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            .grid-container {
                display: flex;
                flex-direction: row;
                justify-content: space-evenly;
                padding: 25px;
                padding-top: 0px;
                justify-content: space-evenly;
                margin: 50px;
                font-weight: 500;
            }
            .payment h2{
                font-weight: 500;
            }
            .paymentform label{
                font-weight: 500;
            }
            .paymentform input{
                padding: 10px;
                width: 300px;
                border-radius: 50px;
                font-family: 'Poppins', sans-serif;
            }
            input[type="submit"] {
                width: 100%;
                padding: 18px;
                background-color: red;
                border: none;
                color: white;
                font-size: 15px;
            }
            input[type="submit"]:hover {
                transform: scale(1.03);
            }
            .disabled-form {
                pointer-events: none;
                opacity: 0.5;
            }
            /* Style for the message icon */
            .message-icon {
                font-size: 24px;
                color: red;
            }
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />
        <div class="grid-container">
            <div></div>
            <div class="payment">
                <h4 style="color: red;font-weight: 500;font-size: 18px"><i class="fas fa-exclamation-circle message-icon"></i> Currently not accepting any orders</h4>
                <h2>Payment</h2><br />
                <form class="paymentform disabled-form">
                    <label for="cardNumber">Card Number:</label><br>
                    <input type="number" id="cardNumber" name="cardNumber" placeholder="8068 XXXX XXXX XXXX" required disabled><br><br>
                    <label for="cardHolder">Card Holder Name:</label><br>
                    <input type="text" id="cardHolder" name="cardHolder" placeholder="Card Holder Name" required disabled><br><br>
                    <label for="expiryDate">Expiry Date:</label><br>
                    <input type="date" id="expiryDate" name="expiryDate" placeholder="DD / MM / YYYY" required disabled><br><br>
                    <label for="cvv">CVV:</label><br>
                    <input type="cvv" id="cvv" name="cvv"  placeholder="XXX" required disabled><br><br>
                    <input type="submit" value="Make Payment" disabled>
                </form>
            </div>
            <div></div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>