package com.pmovie.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pmovie.model.User;

/**
 * Servlet Filter implementation class AuthFilter
 */
@WebFilter({"/admin/*","/like","/your-profile","/change-pw","/edit-profile","/sign-out","/unlike"})
public class AuthFilter implements HttpFilter {

	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		String uri = req.getRequestURI();
		User user = (User) req.getSession().getAttribute("session");
		String error = "";
		if (user == null) {
			error = resp.encodeURL("Login Please!");
		} else if (!user.isAdmin() && uri.contains("/admin/")) {
			error = resp.encodeURL("For admin");
		}
		if (!error.isEmpty()) {
			req.getSession().setAttribute("securi", uri);
			resp.sendRedirect("/P-Movie.com/index?error=" + resp.encodeURL(error));
		} else {
			chain.doFilter(req, resp);
		}
	}

}
