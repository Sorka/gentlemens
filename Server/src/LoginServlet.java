import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by jonas on 18.08.2016.
 */
@WebServlet(name = "LoginServlet", urlPatterns="/login")
public class LoginServlet extends PreServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doPost(request, response);
        // Daten vom Request auslesen
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // login ausführen
        HttpSession session = request.getSession();
        int id = User.login(username, password, session.getId());
        boolean success = (id > -1);

        if(success){
            // userId zur session hinzufügen und session cookie setzen
            request.getSession().setAttribute("userId", id);
        }

        // antwort generieren und an client schicken
        jsonObject.put("success", success);
        printWriter.write(jsonObject.toJSONString());
        printWriter.flush();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
