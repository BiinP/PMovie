<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!-- hero area start -->
<section class="hero-area" id="home">
	<div class="container">
		<div class="hero-area-slider">
			<c:forEach var="item" items="${videos }">
				<div class="row hero-area-slide">
					<div class="col-lg-6 col-md-5">
						<div class="hero-area-content">
							<img class="slide mb-3"
								src="/P-Movie.com/photo/poster/${item.poster }" alt="about" />
						</div>
					</div>
					<div class="col-lg-6 col-md-7">
						<div class="hero-area-content pr-50">
							<h2>${item.title }</h2>
							<div class="review">
								<h4>${item.views }Views</h4>
							</div>
							<p>${item.description }</p>
							<div class="row">
								<div class="slide-trailor ml-3">
									<a class="theme-btn theme-btn2"
										href="/P-Movie.com/watches?id=${item.id }"><i
										class="icofont icofont-play"></i> Watches</a>
								</div>
								<div class="slide-trailor ml-3">
									<c:if test="${not empty sessionScope.session }">
										<c:set var="bool" value="false"></c:set>
										<c:forEach var="item1" items="${favorites }">
											<c:if test="${item.id == item1.video.id }">
												<c:set var="bool" value="true"></c:set>
											</c:if>
										</c:forEach>
										<c:if test="${bool }">
											<a class="theme-btn theme-btn2"
												href="/P-Movie.com/unlike?id=${item.id }&uri=/index"><i
												class="icofont icofont-heart-beat"></i>UnLike</a>
										</c:if>
										<c:if test="${not bool }">
											<a class="theme-btn theme-btn2"
												href="/P-Movie.com/like?id=${item.id }&uri=/index"><i
												class="icofont icofont-heart-beat"></i>Like</a>
										</c:if>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="hero-area-thumb">
			<div class="thumb-prev">
				<div class="row hero-area-slide">
					<div class="col-lg-6">
						<div class="hero-area-content">
							<img class="slide"
								src="/P-Movie.com/photo/poster/${videos[2].poster }" alt="about" />
						</div>
					</div>
					<div class="col-lg-6">
						<div class="hero-area-content pr-50">
							<h2>${videos[2].title }</h2>
							<div class="review">
								<h4>${videos[2].views }Views</h4>
							</div>
							<p>${videos[2].description }</p>
							<h3>Cast:</h3>
							<div class="slide-trailor">
								<a class="theme-btn theme-btn2" href="#"><i
									class="icofont icofont-play"></i>Watches</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="thumb-next">
				<div class="row hero-area-slide">
					<div class="col-lg-6">
						<div class="hero-area-content">
							<img class="slide"
								src="/P-Movie.com/photo/poster/${videos[1].poster }" alt="about" />
						</div>
					</div>
					<div class="col-lg-6">
						<div class="hero-area-content pr-50">
							<h2>${videos[1].title }</h2>
							<div class="review">
								<h4>${videos[1].views }Views</h4>
							</div>
							<p>${videos[1].description }</p>
							<h3>Cast:</h3>
							<div class="slide-trailor">
								<a class="theme-btn theme-btn2" href="#"><i
									class="icofont icofont-play"></i> Watches</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- hero area end -->
