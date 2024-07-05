<%@ page import="java.io.IOException, java.io.PrintWriter, java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException, java.text.SimpleDateFormat, java.util.Date" %>
<%
    String userReceiver = request.getParameter("userEmail"); // Get the user's email
    String adminEmail = (String) session.getAttribute("adminEmail"); // Get the admin's email
    String messageText = request.getParameter("message");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String timestamp = sdf.format(new Date());
    if (userReceiver == null || adminEmail == null || messageText == null
            || userReceiver.isEmpty() || adminEmail.isEmpty() || messageText.isEmpty()) {
        response.sendRedirect("adminuserchat.jsp?userEmail=" + userReceiver);
    } else {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");
            String query = "INSERT INTO chat (sender, receiver, message, timestamp) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, adminEmail);
            statement.setString(2, userReceiver);
            statement.setString(3, messageText);
            statement.setString(4, timestamp);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("adminuserchat.jsp?userEmail=" + userReceiver);
    }
%>
