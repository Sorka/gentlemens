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

        String username = request.getParameter("usernameReg");
        String password = request.getParameter("passwordReg");
        String email = request.getParameter("email");

        User user = null;
        try {
            user = User.register(username, password, email);
        } catch (CIInvalidCharNameException e) {
            e.printStackTrace();
        } catch (CITooShortNameException e) {
            e.printStackTrace();
        } catch (CIInvalidCharPwException e) {
            e.printStackTrace();
        } catch (CITooShortPwException e) {
            e.printStackTrace();
        }


        boolean success = (user!=null);

        jsonObject.put("success", success);
        printWriter.println(jsonObject.toString());
        printWriter.flush();
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
