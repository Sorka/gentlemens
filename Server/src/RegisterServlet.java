import javax.servlet.annotation.WebServlet;
import java.io.IOException;

/**
 * Created by jonas on 18.08.2016.
 */
@WebServlet(name = "RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends PreServlet {


    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        super.doPost(request, response);

        String username = request.getParameter("usernameReg");
        String password = request.getParameter("passwordReg");
        String email = request.getParameter("email");

        Boolean success = User.register(username, password, email);


    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
