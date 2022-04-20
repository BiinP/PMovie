<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:url var="userPage" value="/admin/user-management" />
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
<section class="no-padding-top">

	<div class="container-fluid">
		<div class="row">

			<!-- Modal Form-->
			<div class="col-lg-12"></div>
			<div class="col-lg-12">
			</div>
			<!-- Form Elements -->
			<div class="col-lg-12">
				<div class="block">
					<div class="title">
						<strong>User Form</strong>
					</div>
					<div class="block-body">
						<div class="row">
							<div class="col-lg-4">
								<img alt="avatar" class="avatar-user"
									src="/P-Movie.com/photo/avatar/${user.avatar }" width="100%">
							</div>
							<div class="col-lg-8">
								<form name="frmUser" class="form-horizontal"
									action="${userPage }" method="post"
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
												<input id="register-username" type="text" name="username"
													ng-model="username" required class="input-material"
													${index !=-1?"readonly":""}>
												<div ng-show="frmUser.username.$invalid"
													class="badge badge-danger">Username not null</div>
												<label for="register-username"
													class="label-material ${active }">Username</label>
											</div>
											<div class="form-group-material">
												<input id="register-password" type="password"
													name="password" ng-model="password" required
													ng-minlength="6" class="input-material">
												<div ng-show="frmUser.password.$invalid"
													class="badge badge-danger">Password not null and
													least 6 characters</div>
												<label for="register-password"
													class="label-material ${active }">Password </label>
											</div>
											<div class="form-group-material">
												<input id="register-password" type="text" name="fullname"
													ng-model="fullname" required class="input-material">
												<div ng-show="frmUser.fullname.$invalid"
													class="badge badge-danger">Fullname not null</div>
												<label for="register-password"
													class="label-material ${active }">Fullname </label>
											</div>
											<div class="form-group-material">
												<input id="register-email" type="email" name="email"
													ng-model="email" required class="input-material">
												<div ng-show="frmUser.email.$invalid"
													class="badge badge-danger">Email not null</div>
												<label for="register-email"
													class="label-material ${active }">Email </label>
											</div>
											<div class="form-group-material">
												<input id="CreateDate" type="text" class="input-material"
													value="<fmt:formatDate value="${user.createDate }" pattern="dd/MM/yyyy"/>"
													readonly> <label for="register-email"
													class="label-material active">Create Date </label>
											</div>
											<label for="register-username"
												class="label-material font-weight-bold">Role</label>
											<div class="form-inline">
												<div class="form-group i-checks">
													<input id="radioCustom2" type="radio" value="true"
														${user.admin?"checked":"" } name="admin"
														class="radio-template"> <label for="radioCustom2">Admin</label>
												</div>
												<div class="form-group i-checks ml-5">
													<input id="radioCustom2" type="radio" value="false"
														${user.admin?"":"checked" } name="admin"
														class="radio-template"> <label for="radioCustom2">User</label>
												</div>
											</div>
											<br> <label for="register-username"
												class="label-material font-weight-bold">Active</label>
											<div class="form-inline">
												<div class="form-group i-checks">
													<input id="radioCustom2" type="radio" value="true"
														name="active" ${user.active?"checked":"" }
														class="radio-template"> <label for="radioCustom2">Enable</label>
												</div>
												<div class="form-group i-checks ml-5">
													<input id="radioCustom2" type="radio" value="false"
														name="active" ${user.active?"":"checked" }
														class="radio-template"> <label for="radioCustom2">Disable</label>
												</div>
											</div>
											<br>
											<div class="form-group-material">
												<label for="register-username"
													class="label-material font-weight-bold">Avatar</label> <input
													id="register-email" type="file" name="avatar"
													class="input-material">

											</div>
										</div>
									</div>
									<div class="line"></div>
									<a class="btn btn-secondary" href="${userPage }/reset">Cancel</a>
									<button type="submit" class="btn btn-primary"
										formaction="${userPage }/insert"
										ng-disabled="${index}!=-1|| frmUser.$invalid">Save</button>
									<button type="submit" class="btn btn-primary"
										formaction="${userPage }/update"
										ng-disabled="${index}==-1|| frmUser.$invalid">Update</button>
									<button type="submit" class="btn btn-primary"
										formaction="${userPage }/delete" ng-disabled="${index}==-1">Delete</button>
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
								<strong>User Table</strong>
							</div>
							<div class="col-md-3">
								<form>
									<div class="form-group">
										<input type="text" oninput="searchByFullname(this)" placeholder="Fullname..." name="fullnameSearch" class="form-control">
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
													<th>Username</th>
													<th>Fullname</th>
													<th>Email</th>
													<th>Admin</th>
													<th>Active</th>
													<th>Create date</th>
													<th>Edit</th>
												</tr>
											</thead>
											<tbody id="table">
												<c:forEach var="item" items="${users }" varStatus="loop">
													<tr>
														<th scope="row">${loop.index }</th>
														<td>${item.username }</td>
														<td>${item.fullname }</td>
														<td>${item.email }</td>
														<td>${item.admin?"Admin":"User" }</td>
														<td>${item.active?"Activing":"Blocked" }</td>
														<td><fmt:formatDate value="${item.createDate }"
																pattern="dd/MM/yyyy" /></td>
														<td><a class="btn btn-link text-secondary"
															href="${userPage }/edit/${item.username}" role="button">></a></td>
													</tr>
												</c:forEach>

											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>