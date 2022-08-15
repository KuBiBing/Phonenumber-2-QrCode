<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String) session.getAttribute("idKey");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>QR발급 시스템</title>
<script src="generate.js"></script>
<script language="javascript">
function showPopup(){
	window.open("userQRcode.html","QR코드 생성","width=500, height=700, left=700, top=400");
}
</script>

<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
<script src="generate.js"></script>
</head>
<style>
body{
background-image:url('background2.png');
background-size:800px 2000px;
}
h3{
color:#000000;
}
label{
color:#FAFAD2;
}
</style>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">Hello world!</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
					<%
						if (session.getAttribute("userID") != null) { 
					%> 
					<b><%=session.getAttribute("userID")%></b>님 환영합니다.
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
					메뉴
					</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
						<a class="dropdown-item" href="mypage.jsp">마이페이지</a>
					</div>
				</li>
			</ul> <% 
						} else {id = request.getParameter("userID");
						%>
						<script type="text/javascript">
						location.href = "index.jsp";
						</script>
						<%
						}
						%>
</nav>
	<section class="container mt-4" style="max-width: 560px;">
		<button onclick="location='userlogout.jsp'">로그아웃</button>
		<button onclick="location='userinfo.jsp'">내정보수정</button>
		<button onclick="location='userDelete.jsp'">회원탈퇴</button>
		<input type="button" value="QR코드1 생성" name="codeData1" onclick="makeqr(1);">
		<input type="button" value="QR코드2 생성" name="codeData2" onclick="makeqr(2);">
		<div style="float:right;">
		<div id="image" style="margin:auto"></div>
		</div>
	</section>
	<script>
	//qr코드 생성 버튼을 클릭하면 아래 함수가 실행
	String usercode = UserDAO.usercode(userID);
	function makeqr(i) {
		var data = "";
		var size = 248;
		if(i == 1){
			data = "http://121.167.64.232:8081/graduation_porject/Send/TypeMSG01.jsp?personalID=" + usercode;
		}
		else if(i == 2) {
			data = "http://121.167.64.232:8081/graduation_porject/Send/TypeMSG02.jsp?personalID=" + usercode;
		}
		//QR코드 생성하는 부분
		if(data != "") {
			if( $("#image").is(':empty')) {
				$("#image").append("<img src='http://chart.apis.google.com/chart?cht=qr&chl=" + data + "&chs=" + size + "' alt='qr' />");
				$("#code").append("<p style='color:#fff;'><strong>Image Link:</strong> http://chart.apis.google.com/chart?cht=qr&chl=" + data + "&chs=" + size + "</p>");
				return false;
				}
			else {
				$("#image").html("");
				$("#link").html("");
				$("#code").html("");
				$("#image").append("<img src='http://chart.apis.google.com/chart?cht=qr&chl=" + data + "&chs=" + size + "' alt='qr' />");
				$("#code").append("<p style='color:#fff;'><strong>Image Link:</strong> http://chart.apis.google.com/chart?cht=qr&chl=" + data + "&chs=" + size + "</p>");
				return false;
				}
			}
		}
	</script>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	

</body>
</html>