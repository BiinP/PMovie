package com.pmovie.controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import com.pmovie.dao.UserDAO;
import com.pmovie.dao.VideoDAO;
import com.pmovie.model.User;
import com.pmovie.model.Video;
import com.pmovie.service.AdminService;
import com.pmovie.util.DateUtil;

/**
 * Servlet implementation class AdminServlet
 */
@MultipartConfig
@WebServlet({ "/admin/video-management", "/admin/video-management/edit/*", "/admin/video-management/insert",
		"/admin/video-management/update", "/admin/video-management/delete","/admin/video-management/reset"})
public class VideoManagementServlet extends HttpServlet {

	VideoDAO dao = new VideoDAO();
	Video video = new Video();
	int index, page;
	int pageSize = 10;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uri = req.getRequestURI();
		if (uri.contains("video-management/edit")) {
			String videoId = uri.substring(uri.lastIndexOf("/")+1);
			video = editVideo(req, resp, videoId);
			videomanager(req, resp);
		}
		else if (uri.contains("video-management/reset")) {
			video = reset(req, resp);
			videomanager(req, resp);
		}
		else {
			video = reset(req, resp);
			videomanager(req, resp);
			
		}
		loadTableVideo(req, resp);
		req.setAttribute("index", index);
		req.setAttribute("video", video);
		req.getRequestDispatcher("/WEB-INF/views/admin/index.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		String uri = req.getRequestURI();
		if(uri.contains("video-management/insert")) {
			insertVideo(req, resp);
			video = reset(req, resp);
			videomanager(req, resp);
		}
		else if(uri.contains("video-management/update")) {
			video = updateVideo(req, resp);
			videomanager(req, resp);
		}
		else if(uri.contains("video-management/delete")) {
			deleteVideo(req, resp);
			reset(req, resp);
			videomanager(req, resp);
		}
		loadTableVideo(req, resp);
		req.setAttribute("index", index);
		req.setAttribute("video", video);
		req.getRequestDispatcher("/WEB-INF/views/admin/index.jsp").forward(req, resp);
	}

	protected void videomanager(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("active", "active");
		req.setAttribute("managerActive", "active");
		req.setAttribute("videoActive", "active");
		req.setAttribute("view", "_video.jsp");
	}

	protected void loadTableVideo(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Long totalVideo = dao.totalVideo();
		int endPage = (int) (totalVideo / pageSize);
		if (totalVideo % pageSize != 0) {
			endPage++;
		}
		if (req.getParameter("page") != null) {
			page = Integer.parseInt(req.getParameter("page"));
		} else {
			page = 1;
		}
		List<Video> videos = dao.findPage(page, pageSize);
		req.setAttribute("videos", videos);
		req.setAttribute("endPage", endPage);
	}

	protected Video reset(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		video = new Video();
		index = -1;
		return video;
	}

	protected Video editVideo(HttpServletRequest req, HttpServletResponse resp, String videoId) throws ServletException, IOException {
		index = 1;
		video = dao.findById(videoId);
		return video;
	}
	
	protected void insertVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		if (dao.findById(id) != null) {
			req.setAttribute("error", "Video Exist " + id);
		} else {
			try {
				BeanUtils.populate(video, req.getParameterMap());
				File dir = new File(req.getServletContext().getRealPath("/photo/poster/"));
				if (!dir.exists()) {
					dir.mkdirs();
				}
				Part poster = req.getPart("poster");
				if (!Paths.get(poster.getSubmittedFileName()).getFileName().toString().equals("")) {
					File posterFile = new File(dir, video.getId() + ".jpg");
					poster.write(posterFile.getAbsolutePath());
					String posterName = video.getId() + ".jpg";
					System.out.println(posterFile.getAbsolutePath());
					video.setPoster(posterName);
				} else {
					video.setPoster("poster.png");
				}
				if(video.getDescription().equals("")) {
					video.setDescription(video.getTitle());
				}
				dao.Create(video);
				req.setAttribute("success", "Save Success!");
			} catch (Exception e) {
				// TODO: handle exception
				req.setAttribute("error", "Save Fail!");
			}
		}
	}
	protected void deleteVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String id = req.getParameter("id");
			dao.Delete(id);
			req.setAttribute("success", "Delete Success!");
		} catch (Exception e) {
			// TODO: handle exception
			req.setAttribute("error", "Delete Fail!");
		}
	}
	protected Video updateVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Video video = new Video();
		String photo = (dao.findById(req.getParameter("id")).getPoster());
		Date uploadDate = (dao.findById(req.getParameter("id")).getUploadDate());
		try {
			BeanUtils.populate(video, req.getParameterMap());
			video.setUploadDate(uploadDate);

			File dir = new File(req.getServletContext().getRealPath("/photo/poster/"));
			if (!dir.exists()) {
				dir.mkdirs();
			}
			Part poster = req.getPart("poster");
			if (!Paths.get(poster.getSubmittedFileName()).getFileName().toString().equals("")) {
				File posterFile = new File(dir, video.getId() + ".jpg");
				poster.write(posterFile.getAbsolutePath());
				String posterName = video.getId() + ".jpg";
				System.out.println(posterFile.getAbsolutePath());
				video.setPoster(posterName);
			} else {
				video.setPoster(photo);
			}
			if(video.getDescription().equals("")) {
				video.setDescription(video.getTitle());
			}
			dao.Update(video);
			req.setAttribute("success", "Update Success!");
		} catch (Exception e) {
			// TODO: handle exception
			req.setAttribute("error", "Update Fail!");
			e.printStackTrace();
		}
		return video;
	}

}
