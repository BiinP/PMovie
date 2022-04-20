package com.pmovie.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pmovie.dao.UserDAO;
import com.pmovie.dao.VideoDAO;
import com.pmovie.model.User;
import com.pmovie.model.Video;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet({"/movies/searchAjax","/admin/user-management/searchByFullname","/admin/user-management/searchByTitle"})
public class SearchServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if(uri.contains("searchByFullname")) {
			searchByFullname(req, resp);
		}else if(uri.contains("searchByTitle")) {
			searchByTitle(req, resp);
		}
		else {
			searchVideo(req, resp);
		}
	}
	protected void searchVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		String keyword = req.getParameter("searchMovie");
		VideoDAO vdao = new VideoDAO();
		List<Video> videos = vdao.findByName(keyword);
		PrintWriter out = resp.getWriter();
		for(Video video : videos) {
			out.println("<div class=\"col-md-3 col-sm-6\">\r\n"
					+ "							<div class=\"single-portfolio\">\r\n"
					+ "								<div class=\"single-portfolio-img\">\r\n"
					+ "									<img class=\"posterfilm\"\r\n"
					+ "										src=\"/P-Movie.com/photo/poster/"+video.getPoster()+"\"\r\n"
					+ "										alt=\"portfolio\" /> </a>\r\n"
					+ "								</div>\r\n"
					+ "								<div class=\"portfolio-content\">\r\n"
					+ "									<h2 class=\"max-lines edit-font\">\r\n"
					+ "										<a href=\"/P-Movie.com/watches?id="+video.getId()+"\">"+video.getTitle()+"</a>\r\n"
					+ "									</h2>\r\n"
					+ "									<div class=\"review\">\r\n"
					+ "										<h4>"+video.getViews()+"Views</h4>\r\n"
					+ "									</div>\r\n"
					+ "								</div>\r\n"
					+ "							</div>\r\n"
					+ "						</div>");
		}
	}
	protected void searchByTitle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		String titleSearch = req.getParameter("titleSearch");
		try {
			VideoDAO dao = new VideoDAO();
			List<Video> videos = dao.findByName(titleSearch);
			PrintWriter out = resp.getWriter();
			int loop = 0;
			for(Video video : videos) {
				out.println("<tr>\r\n"
						+ "														<th scope=\"row\">"+loop+"</th>\r\n"
						+ "														<td>"+video.getId()+"</td>\r\n"
						+ "														<td>"+video.getTitle()+"</td>\r\n"
						+ "														<td>"+video.getPoster()+"</td>\r\n"
						+ "														<td>"+(video.isActive()?"Activing":"Blocked")+"</td>\r\n"
						+ "														<td>"+video.getViews()+"</td>\r\n"
						+ "														<td>"+video.getUploadDate()+"</td>\r\n"
						+ "														<td><a class=\"btn btn-link text-secondary\"\r\n"
						+ "															href=\"/P-Movie.com/admin/video-management/edit/"+video.getId()+"\" role=\"button\">></a></td>\r\n"
						+ "													</tr>");
				loop++;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	protected void searchByFullname(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		String fullnameSearch = req.getParameter("fullnameSearch");
		try {
			UserDAO dao = new UserDAO();
			List<User> users = dao.findByFullname(fullnameSearch);
			PrintWriter out = resp.getWriter();
			int loop = 0;
			for(User user : users) {
				out.println("<tr>\r\n"
						+ "														<th scope=\"row\">"+loop+"</th>\r\n"
						+ "														<td>"+user.getUsername()+"</td>\r\n"
						+ "														<td>"+user.getFullname()+"</td>\r\n"
						+ "														<td>"+user.getEmail()+"</td>\r\n"
						+ "														<td>"+(user.isAdmin()?"Admin":"User")+"</td>\r\n"
						+ "														<td>"+(user.isActive()?"Activing":"Blocked")+"</td>\r\n"
						+ "														<td>"+user.getCreateDate()+"</td>\r\n"
						+ "														<td><a class=\"btn btn-link text-secondary\"\r\n"
						+ "															href=\"/P-Movie.com/admin/user-management/edit/"+user.getUsername()+"\" role=\"button\">></a></td>\r\n"
						+ "													</tr>");
				loop++;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
