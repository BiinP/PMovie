package com.pmovie.controller.admin;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.pmovie.dao.FavoriteDAO;
import com.pmovie.dao.ReportDAO;
import com.pmovie.model.Report;

/**
 * Servlet implementation class DataServlet
 */
@WebServlet({"/data","/newfile"})
public class DataServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if(uri.contains("newfile")) {
			req.getRequestDispatcher("/WEB-INF/views/admin/NewFile.jsp").forward(req, resp);
		}else {
			likeMonth(req, resp);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	protected void likeMonth(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReportDAO rdao = new ReportDAO();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		String datefm = sdf.format(date);
		String month = datefm.substring(3, 5);
		List<Report> reports = rdao.favoriteMonth(Integer.valueOf(month));
		String JSON = new Gson().toJson(reports);
		resp.setContentType("text/plain");
		resp.getWriter().write(JSON);
	}
	protected void userMonth(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReportDAO rdao = new ReportDAO();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		String datefm = sdf.format(date);
		String month = datefm.substring(3, 5);
		List<Report> reports = rdao.userMonth(Integer.valueOf(month));
		String JSON = new Gson().toJson(reports);
		resp.setContentType("text/plain");
		resp.getWriter().write(JSON);
	}

}
