package com.pmovie.service;

import java.util.ArrayList;
import java.util.List;

import com.pmovie.dao.ReportDAO;
import com.pmovie.dao.VideoDAO;
import com.pmovie.model.Report;
import com.pmovie.model.Video;

public class IndexService {
	ReportDAO rDAO = new ReportDAO();
	VideoDAO vDAO = new VideoDAO();
	
	Video video = new Video();
	
	public List<Video> loadSlide() {
		List<Report> reports = rDAO.topFavorite(3);
		List<Video> videos = new ArrayList<Video>();
		for(Report report: reports) {
			String videoId = (String) report.getGroup();
			video = vDAO.findById(videoId);
			videos.add(video);
		}
		return videos;
	}
}
