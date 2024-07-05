<%@ page import="javax.servlet.http.HttpSession"%>
<%
    if (session != null && session.getAttribute("userEmail") != null) {
        session.invalidate();
    }
    response.sendRedirect("login.jsp");
%>
