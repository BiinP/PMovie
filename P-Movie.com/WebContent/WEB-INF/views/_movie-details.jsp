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
<section class="transformers-area">
			<div class="container">
				<div class="transformers-box">
					<div class="row flexbox-center">
						<div class="col-lg-5 text-lg-left text-center">
							<div class="detail-poster transformers-content">
								<img src="/P-Movie.com/photo/poster/${video.poster }" width="341px" height="471px" alt="about" />
							</div>
						</div>
						<div class="col-lg-7">
							<div class="transformers-content">
								<h2>${video.title }</h2>
								<ul>
									
									<li>
										<div class="transformers-left">
											Upload date: 
										</div>
										<div class="transformers-right">
											${video.uploadDate }
										</div>
									</li>
									<li>
										<div class="transformers-left">
											Views:
										</div>
										<div class="transformers-right">
											${video.views }
										</div>
									</li>
									<li>
										<div class="transformers-left">
											Share:
										</div>
										<div class="transformers-right">
											<a href="#"><i class="icofont icofont-social-facebook"></i></a>
											<a href="#"><i class="icofont icofont-social-google-plus"></i></a>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<c:if test="${not empty sessionScope.session }">
						<c:set var="bool" value="false"></c:set>
										<c:forEach var="item1" items="${favorites }">
											<c:if test="${video.id == item1.video.id }">
												<c:set var="bool" value="true"></c:set>
											</c:if>
										</c:forEach>
										<c:if test="${bool }">
											<a href="/P-Movie.com/unlike?id=${video.id }&uri=/watches?id=${video.id}" class="theme-btn1 theme-btn"><i class="icofont icofont-heart-beat"></i> UNLIKE</a>
										</c:if>
										<c:if test="${not bool }">
											<a href="/P-Movie.com/like?id=${video.id }&uri=/watches?id=${video.id}" class="theme-btn1 theme-btn"><i class="icofont icofont-heart"></i> LIKE</a>
										</c:if>
					</c:if>
					<a href="https://www.youtube.com/watch?v=${video.id }" class="theme-btn popup-youtube"> WATCH</a>
				</div>
			</div>
		</section><!-- transformers area end -->
		<!-- details area start -->
		<section class="details-area">
			<div class="container">
				<div class="row">
					<div class="col-lg-9">
						<div class="details-content">
							<div class="details-overview">
								<h2>Description</h2>
								<p>${video.description }</p>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</section><!-- details area end -->