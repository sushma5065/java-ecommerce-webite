<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.Date, javax.servlet.http.HttpSession"%>
<%
    if (session == null || session.getAttribute("userEmail") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User Profile</title>
        <link rel="icon" href="images/titlelogo.png" type="image/x-icon">
        <style>
            * {
                text-decoration: none;
            }

            .chat-container {
                display: flex;
                flex-direction: column;
                max-width: 40%;
                margin: 0 auto;
                padding: 20px;
            }

            .chat-box {
                border: 1px solid #ccc;
                border-radius: 5px;
                padding: 10px;
                max-height: 400px;
                overflow-y: scroll;
            }

            .message {
                border-radius: 5px;
                padding: 5px 10px;
                margin: 5px 0;
            }

            .user-message {
                background-color: #ffb3b3;
                color: black;
                width: 50%;
                margin-left: auto;
            }

            .admin-message {
                background-color: #f1f1f1;
                color: black;
                width: 50%;
                align-self: flex-start;
            }

            .formsendmsg {
                margin: 25px;
            }

            .formsendmsg input {
                padding: 10px;
                border-radius: 100px;
                width: 80%;
            }

            .submitbtn {
                padding: 10px;
                background-color: red;
                color: white;
                border-radius: 100px;
            }

            .submitbtn:hover {
                background-color: darkred;
            }
            .chat-box::-webkit-scrollbar {
                width: 10px;
            }

            .chat-box::-webkit-scrollbar-thumb {
                background-color: #888;
                border-radius: 5px;
            }

            .chat-box::-webkit-scrollbar-thumb:hover {
                background-color: #555;
            }
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />
        <h2 style="text-align: center;font-weight: 500">
            Chat With Us!
        </h2>
        <div class="chat-container">
            <div class="chat-box" id="chat-box">
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");
                        String sender = (String) session.getAttribute("userEmail");
                        String receiver = "karthik@admin.com";
                        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM chat WHERE (sender = ? AND receiver = ?) OR (sender = ? AND receiver = ?) ORDER BY timestamp ASC");
                        stmt.setString(1, sender);
                        stmt.setString(2, receiver);
                        stmt.setString(3, receiver);
                        stmt.setString(4, sender);
                        ResultSet rs = stmt.executeQuery();
                        while (rs.next()) {
                            String messageText = rs.getString("message");
                            String timestamp = rs.getString("timestamp");
                            String messageClass = rs.getString("sender").equals(sender) ? "user-message" : "admin-message";
                %>
                <div class="message <%= messageClass%>">
                    <span class="text"><%= messageText%></span><br />
                    <span class="timestamp"><%= timestamp%></span>
                </div>
                <%
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
            <div>
                <form style="display: flex;flex-direction: row;justify-content: space-evenly" class="formsendmsg" method="post" action="chatsend">
                    <input style="font-size:18px;font-family: 'Poppins', sans-serif;" type="text" placeholder="Send a message" name="message"/>
                    <button style="font-size:18px;font-family: 'Poppins', sans-serif;" class="submitbtn" type="submit">Send</button>
                </form>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
        <script>
            function scrollChatToBottom() {
                const chatBox = document.getElementById("chat-box");
                chatBox.scrollTop = chatBox.scrollHeight;
            }
            window.onload = function () {
                scrollChatToBottom();
            };
        </script>
    </body>
</html>
