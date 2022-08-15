<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>QR발급 시스템</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
</head>
<style>
body{
background-image:url('background2.png');
}
h3{
color:#FAFAD2;
}
label{
color:#FAFAD2;
}
</style>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
							
			
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
							메뉴
					</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
											<!-- <a class="dropdown-item" href="userJoin.jsp">회원가입</a>  -->
						<a class="dropdown-item active" href="userJoin.jsp">회원가입</a>
						<a class="dropdown-item" href="userLogin.jsp">로그인</a>
					</div>
				</li>
				<a class="navbar-brand" href="index.jsp" text-align:center;>QR발급 시스템</a>
			</ul>
		</div>
	</nav>
	<section class="container mt-3" style="max-width: 560px;">
		<form method="post" action="./userjoinaction.jsp">
		<input type="hidden" name="action" value="go">
			<div class="form-group">
				<label>이름</label>
				<input type="text" name="name" class="form-control" maxlength="20">
			</div>
			<div class="form-group">
				<label>아이디</label>
				<input type="text" name="userID" class="form-control" maxlength="50">
			</div>
			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" name="pw" class="form-control" maxlength="50">
			</div>
			<div class="form-group">
				<label>전화번호</label>
				<input type="tel" name="ph1" class="form-control" maxlength="3" onKeyup="this.value=this.value.replace(/[^0-1]/g,'')"/>
				<input type="tel" name="ph2" class="form-control" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')"/>
				<input type="tel" name="ph3" class="form-control" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')"/>
<!--			<input type="number" name="userCall1" class="form-control" maxlength="3">
				<input type="number" name="userCall2" class="form-control" maxlength="4">
				<input type="number" name="userCall3" class="form-control" maxlength="4"> -->
			</div>
			<div class="form-group">
				<label>이메일</label>
				<input type="text" name="addr" class="form-control">
			</div>
			<button type="btn-group me-2" class="btn btn-primary">회원가입</button>
		</form>
	</section>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	
</body>
</html>