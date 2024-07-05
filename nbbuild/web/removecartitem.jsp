<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
    String productId = request.getParameter("productId");
    String userEmail = (String) session.getAttribute("userEmail");

    if (userEmail != null && productId != null) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");

            stmt = conn.prepareStatement("DELETE FROM cart WHERE email = ? AND productid = ?");
            stmt.setString(1, userEmail);
            stmt.setString(2, productId);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
%>
