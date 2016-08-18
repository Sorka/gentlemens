import javax.servlet.annotation.WebServlet;
import java.io.IOException;

/**
 * Created by jonas on 18.08.2016.
 */
@WebServlet(name = "RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        String username = request.getParameter("usernameReg");
        String passwort = request.getParameter("passwordReg");
        String email = request.getParameter("email");
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
