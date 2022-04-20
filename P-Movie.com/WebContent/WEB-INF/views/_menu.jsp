<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="home" value="/" />
<header class="header">
	<div class="container">
		<div class="header-area">
			<div class="logo">
				<a href="${home }index"><img src="assets/img/logo.png"
					alt="logo" /></a>
			</div>
			<div class="header-right">
				<form action="#"></form>
				<div class="mainmenu">
					<div class="responsive-menu"></div>
					<ul id="primary-menu">
						<c:if test="${ sessionScope.session.admin == true }"><li><a href="/P-Movie.com/admin">Manager</a></li></c:if>
						<li><a class="${activeYourProfile }" href="#">Welcome <c:if
									test="${empty sessionScope.session }">
									Guest
								</c:if> <c:if test="${not empty sessionScope.session }">
									${sessionScope.session.username }
									<i class="icofont icofont-simple-down"></i>
								</c:if>
						</a> <c:if test="${not empty sessionScope.session }">
								<ul>
									<li><a class="changepw-popup" href="#">Change password</a></li>
									<li><a class="${activeYourProfile }"
										href="${home }your-profile">Your profile</a></li>
								</ul>
							</c:if></li>
						<c:if test="${empty sessionScope.session }">
							<li><a class="login-popup" href="#">Sign in</a></li>
						</c:if>
						<c:if test="${not empty sessionScope.session }">
							<li><a href="${home }sign-out">Sign out</a></li>
						</c:if>
					</ul>
				</div>
			</div>
			<div class="menu-area pt-60">
				<div class="row justify-content-center">
					<c:if test="${not empty success }">
						<div class="alert alert-success alert-dismissible fade show"
							role="alert">
							${success}
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
					</c:if>
					<c:if test="${not empty error }">
						<div class="alert alert-danger alert-dismissible fade show"
							role="alert">
							${error}
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
					</c:if>
				</div>
				<div class="responsive-menu"></div>
				<div class="mainmenu">
					<ul id="primary-menu">
						<li><a class="${activeHome }" href="${home }index">Home</a></li>
						<li><a class="${activeMovies }" href="${home }movies">Movies</a></li>
						<li><a class="${activeBlogs }" href="${home }blogs">Blogs</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</header>