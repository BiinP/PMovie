package com.pmovie.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JPA {
	private static EntityManagerFactory emf;

	public static EntityManager getEntityManager() {
		if (emf == null || !emf.isOpen()) {
			emf = Persistence.createEntityManagerFactory("PS19246_NguyenHoangPhuc_ASM_JAVA");
		}
		return emf.createEntityManager();
	}

	public static void shutdown() {
		if (emf != null || emf.isOpen()) {
			emf.close();
		}
		emf = null;
	}
}
