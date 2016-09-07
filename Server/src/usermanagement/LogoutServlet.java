package usermanagement;

import hibernate.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by jonas on 18.08.2016.
 */
@WebServlet(name = "usermanagement.LogoutServlet", urlPatterns = "/logout")
public class LogoutServlet extends PreServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doPost(request, response);
        HttpSession session = request.getSession();

        User.logout((int) session.getAttribute("userId"));
        session.invalidate();

        // antwort generieren und an client schicken

        jsonObject.put("success", true);
        printWriter.write(jsonObject.toJSONString());
        printWriter.flush();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);

        HttpSession session = request.getSession();

        User.logout((int) session.getAttribute("userId"));
        session.invalidate();

        // antwort generieren und an client schicken

        jsonObject.put("success", true);
        printWriter.write(jsonObject.toJSONString());
        printWriter.flush();
    }
}
