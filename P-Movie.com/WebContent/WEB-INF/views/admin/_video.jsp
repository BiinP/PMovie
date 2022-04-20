<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:url var="videoPage" value="/admin/video-management" />
<!-- Page Header-->
<div class="page-header no-margin-bottom">
	<div class="container-fluid">
		<h2 class="h5 no-margin-bottom">Video Management</h2>
	</div>
</div>
<!-- Breadcrumb-->
<div class="container-fluid">
	<ul class="breadcrumb">

	</ul>
</div>
<section ng-controller="video" class="no-padding-top">

	<div class="container-fluid">
		<div class="row">

			<!-- Modal Form-->
			<div class="col-lg-12"></div>
			<div class="col-lg-12"></div>
			<!-- Form Elements -->
			<div class="col-lg-12">
				<div class="block">
					<div class="title">
						<strong>Video Form</strong>
					</div>
					<div class="block-body">
						<div class="row">
							<div class="col-lg-4">
								<img alt="poster" class="avatar-user"
									src="/P-Movie.com/photo/poster/${video.poster }" width="100%">
							</div>
							<div class="col-lg-8">
								<form name="frmVideo" class="form-horizontal"
									action="${videoPage }" method="post"
									enctype="multipart/form-data">

									<div class="row">
										<c:if test="${not empty success}">
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
										<div class="col-sm-12">
											<div class="form-group-material">
												<input id="register-username" type="text" name="id"
													ng-model="id" required class="input-material"
													${index !=-1?"readonly":""}>
												<div ng-show="frmVideo.id.$invalid"
													class="badge badge-danger ">Id not null</div>
												<label for="register-username"
													class="label-material ${active }">Id</label>
											</div>
											<div class="form-group-material">
												<input id="register-username" type="text" name="title"
													ng-model="title" required class="input-material">
												<div ng-show="frmVideo.title.$invalid"
													class="badge badge-danger">Title not null</div>
												<label for="register-username"
													class="label-material ${active }">Title</label>
											</div>
											<div class="form-group">
												<label class="text-danger">Description</label>
												<textarea rows="3" cols="" id="register-email"
													name="description" ng-model="description"
													class="form-control"></textarea>
											</div>
											<div class="form-group-material">
												<input id="CreateDate" type="text"
													value=" <fmt:formatDate value="${video.uploadDate }" pattern="dd/MM/yyyy"  /> "
													readonly class="input-material"> <label
													for="register-email" class="label-material active">Upload
													Date </label>
											</div>
											<label for="register-username"
												class="label-material font-weight-bold">Active</label>
											<div class="form-inline">
												<div class="form-group i-checks">
													<input id="radioCustom2" type="radio"
														${video.active?"checked":"" } value="true" name="active"
														class="radio-template"> <label for="radioCustom2">Enable</label>
												</div>
												<div class="form-group i-checks ml-5">
													<input id="radioCustom2" type="radio"
														${video.active?"":"checked" } value="false" name="active"
														class="radio-template"> <label for="radioCustom2">Disable</label>
												</div>
											</div>
											<br>
											<div class="form-group-material">
												<input id="CreateDate" type="number" name="views"
													ng-model="views" ng-min="0" required class="input-material">
												<div ng-show="frmVideo.views.$invalid"
													class="badge badge-danger">Views >= 0</div>
												<label for="register-email" class="label-material active">Views
												</label>
											</div>
											<div class="form-group-material">
												<label for="register-username"
													class="label-material font-weight-bold">Poster</label> <input
													id="register-email" type="file" name="poster"
													class="input-material">

											</div>
										</div>
									</div>
									<div class="line"></div>
									<a class="btn btn-secondary" href="${videoPage }/reset">Cancel</a>
									<button type="submit" class="btn btn-primary"
										formaction="${videoPage }/insert"
										ng-disabled="${index}!=-1|| frmVideo.$invalid">Save</button>
									<button type="submit" class="btn btn-primary"
										formaction="${videoPage }/update"
										ng-disabled="${index}==-1|| frmVideo.$invalid">Update</button>
									<button type="submit" class="btn btn-primary"
										formaction="${videoPage }/delete" ng-disabled="${index}==-1">Delete</button>
								</form>

							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="block">
					<div class="block-body">
						<div class="title row">
							<div class="col-md-9">
								<strong>Video Table</strong>
							</div>
							<div class="col-md-3">
								<form>
									<div class="form-group">
										<input type="text" oninput="searchByTitle(this)"
											placeholder="Title..." name="titleSearch"
											class="form-control">
									</div>
								</form>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="block">
									<div class="table-responsive">
										<table class="table table-striped table-hover">
											<thead>
												<tr>
													<th>#</th>
													<th>Id</th>
													<th>Title</th>
													<th>Poster</th>
													<th>Active</th>
													<th>Views</th>
													<th>Upload Date</th>
													<th>Edit</th>
												</tr>
											</thead>
											<tbody id="table">
												<c:forEach var="item" items="${videos }" varStatus="loop">
													<tr>
														<th scope="row">${loop.index }</th>
														<td>${item.id }</td>
														<td>${item.title }</td>
														<td>${item.poster }</td>
														<td>${item.active?"Activing":"Disabled" }</td>
														<td>${item.views }</td>
														<td><fmt:formatDate value="${item.uploadDate }"
																pattern="dd/MM/yyyy" /></td>
														<td><a class="btn btn-link text-secondary"
															href="${videoPage }/edit/${item.id}">></a></td>
													</tr>
												</c:forEach>

											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<nav aria-label="Page navigation example" class="ml-5">
								<ul class="pagination justify-content-center text-dark">
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
									<c:forEach begin="1" end="${endPage }" varStatus="loop">
										<li class="page-item"><a class="page-link"
											href="/P-Movie.com/admin/video-management?page=${loop.index}">${loop.index }</a></li>
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
	</div>
</section>