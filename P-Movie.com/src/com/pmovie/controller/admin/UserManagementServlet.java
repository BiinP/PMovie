package com.pmovie.controller.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
import com.pmovie.model.User;
import com.pmovie.model.Video;
import com.pmovie.util.DateUtil;

/**
 * Servlet implementation class UserManagementServlet
 */
@MultipartConfig
@WebServlet({ "/admin/user-management", "/admin/user-management/edit/*", "/admin/user-management/insert",
		"/admin/user-management/update", "/admin/user-management/delete", "/admin/user-management/reset"
		 })
public class UserManagementServlet extends HttpServlet {

	UserDAO dao = new UserDAO();
	User user = new User();
	Video video = new Video();
	int index;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("/user-management/edit")) {
			String username = uri.substring(uri.lastIndexOf("/") + 1);
			user = editUser(req, resp, username);
			System.out.println(user.getEmail());
			usermanager(req, resp);
		} else if (uri.contains("reset")) {
			user = reset(req, resp);
			usermanager(req, resp);
		} else {
			index = -1;
			user = reset(req, resp);
			usermanager(req, resp);
		}

		loadUserTable(req, resp);
		req.setAttribute("index", index);
		req.setAttribute("video", video);
		req.setAttribute("user", user);
		req.getRequestDispatcher("/WEB-INF/views/admin/index.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");

		String uri = req.getRequestURI();
		if (uri.contains("/user-management/insert")) {
			insert(req, resp);
			user = reset(req, resp);
			usermanager(req, resp);
		} else if (uri.contains("/user-management/update")) {
			user = update(req, resp);
			usermanager(req, resp);
		} else if (uri.contains("/user-management/delete")) {
			delete(req, resp);
			user = reset(req, resp);
			usermanager(req, resp);
		}

		loadUserTable(req, resp);
		req.setAttribute("index", index);
		req.setAttribute("video", video);
		req.setAttribute("user", user);
		req.getRequestDispatcher("/WEB-INF/views/admin/index.jsp").forward(req, resp);
	}

	protected void usermanager(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("active", "active");
		req.setAttribute("managerActive", "active");
		req.setAttribute("userActive", "active");
		req.setAttribute("view", "_user.jsp");
	}

	protected void loadUserTable(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<User> users = dao.findAll();
		req.setAttribute("users", users);
	}

	protected User editUser(HttpServletRequest req, HttpServletResponse resp, String username)
			throws ServletException, IOException {
		index = 1;
		user = dao.findById(username);
		return user;
	}

	protected User reset(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		index = -1;
		user = new User();
		return user;
	}

	protected void insert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = new User();
		String username = req.getParameter("username");
		if (dao.findById(username) != null) {
			req.setAttribute("error", "User Exist " + username);
		} else {
			try {
				BeanUtils.populate(user, req.getParameterMap());
				File dir = new File(req.getServletContext().getRealPath("/photo/avatar/"));
				if (!dir.exists()) {
					dir.mkdirs();
				}
				System.out.println(dir.toString());
				Part avatar = req.getPart("avatar");
				if (!avatar.getSubmittedFileName().equals("")) {
					File avatarFile = new File(dir, user.getUsername() + ".jpg");
					avatar.write(avatarFile.getAbsolutePath());
					String avatarName = user.getUsername() + ".jpg";
					user.setAvatar(avatarName);
				}
				dao.Create(user);
				req.setAttribute("success", "Save Success!");
			} catch (Exception e) {
				// TODO: handle exception
				req.setAttribute("error", "Save Fail!");
			}
		}
	}

	protected User update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = new User();
		String photo = (dao.findById(req.getParameter("username")).getAvatar());
		Date createDate = (dao.findById(req.getParameter("username")).getCreateDate());
		try {
			BeanUtils.populate(user, req.getParameterMap());
			user.setCreateDate(createDate);

			File dir = new File(req.getServletContext().getRealPath("/photo/avatar/"));
			if (!dir.exists()) {
				dir.mkdirs();
			}
			System.out.println(dir.toString());
			Part avatar = req.getPart("avatar");
			if (!avatar.getSubmittedFileName().equals("")) {
				File avatarFile = new File(dir, user.getUsername() + ".jpg");
				avatar.write(avatarFile.getAbsolutePath());
				String avatarName = user.getUsername() + ".jpg";
				user.setAvatar(avatarName);
			} 
			else {
				user.setAvatar(photo);
			}
			dao.Update(user);
			System.out.println(dao.findById(user.getUsername()).getAvatar());
			req.setAttribute("success", "Update Success!");
		} catch (Exception e) {
			// TODO: handle exception
			req.setAttribute("error", "Update Fail!");
			e.printStackTrace();
		}
		return user;
	}

	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String username = req.getParameter("username");
			dao.Delete(username);
			req.setAttribute("success", "Delete Success!");
		} catch (Exception e) {
			// TODO: handle exception
			req.setAttribute("error", "Delete Fail!");
		}
	}

	

}
