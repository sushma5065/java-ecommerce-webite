import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/cart.jsp")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        String productId = request.getParameter("productid");
        String name = request.getParameter("productname");
        String description = request.getParameter("productdescription");
        String imageUrl = request.getParameter("productimage_url");
        String price = request.getParameter("productprice");
        String quantityStr = request.getParameter("quantity");
        int quantity = Integer.parseInt(quantityStr);
        String userEmail = (String) session.getAttribute("userEmail");
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");
            stmt = conn.prepareStatement("INSERT INTO cart (productid, productname, productdescription, productimage_url, productprice, email, quantity) VALUES (?, ?, ?, ?, ?, ?, ?)");
            stmt.setString(1, productId);
            stmt.setString(2, name);
            stmt.setString(3, description);
            stmt.setString(4, imageUrl);
            stmt.setString(5, price);
            stmt.setString(6, userEmail);
            stmt.setInt(7, quantity);
            stmt.executeUpdate();
            String successMessage = "Product added to cart successfully.";
            request.setAttribute("successMessage", successMessage);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An error occurred. Please try again.");
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
        response.sendRedirect("cart.jsp");
    }
}
