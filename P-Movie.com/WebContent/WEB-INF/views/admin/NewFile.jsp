<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:url var="adminPage" value="/admin" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	<section class="no-padding-bottom">
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
</script>
</html>