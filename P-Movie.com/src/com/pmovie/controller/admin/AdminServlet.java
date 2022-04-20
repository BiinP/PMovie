package com.pmovie.controller.admin;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.pmovie.dao.FavoriteDAO;
import com.pmovie.dao.ReportDAO;
import com.pmovie.dao.UserDAO;
import com.pmovie.dao.VideoDAO;
import com.pmovie.model.Report;
import com.pmovie.model.Video;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet({"/admin","/admin/likemonth/chart","/admin/usermonth/chart"})
public class AdminServlet extends HttpServlet {
	UserDAO udao = new UserDAO();
	VideoDAO vdao = new VideoDAO();
	ReportDAO rdao = new ReportDAO();
	FavoriteDAO fdao = new FavoriteDAO();
	
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	String datefm = sdf.format(date);
	int month = Integer.valueOf(datefm.substring(3, 5));
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if(uri.contains("/admin/likemonth/chart")) {
			likeMonth(req, resp);
		}
		if(uri.contains("/admin/usermonth/chart")) {
			userMonth(req, resp);
		}
		else {
			
			req.setAttribute("video", new Video());
			req.setAttribute("active", "active");
			req.setAttribute("homeActive", "active");
			req.setAttribute("view", "_home.jsp");
			req.setAttribute("totalUser", udao.totalUser());
			req.setAttribute("totalVideo", vdao.totalVideo());
			req.setAttribute("totalFavorite", fdao.totalFavorite());
			Long userChange = udao.totalUserMonth(month);
			req.setAttribute("userChange", userChange);
			Long favoriteChange = fdao.totalFavoriteMonth(month);
			req.setAttribute("favoriteChange", favoriteChange);
			loadTop10Video(req, resp);
			req.getRequestDispatcher("/WEB-INF/views/admin/index.jsp").forward(req, resp);}
		}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected void likeMonth(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Report> reports = rdao.favoriteMonth(month);
		String JSON = new Gson().toJson(reports);
		resp.setContentType("text/plain");
		resp.getWriter().write(JSON);
	}
	protected void userMonth(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Report> reports = rdao.userMonth(month);
		String JSON = new Gson().toJson(reports);
		resp.setContentType("text/plain");
		resp.getWriter().write(JSON);
	}
	protected void loadTop10Video(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Report> reports = rdao.topFavorite(10);
		List<Video> videos = new ArrayList<Video>();
		List<Integer> likes = new ArrayList<Integer>();
		for(Report report: reports) {
			Video video = vdao.findById((String) report.getGroup());
			int like = video.getFavorites().size();
			System.out.println(like);
			likes.add(like);
			videos.add(video);
		}
		req.setAttribute("top10", videos);
		req.setAttribute("likes", likes);
	}
}
