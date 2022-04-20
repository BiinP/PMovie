package com.pmovie.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import com.pmovie.model.User;

public class UserDAO extends PMovieDAO<User, String> {

	@Override
	public void Delete(String id) {
		// TODO Auto-generated method stub
		User entity = em.find(User.class, id);
		try {
			em.getTransaction().begin();
			em.remove(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}

	@Override
	public List<User> findAll() {
		String jpql = "SELECT o FROM User o";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		return query.getResultList();
	}

	@Override
	public User findById(String id) {
		return em.find(User.class, id);
	}
	
	public User findUser(String us, String pw) {
		String jpql = "SELECT u FROM User u WHERE u.username =:us and u.password =:pw";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		query.setParameter("us", us);
		query.setParameter("pw", pw);
		return query.getSingleResult();
	}
	public List<User> findByFullname(String fullname){
		String jpql = "SELECT u FROM User u WHERE u.fullname LIKE :fullname";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		query.setParameter("fullname", "%"+fullname+"%");
		return query.getResultList();
	}
	public Long totalUser() {
		String jpql = "SELECT COUNT(u) FROM User u";
		TypedQuery<Long> query = em.createQuery(jpql, Long.class);
		return query.getSingleResult();
	}
	public Long totalUserMonth(int month) {
		String jpql = "SELECT COUNT(u) FROM User u WHERE MONTH(u.createDate) = :month";
		TypedQuery<Long> query = em.createQuery(jpql, Long.class);
		query.setParameter("month", month);
		return query.getSingleResult();
	}
}
