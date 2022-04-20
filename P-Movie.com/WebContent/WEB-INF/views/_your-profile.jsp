<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="breadcrumb-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-area-content">
					<h1>Your Profile</h1>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- breadcrumb area end -->
<!-- transformers area start -->
<section class="transformers-area">
	<div class="container">
		<form action="/P-Movie.com/edit-profile" ng-controller="edit-profile"
			name="frmEditUser" method="post">
			<div class="transformers-box">
				<div class="row flexbox-center">
					<div class="col-lg-5 text-lg-left text-center">
						<div class="transformers-content">
							<img
								src="/P-Movie.com/photo/avatar/${sessionScope.session.avatar }"
								alt="about" />
						</div>
					</div>
					<div class="col-lg-7">
						<div class="transformers-content mtr-30">
							<h2>${sessionScope.session.username }</h2>
							<a href="#" class="${sessionScope.session.admin ? "theme-btn" :"" }">Admin</a>
							<a href="#" class="${sessionScope.session.admin ? "":"theme-btn" }">User</a>
							<ul>
								<li>
									<div class="transformers-left">Username:</div>
									<div class="transformers-right">
										<input class="form-control bg-dark" type="text"
											name="username" ng-model="username" readonly>
									</div>
								</li>
								<li>
									<div class="transformers-left">Fullname:</div>
									<div class="transformers-right">
										<div ng-show="frmEditUser.fullname.$invalid"
											class="badge badge-danger font-italic mb-2">Fullname
											not null</div>
										<input class="form-control" type="text" name="fullname"
											ng-model="fullname" required>

									</div>
								</li>
								<li>
									<div class="transformers-left">Email:</div>
									<div class="transformers-right">
										<div ng-show="frmEditUser.email.$invalid"
											class="badge badge-danger font-italic mb-2">Email not
											null</div>
										<input class="form-control" type="text" name="email"
											ng-model="email" required>

									</div>
								</li>

								<li>
									<div class="transformers-left">Follow:</div>
									<div class="transformers-right">
										<a href="#"><i class="icofont icofont-social-facebook"></i></a>
										<a href="#"><i class="icofont icofont-social-twitter"></i></a>
										<a href="#"><i class="icofont icofont-social-google-plus"></i></a>
										<a href="#"><i class="icofont icofont-youtube-play"></i></a>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<button class="theme-btn btn" ng-disabled="frmEditUser.$invalid">
					<i class="icofont icofont-edit"></i> EDIT
				</button>
			</div>
		</form>
	</div>
</section>
<!-- transformers area end -->
<!-- details area start -->
<section class="details-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="details-content">
					<div class="details-overview">
						<h2>Favorite</h2>
						<div class="row portfolio-item">
							<c:forEach var="item" items="${favorites }">
								<div class="col-lg-3 col-md-4 col-sm-6 soon released">
									<div class="single-portfolio">
										<div class="single-portfolio-img">
											<img class="posterfilm" src="/P-Movie.com/photo/poster/${item.video.poster }"
												alt="portfolio" />
												
											<c:if test="${not empty sessionScope.session }">
													<a href="/P-Movie.com/unlike?id=${item.video.id }&uri=/your-profile"
													class="like"><i class="icofont icofont-heart-beat"></i></a>
											</c:if>
										</div>
										<div class="portfolio-content">
											<h2 class="max-lines edit-font">
												<a href="/P-Movie.com/watches?id=${item.video.id }">${item.video.title }</a>
											</h2>
											<div class="review">
												<h4>${item.video.views } views</h4>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
					</div>

				</div>
			</div>
			<!-- <div class="col-lg-3 text-center text-lg-left">
					<div class="portfolio-sidebar">
						<img src="assets/img/sidebar/sidebar1.png" alt="sidebar" />
						<img src="assets/img/sidebar/sidebar2.png" alt="sidebar" />
						<img src="assets/img/sidebar/sidebar4.png" alt="sidebar" />
					</div>
				</div> -->
		</div>
	</div>
</section>