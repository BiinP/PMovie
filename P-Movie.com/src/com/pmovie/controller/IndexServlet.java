package com.pmovie.controller;

import java.io.IOException;
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
 * Servlet implementation class IndexServlet
 */
@WebServlet({ "/index"})
public class IndexServlet extends HttpServlet {

	ReportDAO rdao =  new ReportDAO();
	VideoDAO vdao = new VideoDAO();
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
		loadSlide(req, resp);
		loadLastestVideo(req, resp);
		loadTop10Video(req, resp);
		recommendVideo(req, resp);
		req.setAttribute("activeHome", "active");
		req.setAttribute("view", "_home.jsp");

		req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
	}
	protected void loadSlide(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		if(req.getSession().getAttribute("session") != null) {
			User user = (User) req.getSession().getAttribute("session");
			List<Favorite> favorites = fdao.getMyFavorite(user.getUsername());
			req.setAttribute("favorites", favorites);
		}
		List<Report> reports = rdao.topFavorite(3);
		List<Video> videos = new ArrayList<Video>();
		for(Report report : reports) {
			Video video = vdao.findById((String) report.getGroup());
			videos.add(video);
		}
		req.setAttribute("videos", videos);
	}
	protected void loadLastestVideo(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Video> videos = vdao.lastestVideo();
		req.setAttribute("lastestVideo", videos);
	}
	protected void loadTop10Video(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Report> reports = rdao.topFavorite(10);
		List<Video> videos = new ArrayList<Video>();
		for(Report report: reports) {
			Video video = vdao.findById((String) report.getGroup());
			videos.add(video);
		}
		req.setAttribute("top10", videos);
	}
	protected void recommendVideo(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Video> videos = vdao.randomVideo(3);
		req.setAttribute("randomVideo", videos);
	}
	

}
