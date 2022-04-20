package com.pmovie.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.pmovie.dao.FavoriteDAO;
import com.pmovie.dao.UserDAO;
import com.pmovie.model.Favorite;
import com.pmovie.model.User;
import com.pmovie.model.Video;

/**
 * Servlet implementation class ProfileServlet
 */
@WebServlet({"/your-profile","/sign-in","/sign-out","/change-pw","/edit-profile"})
public class ProfileServlet extends HttpServlet {
	UserDAO udao = new UserDAO();
	FavoriteDAO fdao = new FavoriteDAO();
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameterMap().containsKey("error")) {
			String error = req.getParameter("error");
			req.setAttribute("error", error);
		}
		if(req.getParameterMap().containsKey("success")) {
			String success = req.getParameter("success");
			req.setAttribute("success", success);
			System.out.println("success= "+success);
		}
		String uri = req.getRequestURI();
		if(uri.contains("sign-out")){
			signout(req, resp);
			resp.sendRedirect("/P-Movie.com/index");
		}else {
			myFavorite(req, resp);
			req.setAttribute("activeYourProfile", "active");
			req.setAttribute("view", "_your-profile.jsp");
			req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if(uri.contains("sign-in")) {
			signin(req, resp);
		}else if(uri.contains("change-pw")){
			changePassword(req, resp);
		}else if(uri.contains("edit-profile")) {
			editProfile(req, resp);
		}
	}
	protected void signin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		System.out.println(username);
		System.out.println(password);
		try {
			User user = udao.findUser(username, password);
			req.getSession().setAttribute("session", user);
			resp.sendRedirect("/P-Movie.com/index?success="+resp.encodeURL("Login success"));
		} catch (Exception e) {
			resp.sendRedirect("/P-Movie.com/index?error="+resp.encodeURL("Login fail"));
		}
	}
	protected void changePassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String password2 = req.getParameter("password2");
		
		try {
			User user = udao.findUser(username, password);
			user.setPassword(password2);
			User user1 = (User) udao.Update(user);
			req.getSession().removeAttribute("session");
			req.getSession().setAttribute("session", user1);
			resp.sendRedirect("/P-Movie.com/index?success="+resp.encodeURL("Change password success"));
		} catch (Exception e) {
			// TODO: handle exception
			resp.sendRedirect("/P-Movie.com/index?error="+resp.encodeURL("Change password fail"));
		}
		
	}
	protected void signout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getSession().removeAttribute("session");
	}
	protected void editProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		User session = (User) req.getSession().getAttribute("session"); 
		User user = new User();
		try {
			BeanUtils.populate(user, req.getParameterMap());
			user.setPassword(session.getPassword());
			user.setAvatar(session.getAvatar());
			user.setAdmin(session.isAdmin());
			udao.Update(user);
			resp.sendRedirect("/P-Movie.com/your-profile?success="+resp.encodeURL("Edit profile success"));
		} catch (Exception e) {
			resp.sendRedirect("/P-Movie.com/your-profile?error="+resp.encodeURL("Edit profile fail"));
			e.printStackTrace();
		} 
	}
	protected void myFavorite(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = (User) req.getSession().getAttribute("session");
		List<Favorite> favorites = fdao.getMyFavorite(user.getUsername());
		req.setAttribute("favorites", favorites);
	}

}
