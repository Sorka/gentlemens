import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * Created by Dennis on 19.09.2016.
 */
@WebFilter(filterName = "StaticContentFilter")
public class StaticContentFilter implements Filter {

    private RequestDispatcher defaultRequestDispatcher;

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        defaultRequestDispatcher.forward(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

        this.defaultRequestDispatcher = config.getServletContext().getNamedDispatcher("default");
    }

}
