<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:url var="adminPage" value="/admin" />
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Admin</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet"
	href="${adminPage}/vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="${adminPage}/vendor/font-awesome/css/font-awesome.min.css">
<!-- Custom Font Icons CSS-->
<link rel="stylesheet" href="${adminPage}/css/font.css">
<!-- Google fonts - Muli-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Muli:300,400,700">
<!-- theme stylesheet-->
<link rel="stylesheet" href="${adminPage}/css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="${adminPage}/css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="img/favicon.ico">
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>

<body ng-app="app" ng-controller="ctrl">
	<%@include file="_header.jsp"%>
	<div class="d-flex align-items-stretch">

		<!-- Sidebar Navigation-->
		<%@include file="_menu.jsp"%>
		<!-- Sidebar Navigation end-->

		<div class="page-content">
			<jsp:include page="${view }"></jsp:include>
		</div>
	</div>
	<!-- JavaScript files-->
	<script src="${adminPage}/vendor/jquery/jquery.min.js"></script>
	<script src="${adminPage}/vendor/popper.js/umd/popper.min.js">
		
	</script>
	<script src="${adminPage}/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${adminPage}/vendor/jquery.cookie/jquery.cookie.js">
		
	</script>
	<script src="${adminPage}/vendor/chart.js/Chart.min.js"></script>
	<script
		src="${adminPage}/vendor/jquery-validation/jquery.validate.min.js"></script>
	<script src="${adminPage}/js/charts-home.js"></script>
	<script src="${adminPage}/js/front.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
</body>
<script>
	var xhttp = new XMLHttpRequest();
	var like = new Array();
	var ngay = new Array();
	xhttp.open("GET", "/P-Movie.com/data", true);
	xhttp.send();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			datas = JSON.parse(this.responseText);
			for (var i = 0; i < 31; i++) {
				ngay[i] = i + 1;
				like[i] = 0;
			}
			for (var i = 0; i < 31; i++) {
				for (var j = 0; j < datas.length; j++) {
					if (datas[j].group == ngay[i]) {
						like[i] = datas[j].likes
					}
				}
			}
			render(datas);
		}
		function render(datas) {
			console.log(like)
		}
	};

	var xhttp1 = new XMLHttpRequest();
	var user = new Array();
	xhttp1.open("GET", "/P-Movie.com/admin/usermonth/chart", true);
	xhttp1.send();
	xhttp1.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			datas = JSON.parse(this.responseText);
			for (var i = 0; i < 31; i++) {
				ngay[i] = i + 1;
				user[i] = 0;
			}
			for (var i = 0; i < 31; i++) {
				for (var j = 0; j < datas.length; j++) {
					if (datas[j].group == ngay[i]) {
						user[i] = datas[j].likes
					}
				}
			}
			render(datas);
		}
		function render(datas) {
			console.log(user)
		}
	};
	var app = angular.module("app", []);
	app.controller("ctrl", function($scope) {
		$scope.username = "${user.username}";
		$scope.password = "${user.password}";
		$scope.fullname = "${user.fullname}";
		$scope.email = "${user.email}";
	});
	app.controller("video", function($scope) {
		$scope.id = "${video.id}";
		$scope.title = "${video.title}";
		$scope.views = ${video.views};
		$scope.description = "${video.description}";
	});
	function searchByFullname(param) {
		var txtSearch = param.value;
		$.ajax({
			url : "/P-Movie.com/admin/user-management/searchByFullname",
			type : "get", //send it through get method
			data : {
				fullnameSearch : txtSearch
			},
			success : function(data) {
				var row = document.getElementById("table");
				row.innerHTML = data;
			},
			error : function(xhr) {
				//Do Something to handle error
			}
		});
	}
	function searchByTitle(param) {
		var txtSearch = param.value;
		$.ajax({
			url : "/P-Movie.com/admin/user-management/searchByTitle",
			type : "get", //send it through get method
			data : {
				titleSearch : txtSearch
			},
			success : function(data) {
				var row = document.getElementById("table");
				row.innerHTML = data;
			},
			error : function(xhr) {
				//Do Something to handle error
			}
		});
	}
</script>
</html>