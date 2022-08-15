<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>QR�߱� �ý���</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
</head>
<style>
body{
background-image:url('background2.png');
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
					�޴�
					</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
													<!-- <a class="dropdown-item" href="userJoin.jsp">ȸ������</a> -->
						<a class="dropdown-item" href="userJoin.jsp">ȸ������</a>
						<a class="dropdown-item" href="userLogin.jsp">�α���</a>
					</div>
				</li>
				<a class="navbar-brand" href="index.jsp" text-align:center;>QR�߱� �ý���</a>
			</ul>
		</div>
	</nav>
	<section class="container mt-3" style="max-width: 560px;">
		<form method="post" action="./userLoginAction.jsp">
			<div class="form-group">
				<label>���̵�</label>
				<input type="text" name="userID" class="form-control">
			</div>
			<div class="form-group">
				<label>��й�ȣ</label>
				<input type="password" name="pw" class="form-control">
			</div>
			<button type="submit" class="btn btn-primary">�α���</button>
		</form>
	</section>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	
</body>
</html>