package com.pmovie.dao;

import java.util.List;

import javax.persistence.EntityManager;

import com.pmovie.util.JPA;

public abstract class PMovieDAO <EntityType, KeyType>{
	EntityManager em = JPA.getEntityManager();
	
	public void Create(Object entity) {
		 try {
			em.getTransaction().begin();;
			em.persist(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	 }
	
	public Object Update(Object entity) {
		try {
			em.getTransaction().begin();
			entity = em.merge(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
		return entity;
	}
	
	public abstract void Delete(KeyType id);
	public abstract List<EntityType> findAll();
	public abstract EntityType findById(KeyType id);
	
}
