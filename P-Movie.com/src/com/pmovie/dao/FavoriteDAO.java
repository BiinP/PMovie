package com.pmovie.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import com.pmovie.model.Favorite;
import com.pmovie.model.Video;

public class FavoriteDAO extends PMovieDAO<Favorite, Integer>{

	@Override
	public void Delete(Integer id) {
		// TODO Auto-generated method stub
		Favorite favorite = em.find(Favorite.class, id);
		try {
			em.getTransaction().begin();
			em.remove(favorite);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}

	@Override
	public List<Favorite> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Favorite findById(Integer id) {
		// TODO Auto-generated method stub
		return em.find(Favorite.class, id);
	}
	public Favorite findFavorite(String userId, String videoId) {
		String jpql = "SELECT f FROM Favorite f WHERE f.user.id =:userId and f.video.id =:videoId";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		query.setParameter("userId", userId);
		query.setParameter("videoId", videoId);
		return query.getSingleResult();
	}
	public List<Favorite> getMyFavorite(String userId){
		String jpql = "SELECT f FROM Favorite f WHERE f.user.id =:userId";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		query.setParameter("userId", userId);
		return query.getResultList();
	}
	public Long totalFavoriteMonth(int month) {
		String jpql = "SELECT COUNT(f) FROM Favorite f WHERE MONTH(f.likeDate) = :month";
		TypedQuery<Long> query = em.createQuery(jpql, Long.class);
		query.setParameter("month", month);
		return query.getSingleResult();
	}
	public Long totalFavorite() {
		String jpql = "SELECT COUNT(f) FROM Favorite f";
		TypedQuery<Long> query = em.createQuery(jpql, Long.class);
		return query.getSingleResult();
	}
}
