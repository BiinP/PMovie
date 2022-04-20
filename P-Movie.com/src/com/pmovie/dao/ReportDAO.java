package com.pmovie.dao;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.pmovie.model.Favorite;
import com.pmovie.model.Report;
import com.pmovie.util.JPA;

public class ReportDAO{

	EntityManager em = JPA.getEntityManager();
	
	public List<Report> topFavorite(int top) {
		String jpql = "SELECT NEW Report(f.video.id, COUNT(f), min(f.likeDate), max(f.likeDate))"
				+ " FROM Favorite f GROUP BY f.video.id ORDER BY COUNT(f) DESC";
		TypedQuery<Report> query = em.createQuery(jpql, Report.class);
		query.setMaxResults(top);
		return query.getResultList();
	}
	public List<Report> favoriteMonth(int month){
		String jpql = "SELECT NEW Report(DAY(f.likeDate), COUNT(f), min(f.likeDate), max(f.likeDate)) "
				+ "FROM Favorite f WHERE MONTH(f.likeDate) = :month GROUP BY f.likeDate ORDER BY DAY(f.likeDate) ASC";
		TypedQuery<Report> query = em.createQuery(jpql, Report.class);
		query.setParameter("month", month);
		return query.getResultList();
	}
	public List<Report> userMonth(int month){
		String jpql = "SELECT NEW Report(DAY(f.createDate), COUNT(f), min(f.createDate), max(f.createDate)) "
				+ "FROM User f WHERE MONTH(f.createDate) = :month GROUP BY f.createDate ORDER BY DAY(f.createDate) ASC";
		TypedQuery<Report> query = em.createQuery(jpql, Report.class);
		query.setParameter("month", month);
		return query.getResultList();
	}
}
