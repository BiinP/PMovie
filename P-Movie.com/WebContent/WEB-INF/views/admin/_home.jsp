<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="page-header">
	<div class="container-fluid">
		<h2 class="h5 no-margin-bottom">Dashboard</h2>
	</div>
</div>
<section class="no-padding-top no-padding-bottom">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3 col-sm-6">
				<div class="statistic-block block">
					<div
						class="progress-details d-flex align-items-end justify-content-between">
						<div class="title">
							<div class="icon">
								<i class="icon-user-1"></i>
							</div>
							<strong>Users</strong>
						</div>
						<div class="number dashtext-1">${totalUser }</div>
					</div>

				</div>
			</div>
			<div class="col-md-3 col-sm-6">
				<div class="statistic-block block">
					<div
						class="progress-details d-flex align-items-end justify-content-between">
						<div class="title">
							<div class="icon">
								<i class="icon-picture"></i>
							</div>
							<strong>Videos</strong>
						</div>
						<div class="number dashtext-2">${totalVideo }</div>
					</div>

				</div>
			</div>
			<div class="col-md-3 col-sm-6">
				<div class="statistic-block block">
					<div
						class="progress-details d-flex align-items-end justify-content-between">
						<div class="title">
							<div class="icon">
								<i class="icon-page"></i>
							</div>
							<strong>Favorites</strong>
						</div>
						<div class="number dashtext-4">${totalFavorite }</div>
					</div>

				</div>
			</div>
			<div class="col-md-3 col-sm-6">
				<div class="statistic-block block">
					<div
						class="progress-details d-flex align-items-end justify-content-between">
						<div class="title">
							<div class="icon">
								<i class="far fa-eye"></i>
							</div>
							<strong>Visitors</strong>
						</div>
						<div class="number dashtext-3">${applicationScope.visitor }</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>
<section class="no-padding-bottom">
<h1 class="heading ml-3">Count User and Favorite in month</h1>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="line-cahrt block">
					<canvas id="barChartCustom3"></canvas>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="no-padding-bottom">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="stats-2-block block d-flex">
					<div class="stats-2 d-flex">
						<div class="stats-2-arrow height">
							<i class="fa fa-caret-up"></i>
						</div>
						<div class="stats-2-content">
							<strong class="d-block">${userChange }</strong><span
								class="d-block">User</span>
						</div>
					</div>
					<div class="stats-2 d-flex">
						<div class="stats-2-arrow height">
							<i class="fa fa-caret-up"></i>
						</div>
						<div class="stats-2-content">
							<strong class="d-block">${favoriteChange }</strong><span
								class="d-block">Favorites</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="no-padding-bottom">
	<h1 class="heading ml-3">Top 10 Video</h1>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-4">
				<div class="user-block block text-center">
					<div class="avatar">
						<img src="/P-Movie.com/photo/poster/${top10[1].poster }" alt="..." class="img-fluid">
						<div class="order dashbg-2">2st</div>
					</div>
					<a href="/P-Movie.com/admin/video-management/edit/${top10[1].id}" class="user-title">
						<h3 class="h5">${top10[1].title }</h3>
					</a>
					<div class="contributions">${top10[1].views } views</div>
					<div class="contributions">${likes[1] } like</div>

				</div>
			</div>
			<div class="col-lg-4">
				<div class="user-block block text-center">
					<div class="avatar">
						<img src="/P-Movie.com/photo/poster/${top10[0].poster }" alt="..." class="img-fluid">
						<div class="order dashbg-2">1st</div>
					</div>
					<a href="/P-Movie.com/admin/video-management/edit/${top10[0].id}" class="user-title">
						<h3 class="h5">${top10[0].title }</h3>
					</a>
					<div class="contributions">${top10[0].views } views</div>
					<div class="contributions">${likes[0] } like</div>

				</div>
			</div>
			<div class="col-lg-4">
				<div class="user-block block text-center">
					<div class="avatar">
						<img src="/P-Movie.com/photo/poster/${top10[2].poster }" alt="..." class="img-fluid">
						<div class="order dashbg-2">3st</div>
					</div>
					<a href="/P-Movie.com/admin/video-management/edit/${top10[2].id}" class="user-title">
						<h3 class="h5">${top10[2].title }</h3>
					</a>
					<div class="contributions">${top10[2].views } views</div>
					<div class="contributions">${likes[2] } like</div>

				</div>
			</div>

		</div>
		<c:forEach var="item" items="${top10 }" begin="3" varStatus="loop">
			<div class="public-user-block block">
			<div class="row d-flex align-items-center">
				<div class="col-lg-4 d-flex align-items-center">
					<div class="order">${loop.index+1 }th</div>
					<div class="avatar">
						<img src="/P-Movie.com/photo/poster/${item.poster }" alt="..." class="img-fluid">
					</div>
					<a href="/P-Movie.com/admin/video-management/edit/${item.id}" class="name"><strong class="d-block">${item.title }</strong></a>
				</div>
				<div class="col-lg-4 text-center">
					<div class="contributions">${item.views } views</div>
					<div class="contributions">${likes[loop.index] } like</div>
				</div>

			</div>
		</div>
		</c:forEach>
		

	</div>
</section>
