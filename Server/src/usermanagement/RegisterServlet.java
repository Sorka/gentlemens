package usermanagement;

import hibernate.User;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import exceptions.*;

/**
 * Created by jonas on 18.08.2016.
 */
@WebServlet(name = "usermanagement.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends PreServlet {

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        super.doPost(request, response);

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        User user = null;
        try {
            user = User.register(username, password, email);
            if(user == null) {
                jsonObject.put("message", "register method returned null");
            }
        } catch (CIInvalidCharNameException e) {
            e.printStackTrace();
            jsonObject.put("message", e.getMessage());
        } catch (CITooShortNameException e) {
            e.printStackTrace();
            jsonObject.put("message", e.getMessage());
        } catch (CIInvalidCharPwException e) {
            e.printStackTrace();
            jsonObject.put("message", e.getMessage());
        } catch (CITooShortPwException e) {
            e.printStackTrace();
            jsonObject.put("message", e.getMessage());
        }


        boolean success = (user!=null);

        jsonObject.put("success", success);
        printWriter.println(jsonObject.toString());
        printWriter.flush();
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