<!-- portfolio section start -->
<section class="portfolio-area pt-60">
	<div class="container">
		<div class="row flexbox-center">
			<div class="col-lg-6 text-center text-lg-left">
				<div class="section-title">
					<h1>
						<i class="icofont icofont-movie"></i> Spotlight This Month
					</h1>
				</div>
			</div>
			<div class="col-lg-6 text-center text-lg-right">
				<div class="portfolio-menu">
					<ul>
						<li data-filter=".top" class="active">Top</li>
						<li data-filter=".lastest">Lastest</li>
					</ul>
				</div>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col-lg-12">
				<div class="row portfolio-item">
					<c:forEach var="item" items="${lastestVideo }">
						<div class="col-md-3 col-sm-6 soon lastest">
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
											<a href="/P-Movie.com/unlike?id=${item.id }&uri=/index"
											class="like"><i class="icofont icofont-heart-beat"></i></a>
										</c:if>
										<c:if test="${not bool }">
											<a href="/P-Movie.com/like?id=${item.id }&uri=/index"
											class="like"><i class="icofont icofont-heart"></i></a>
										</c:if>
									</c:if>
								</div>
								<div class="portfolio-content">
									<h2 class="max-lines edit-font">
										<a href="/P-Movie.com/watches?id=${item.id }">${item.title }</a>
									</h2>
									<div class="review">
										<h4>${item.views } Views</h4>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<c:forEach var="item" items="${top10 }">
						<div class="col-md-3 col-sm-6 top">
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
											<a href="/P-Movie.com/unlike?id=${item.id }&uri=/index"
											class="like"><i class="icofont icofont-heart-beat"></i></a>
										</c:if>
										<c:if test="${not bool }">
											<a href="/P-Movie.com/like?id=${item.id }&uri=/index"
											class="like"><i class="icofont icofont-heart"></i></a>
										</c:if>
									</c:if>
								</div>
								<div class="portfolio-content">
									<h2 class="max-lines edit-font">
										<a href="/P-Movie.com/watches?id=${item.id }">${item.title }</a>
									</h2>
									<div class="review">
										<h4>${item.views } Views</h4>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
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
						<i class="icofont icofont-film"></i> Recommend For You
					</h1>
				</div>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col-md-9">
				<div class="video-area">
					<img class="trailers1"
						src="/P-Movie.com/photo/poster/${randomVideo[0].poster }"
						alt="video" />
						<a href="/P-Movie.com/watches?id=${randomVideo[0].id }"
						class="like"><i class="icofont icofont-ui-play"></i></a>
					<div class="video-text">
						<h2>${randomVideo[0].title }</h2>
						<div class="review">
							<h4>${randomVideo[0].views }Views</h4>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="row">
					<div class="col-md-12 col-sm-6">
						<div class="video-area">
							<img class="trailers2"
								src="/P-Movie.com/photo/poster/${randomVideo[1].poster }"
								alt="video" /> 
								<a href="/P-Movie.com/watches?id=${randomVideo[1].id }"
								class="like"><i class="icofont icofont-ui-play"></i></a>
						</div>
					</div>
					<div class="col-md-12 col-sm-6">
						<div class="video-area">
							<img class="trailers2"
								src="/P-Movie.com/photo/poster/${randomVideo[2].poster }"
								alt="video" />
								<a href="/P-Movie.com/watches?id=${randomVideo[2].id }"
								class="like"><i class="icofont icofont-ui-play"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- video section end -->
<!-- news section start -->
<section class="news">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title pb-20">
					<h1>
						<i class="icofont icofont-coffee-cup"></i> Latest News
					</h1>
				</div>
			</div>
		</div>
		<hr />
	</div>
	<div class="news-slide-area">
		<div class="news-slider">
			<div class="single-news">
				<div class="news-bg-1"></div>
				<div class="news-date">
					<h2>
						<span>NOV</span> 25
					</h2>
					<h1>2017</h1>
				</div>
				<div class="news-content">
					<h2>The Witch Queen</h2>
					<p>Witch Queen is a tall woman with a slim build. She has pink
						hair, which is pulled up under her hat, and teal eyes.</p>
				</div>
				<a href="#">Read More</a>
			</div>
			<div class="single-news">
				<div class="news-bg-2"></div>
				<div class="news-date">
					<h2>
						<span>NOV</span> 25
					</h2>
					<h1>2017</h1>
				</div>
				<div class="news-content">
					<h2>The Witch Queen</h2>
					<p>Witch Queen is a tall woman with a slim build. She has pink
						hair, which is pulled up under her hat, and teal eyes.</p>
				</div>
				<a href="#">Read More</a>
			</div>
			<div class="single-news">
				<div class="news-bg-3"></div>
				<div class="news-date">
					<h2>
						<span>NOV</span> 25
					</h2>
					<h1>2017</h1>
				</div>
				<div class="news-content">
					<h2>The Witch Queen</h2>
					<p>Witch Queen is a tall woman with a slim build. She has pink
						hair, which is pulled up under her hat, and teal eyes.</p>
				</div>
				<a href="#">Read More</a>
			</div>
		</div>
		<div class="news-thumb">
			<div class="news-prev">
				<div class="single-news">
					<div class="news-bg-2"></div>
					<div class="news-date">
						<h2>
							<span>NOV</span> 25
						</h2>
						<h1>2017</h1>
					</div>
					<div class="news-content">
						<h2>The Witch Queen</h2>
						<p>Witch Queen is a tall woman with a slim build. She has pink
							hair, which is pulled up under her hat, and teal eyes.</p>
					</div>
					<a href="#">Read More</a>
				</div>
			</div>
			<div class="news-next">
				<div class="single-news">
					<div class="news-bg-3"></div>
					<div class="news-date">
						<h2>
							<span>NOV</span> 25
						</h2>
						<h1>2017</h1>
					</div>
					<div class="news-content">
						<h2>The Witch Queen</h2>
						<p>Witch Queen is a tall woman with a slim build. She has pink
							hair, which is pulled up under her hat, and teal eyes.</p>
					</div>
					<a href="#">Read More</a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- news section end -->