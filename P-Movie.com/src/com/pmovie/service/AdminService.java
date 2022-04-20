package com.pmovie.service;

import java.util.List;

import com.pmovie.dao.UserDAO;
import com.pmovie.model.User;

public class AdminService {
	
	static UserDAO uDAO = new UserDAO();
	
	public static List<User> loadTableUser() {
		List<User> users = uDAO.findAll();
		return users;
	}
	public static User loadUser(String id) {
		return uDAO.findById(id);
	}
	public static User reset() {
		User user = new User();
		return user;
	}
}
