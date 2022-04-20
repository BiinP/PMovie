<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="login-area" ng-controller="sign-in">
	<div class="login-box">
		<a href="#"><i class="icofont icofont-close"></i></a>
		<h2>SIGN IN</h2>
		<form action="/P-Movie.com/sign-in" method="post" name="frmSignin">
			<div class="form-group">
				<h6>USERNAME</h6>
				<div ng-show="frmSignin.username.$invalid"
					class="badge badge-danger font-italic mb-2">Username not null</div>
				<input name="username" type="text" ng-model="username" required />
			</div>
			<div class="form-group">
				<h6>PASSWORD</h6>
				<div ng-show="frmSignin.password.$invalid"
					class="badge badge-danger font-italic mb-2">Password not null</div>
				<input name="password" type="password" ng-model="password" required />
			</div>
			<div class="form-group">
				<div class="login-remember">
					<input type="checkbox" /> <span>Remember Me</span>
				</div>
			</div>
			<div class="login-signup">
				<span>SIGN UP</span>
			</div>
			<button class="theme-btn btn mb-2" ng-disabled="frmSignin.$invalid">SIGN IN</button>
			<a href="#" class="mb-2 text-primary">Forget-password?</a><br> <span>Or
				Via Social</span>
			<div class="login-social">
				<a href="#"><i class="icofont icofont-social-facebook"></i></a> <a
					href="#"><i class="icofont icofont-social-twitter"></i></a> <a
					href="#"><i class="icofont icofont-social-linkedin"></i></a> <a
					href="#"><i class="icofont icofont-social-google-plus"></i></a> <a
					href="#"><i class="icofont icofont-camera"></i></a>
			</div>
		</form>

	</div>
</div>
<div class="signup-area" ng-controller="sign-up">
	<div class="signup-box">
		<a href="#"><i class="icofont icofont-close"></i></a>
		<h2>SIGN UP</h2>
		<form name="frmSignup" action="#" method="post">
			<h6>USERNAME</h6>
			<div ng-show="frmSignup.id.$invalid"
				class="badge badge-danger font-italic mb-2">Vui lòng nhập tên đăng
				nhập</div>
			<input name="id" ng-model="id" required type="text" />
			<h6>PASSWORD</h6>
			<div ng-show="frmSignup.password.$invalid"
				class="badge badge-danger font-italic mb-2">Vui lòng nhập mật khẩu
				nhiều hơn 6 ký tự</div>
			<input name="password" ng-model="password" required ng-minlength="6"
				type="password" />
			<h6>ACCEPT PASSWORD</h6>
			<div ng-show="frmSignup.password1.$invalid"
				class="badge badge-danger font-italic mb-2">Vui lòng nhập xác nhận
				mật khẩu</div>
			<div ng-show="password != password1"
				class="badge badge-danger font-italic mb-2">Xác nhận mật khẩu không
				đúng</div>
			<input name="password1" ng-model="password1" required type="password" />
			<h6>FULLNAME</h6>
			<div ng-show="frmSignup.fullname.$invalid"
				class="badge badge-danger font-italic mb-2">Vui lòng nhập họ và tên
			</div>
			<input name="fullname" ng-model="fullname" required type="text" />
			<h6>EMAIL</h6>
			<div ng-show="frmSignup.email.$invalid"
				class="badge badge-danger font-italic mb-2">Vui lòng nhập email</div>
			<input name="email" ng-model="email" required type="email" />
			<h6>ROLE</h6>
			<div class="login-remember">
				<input name="admin" type="radio" value="true" /> <span class="mr-2">Admin</span>
				<input name="admin" type="radio" value="false" /> <span>User</span>
			</div>
			<div class="signup-login">
				<span>SIGN IN</span>
			</div>
			<button ng-disabled="frmSignup.$invalid || password1 != password"
				class="btn theme-btn">SIGN UP</button>
			<span>Or Via Social</span>
			<div class="login-social">
				<a href="#"><i class="icofont icofont-social-facebook"></i></a> <a
					href="#"><i class="icofont icofont-social-twitter"></i></a> <a
					href="#"><i class="icofont icofont-social-linkedin"></i></a> <a
					href="#"><i class="icofont icofont-social-google-plus"></i></a> <a
					href="#"><i class="icofont icofont-camera"></i></a>
			</div>
		</form>

	</div>
</div>
<div class="changepw-area" ng-controller="change-pw">
	<div class="changepw-box">
		<a href="#"><i class="icofont icofont-close"></i></a>
		<h2>CHANGE PASSWORD</h2>
		<form name="frmChangepw"
			action="/P-Movie.com/change-pw"
			method="post">
			<h6>USERNAME</h6>
			<input name="username" type="text" value="${sessionScope.session.username }" readonly />
			<h6>OLD PASSWORD</h6>
			<div ng-show="frmChangepw.password.$invalid"
				class="badge badge-danger font-italic mb-2">Vui lòng nhập mật khẩu
				cũ</div>
			<input name="password" type="password" required ng-model="password" />
			<h6>NEW PASSWORD</h6>
			<div ng-show="frmChangepw.password1.$invalid"
				class="badge badge-danger font-italic mb-2">Vui lòng nhập mật khẩu
				nhiều hơn 6 ký tự</div>
			<input name="password1" type="password" ng-minlength="6" required
				ng-model="password1" />
			<h6>CONFIRM PASSWORD</h6>
			<div ng-show="frmChangepw.password2.$invalid"
				class="badge badge-danger font-italic mb-2">Vui lòng xác nhận mật
				khẩu</div>
			<div ng-show="password1 != password2"
				class="badge badge-danger font-italic mb-2">Xác nhận mật khẩu không
				đúng</div>
			<input name="password2" type="password" required ng-model="password2" />
			<button ng-disabled="frmChangepw.$invalid || password1 != password2"
				class="theme-btn btn">CHANGE PASSWORD</button>
		</form>
	</div>
</div>