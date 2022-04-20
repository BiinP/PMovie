package com.pmovie.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pmovie.dao.VideoDAO;
import com.pmovie.model.Video;

/**
 * Servlet Filter implementation class AppFilter
 */
@WebFilter({"/*","/watches"})
public class AppFilter implements HttpFilter{

	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String uri =req.getRequestURI();
		if(uri.contains("/watches")) {
			VideoDAO vdao = new VideoDAO();
			String videoId = req.getParameter("id");
			Video video = vdao.findById(videoId);
			video.setViews(video.getViews()+1);
			vdao.Update(video);
		}
		chain.doFilter(req, resp);
	}

}
