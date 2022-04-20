package com.pmovie.listener;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class AppListener
 *
 */
@WebListener
public class AppListener implements ServletContextListener, HttpSessionListener {
	
    public void contextDestroyed(ServletContextEvent e)  { 
         // TODO Auto-generated method stub
    	ServletContext application = e.getServletContext();
    	Integer visitor = (Integer) application.getAttribute("visitor");
    	try {
			String path = application.getRealPath("/doc/visitor.txt");
			System.out.println(path);
			byte[] data = String.valueOf(visitor).getBytes();
			Files.write(Paths.get(path), data, StandardOpenOption.CREATE);
			System.out.println("contextDestroyed "+visitor);
		} catch (Exception e2) {
			// TODO: handle exception
		}
    }


    public void contextInitialized(ServletContextEvent e)  { 
         // TODO Auto-generated method stub
    	ServletContext application = e.getServletContext();
    	Integer visitor = 0;
    	try {
    		String path = application.getRealPath("/doc/visitor.txt");
			System.out.println(path);
			List<String> lines = Files.readAllLines(Paths.get(path));
			visitor = Integer.valueOf(lines.get(0));
			System.out.println("contextInitialized "+visitor);
		} catch (Exception e2) {
			// TODO: handle exception
			visitor = 10;
		}
    	application.setAttribute("visitor", visitor);
    }

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		HttpSession session = se.getSession();
		ServletContext application = session.getServletContext();
		Integer visitor = (Integer) application.getAttribute("visitor");
		System.out.println("sessionCreated "+visitor);
		application.setAttribute("visitor", visitor+1);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		
		
	}
	
}
