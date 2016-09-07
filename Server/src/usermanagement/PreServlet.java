package usermanagement;

import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Jonas on 18.08.2016.
 */
@WebServlet(name = "usermanagement.PreServlet")
public class PreServlet extends HttpServlet {
    JSONObject jsonObject = new JSONObject();
    PrintWriter printWriter;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        printWriter = response.getWriter();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        printWriter = response.getWriter();
    }
}