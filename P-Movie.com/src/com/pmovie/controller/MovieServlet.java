package com.pmovie.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pmovie.dao.FavoriteDAO;
import com.pmovie.dao.ReportDAO;
import com.pmovie.dao.UserDAO;
import com.pmovie.dao.VideoDAO;
import com.pmovie.model.Favorite;
import com.pmovie.model.Report;
import com.pmovie.model.User;
import com.pmovie.model.Video;

/**
 * Servlet implementation class MovieServlet
 */
@WebServlet({ "/movies", "/watches", "/like","/unlike" })
public class MovieServlet extends HttpServlet {

	VideoDAO vdao = new VideoDAO();
	UserDAO udao = new UserDAO();
	ReportDAO rdao = new ReportDAO();
	FavoriteDAO fdao = new FavoriteDAO();
	int pageSize = 10;
	int page;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("watches")) {
			detailVideo(req, resp);
			detail(req, resp);
		} else if(uri.contains("/like")) {
			addToFavorite(req, resp);
		}
		else if(uri.contains("/unlike")) {
			deleteFavorite(req, resp);
		}
		else {
			loadVideo(req, resp);
			lastestVideo(req, resp);
			movie(req, resp);
		}
	}

	protected void detail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("activeMovies", "active");
		req.setAttribute("view", "_movie-details.jsp");
		req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);
	}

	protected void movie(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("activeMovies", "active");
		req.setAttribute("view", "_movies.jsp");
		req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);
	}

	protected void loadVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getSession().getAttribute("session") != null) {
			User user = (User) req.getSession().getAttribute("session");
			List<Favorite> favorites = fdao.getMyFavorite(user.getUsername());
			req.setAttribute("favorites", favorites);
		}
		Long totalVideo = vdao.totalVideo();
		int endPage = (int) (totalVideo / pageSize);
		if (totalVideo % pageSize != 0) {
			endPage++;
		}
		if (req.getParameter("page") != null) {
			page = Integer.parseInt(req.getParameter("page"));
		} else {
			page = 1;
		}
		List<Video> videos = vdao.findPage(page, pageSize);
		req.setAttribute("endPage", endPage);
		req.setAttribute("allVideo", videos);
	}

	protected void detailVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getSession().getAttribute("session") != null) {
			User user = (User) req.getSession().getAttribute("session");
			List<Favorite> favorites = fdao.getMyFavorite(user.getUsername());
			req.setAttribute("favorites", favorites);
		}
		String id = req.getParameter("id");
		Video video = vdao.findById(id);
		req.setAttribute("video", video);
	}

	protected void lastestVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Video> videos = vdao.lastestVideo();
		req.setAttribute("lastestVideo", videos);
	}

	protected void addToFavorite(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String id = req.getParameter("id");
		String page = req.getParameter("uri");
		Video video = new Video();
		User user = (User) req.getSession().getAttribute("session");
		video.setId(id);
		Favorite favorite = new Favorite();
		favorite.setUser(user);
		favorite.setVideo(video);
		try {
			fdao.Create(favorite);
			req.setAttribute("success", "Like video success");
		} catch (Exception e) {
			// TODO: handle exception
			req.setAttribute("error", "Like video fail");
		}
		req.getRequestDispatcher(page).forward(req, resp);
	}
	protected void deleteFavorite(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String id = req.getParameter("id");
		String page = req.getParameter("uri");
		User user = (User) req.getSession().getAttribute("session");
		try {
			Favorite favorite = fdao.findFavorite(user.getUsername(), id);
			fdao.Delete(favorite.getId());
			req.setAttribute("success", "UnLike video success");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			req.setAttribute("error", "UnLike video fail");
		}
		req.getRequestDispatcher(page).forward(req, resp);
	}

}
