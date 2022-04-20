<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>P Movie</title>
<!-- Favicon Icon -->
<link rel="icon" type="image/png"
	href="/PS19246_NguyenHoangPhuc_ASM_JAVA4/assets/img/favcion.png" />
<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css" media="all" />
<!-- Slick nav CSS -->
<link rel="stylesheet" type="text/css"
	href=" assets/css/slicknav.min.css" media="all" />
<!-- Iconfont CSS -->
<link rel="stylesheet" type="text/css" href=" assets/css/icofont.css"
	media="all" />
<!-- Owl carousel CSS -->
<link rel="stylesheet" type="text/css"
	href=" assets/css/owl.carousel.css">
<!-- Popup CSS -->
<link rel="stylesheet" type="text/css"
	href=" assets/css/magnific-popup.css">
<!-- Main style CSS -->
<link rel="stylesheet" type="text/css" href=" assets/css/style.css"
	media="all" />
<!-- Responsive CSS -->
<link rel="stylesheet" type="text/css" href=" assets/css/responsive.css"
	media="all" />
<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
</head>
<body ng-app="PMovie">
	<!-- Page loader -->
	<div id="preloader"></div>

	<!-- header section start -->
	<%@include file="_menu.jsp"%>
	<%@include file="_signin-signup.jsp"%>
	<!-- header section end -->

	<!-- views start -->
	<jsp:include page="${view }"></jsp:include>
	<!-- views end -->

	<!-- footer section start -->
	<%@include file="_footer.jsp"%>
	<!-- footer section end -->

	<!-- jquery main JS -->
	<script src=" assets/js/jquery.min.js"></script>
	<!-- Bootstrap JS -->
	<script src=" assets/js/bootstrap.min.js"></script>
	<!-- Slick nav JS -->
	<script src=" assets/js/jquery.slicknav.min.js"></script>
	<!-- owl carousel JS -->
	<script src=" assets/js/owl.carousel.min.js"></script>
	<!-- Popup JS -->
	<script src=" assets/js/jquery.magnific-popup.min.js"></script>
	<!-- Isotope JS -->
	<script src=" assets/js/isotope.pkgd.min.js"></script>
	<!-- main JS -->
	<script src=" assets/js/main.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
</body>
<script>
	function searchByName(param) {
		var txtSearch = param.value;
		$.ajax({
			url : "/P-Movie.com/movies/searchAjax",
			type : "get", //send it through get method
			data : {
				searchMovie : txtSearch
			},
			success : function(data) {
				var row = document.getElementById("movie");
				row.innerHTML = data;
			},
			error : function(xhr) {
				//Do Something to handle error
			}
		});
	}
	function addToFavorite(id) {
		$.ajax({
			url : "/P-Movie.com/like?id="+id,
			type : "get", //send it through get method
			data : {
				id : id
			},
			success : function(data) {
				alert('Like success video '+id)
			},
			error : function(xhr) {
				//Do Something to handle error
				alert('Like fail video '+id)
			}
		});
		
	}
	var app = angular.module("PMovie",[]);
	app.controller("sign-in",function($scope){
		
	})
	app.controller("sign-up",function($scope){
		
	})
	app.controller("change-pw",function($scope){
	})
	app.controller("edit-profile",function($scope){
		$scope.username="${sessionScope.session.username }"
		$scope.fullname="${sessionScope.session.fullname }"
		$scope.email="${sessionScope.session.email }"
	})
</script>
</html>