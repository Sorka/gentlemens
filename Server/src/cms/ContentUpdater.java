package cms;

import hibernate.User;
import usermanagement.PreServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by jonas on 19.09.2016.
 */
@WebServlet(name = "ContentUpdater", urlPatterns="/update")
public class ContentUpdater extends PreServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        super.doPost(request, response);

        String content = request.getParameter("content");
        String pageName = request.getParameter("pageName");

        if(checkLoginState(request.getSession())) {
            ContentSaver contentSaver = new ContentSaver(pageName, content);
            contentSaver.save();

            jsonObject.put("success", true);

        } else {
            jsonObject.put("success", false);
        }

        printWriter.println(jsonObject.toJSONString());
        printWriter.flush();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private boolean checkLoginState(HttpSession session){
        int id = (int) session.getAttribute("userId");
        return User.isLoggedIn(id, session.getId());
    }
}
