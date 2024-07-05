import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SendMessageServlet")
public class chatsend extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String message = request.getParameter("message");
        String sender = (String) session.getAttribute("userEmail");
        String receiver = "karthik@admin.com";

        if (message != null && sender != null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");
                String sql = "INSERT INTO chat (sender, receiver, message, timestamp) VALUES (?, ?, ?, NOW())";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, sender);
                ps.setString(2, receiver);
                ps.setString(3, message);
                ps.executeUpdate();
                ps.close();
                conn.close();
                response.sendRedirect("chat.jsp");
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                response.setStatus(500);
            }
        }
    }
}
