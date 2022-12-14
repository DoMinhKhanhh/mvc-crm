package mvcproject.java11.crm.filter;

import mvcproject.java11.crm.urls.UrlsController;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebFilter(filterName = "auth-filter", urlPatterns = {UrlsController.URL_ALL})
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;


        if (isLogged(req) || isUrlLogin(req)) {
            System.out.println("#INFO " + new Date() + " - ServletPath :" + req.getServletPath() //
                    + ", URL =" + req.getRequestURL());
            chain.doFilter(request, response);
        } else {
            resp.sendRedirect(req.getContextPath() + UrlsController.URL_LOGIN);
        }

    }

    private boolean isUrlLogin(HttpServletRequest req) {
        return req.getServletPath().startsWith("/login");
    }

    private boolean isLogged(HttpServletRequest req) {
        return req.getSession().getAttribute("logging") != null;
    }

}
