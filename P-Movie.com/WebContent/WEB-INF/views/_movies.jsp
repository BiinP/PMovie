<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!-- breadcrumb area start -->
<section class="breadcrumb-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-area-content">
					<h1>Movies Page</h1>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- breadcrumb area end -->
<!-- portfolio section start -->
<section class="portfolio-area pt-60">
	<div class="container">
		<div class="row flexbox-center">
			<div class="col-lg-6 text-center text-lg-left">
				<div class="section-title">
					<h1>
						<i class="icofont icofont-movie"></i> All Video
					</h1>
				</div>
			</div>
			<div class="col-lg-6 text-center text-lg-right">
				<form action="">
					<input oninput="searchByName(this)" type="text" name="searchMovie"
						placeholder="Search..." class="mb-2" />
				</form>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col-lg-12">
				<div class="row portfolio-item" id="movie">
					<c:forEach var="item" items="${allVideo }">
						<div class="col-md-3 col-sm-6">
							<div class="single-portfolio">
								<div class="single-portfolio-img">
									<img class="posterfilm"
										src="/P-Movie.com/photo/poster/${item.poster }"
										alt="portfolio" />
									<c:if test="${not empty sessionScope.session }">
										<c:set var="bool" value="false"></c:set>
										<c:forEach var="item1" items="${favorites }">
											<c:if test="${item.id == item1.video.id }">
												<c:set var="bool" value="true"></c:set>
											</c:if>
										</c:forEach>
										<c:if test="${bool }">
											<a href="/P-Movie.com/unlike?id=${item.id }&uri=/movies"
											class="like"><i class="icofont icofont-heart-beat"></i></a>
										</c:if>
										<c:if test="${not bool }">
											<a href="/P-Movie.com/like?id=${item.id }&uri=/movies"
											class="like"><i class="icofont icofont-heart"></i></a>
										</c:if>
									</c:if>
								</div>
								<div class="portfolio-content">
									<h2 class="max-lines edit-font">
										<a href="/P-Movie.com/watches?id=${item.id }">${item.title }</a>
									</h2>
									<div class="review">
										<h4>${item.views }Views</h4>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="row portfolio-item m-auto">
					<nav aria-label="Page navigation example" class=" mt-3 ml-3">
						<ul class="pagination justify-content-center text-dark">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<c:forEach begin="1" end="${endPage }" varStatus="loop">
								<li class="page-item"><a class="page-link"
									href="/P-Movie.com/movies?page=${loop.index}">${loop.index }</a></li>
							</c:forEach>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>

			</div>

		</div>
	</div>
	</div>
</section>
<!-- portfolio section end -->
<!-- video section start -->
<section class="video ptb-90">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title pb-20">
					<h1>
						<i class="icofont icofont-film"></i> Lastest Video
					</h1>
				</div>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col-md-12">
				<div class="video-slider mt-20">
					<c:forEach var="item" items="${lastestVideo }">
						<div class="video-area">
							<img class="lastest-video"
								src="/P-Movie.com/photo/poster/${item.poster }" width="300px"
								height="300px" alt="video" /> <a
								href="/P-Movie.com/watches?id=${item.id }" class="like"> <i
								class="icofont icofont-ui-play"></i>
							</a>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>
	</div>
</section>
<!-- video section end -->