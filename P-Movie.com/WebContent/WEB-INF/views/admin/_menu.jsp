<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
	<c:url var="adminPage" value="/admin"/>
	<c:url var="home" value="/"/>
<nav id="sidebar">
	<!-- Sidebar Header-->
	<div class="sidebar-header d-flex align-items-center">
		<div class="avatar">
			<img src="/P-Movie.com/photo/avatar/${sessionScope.session.avatar }" alt="..."
				class="img-fluid rounded-circle">
		</div>
		<div class="title">
			<h1 class="h5">${sessionScope.session.fullname }</h1>
			<p>Admin</p>
		</div>
	</div>
	<!-- Sidebar Navidation Menus-->
	<span class="heading">Main</span>
	<ul class="list-unstyled">
		<li class="${homeActive }"><a href="${adminPage }"> <i class="icon-home"></i>Home
		</a></li>
		<li class="${managerActive }"><a href="#Management" aria-expanded="false"
			data-toggle="collapse"> <i class="icon-check"></i>Management
		</a>
			<ul id="Management" class="collapse list-unstyled ">
				<li class="${userActive }"><a href="${adminPage }/user-management"> <i class="icon-user"></i>User
				</a></li>
				<li class="${videoActive }"><a href="${adminPage }/video-management"> <i class="icon-picture"></i>Video
				</a></li>
				<li class="${blogActive }"><a href="index.html"> <i class="icon-page"></i>Blog
				</a></li>
			</ul></li>
		<li><a href="#Report" aria-expanded="false"
			data-toggle="collapse"> <i class="fa fa-bar-chart"></i>Report
		</a>
			<ul id="Report" class="collapse list-unstyled ">
				<li><a href="#"> <i class="icon-user"></i>User
				</a></li>
				<li><a href="#"> <i class="icon-picture"></i>Video
				</a></li>
				<li><a href="#"> <i class="icon-page"></i>Blog
				</a></li>
			</ul></li>
		
		</a></li>
	</ul>
	<span class="heading"></span>
	<ul class="list-unstyled">
		<li><a href="${home }index"> <i class="icon-logout"></i>Log out
		</a></li>
	</ul>
</nav>