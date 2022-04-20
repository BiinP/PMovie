package com.pmovie.dao;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.pmovie.model.Video;

public class VideoDAO extends PMovieDAO<Video, String>{

	@Override
	public void Delete(String id) {
		Video video = em.find(Video.class, id);
		try {
			em.getTransaction().begin();
			em.remove(video);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
		
	}

	@Override
	public List<Video> findAll() {
		String jpql = "SELECT o FROM Video o";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		return query.getResultList();
	}

	@Override
	public Video findById(String id) {
		return em.find(Video.class, id);
	}
	
	public List<Video> findByName(String keyword){
		String jpql = "SELECT o FROM Video o WHERE o.title LIKE :keyword";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		query.setParameter("keyword", "%"+keyword+"%");
		return query.getResultList();
	}
	public List<Video> lastestVideo(){
		String jpql = "SELECT o FROM Video o ORDER BY o.uploadDate DESC";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		query.setMaxResults(10);
		return query.getResultList();
	}
	public List<Video> randomVideo(int so){
		TypedQuery<Video> query = em.createNamedQuery("Video.random", Video.class);
		query.setMaxResults(so);
		return query.getResultList();
	}
	public Long totalVideo() {
		String jpql = "SELECT COUNT(v) FROM Video v";
		TypedQuery<Long> query = em.createQuery(jpql, Long.class);
		return query.getSingleResult();
	}
	public List<Video> findPage(int page, int pageSize){
		String jpql = "SELECT o FROM Video o ORDER BY o.id ASC";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		query.setFirstResult(page * pageSize - (pageSize));
		query.setMaxResults(pageSize);
		return query.getResultList();
	}
}
