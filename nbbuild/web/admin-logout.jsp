<%@ page import="javax.servlet.http.HttpSession"%>
<%
    if (session != null && session.getAttribute("adminEmail") != null) {
        session.invalidate();
    }
    response.sendRedirect("login.jsp");
%>
