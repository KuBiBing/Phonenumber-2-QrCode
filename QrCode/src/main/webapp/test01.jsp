<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>12345	</title>
</head>
<body>
<div id="output" onclick="functionA(); functionB();"></div>
	<input type="text" onclick="myFunction()" size="50" placeho lder="URL주소를 입력하세요" style="margin-top:20px" autocomplete="off"/ >
</body>
<script>
function functionA() {
    for (let i=0; i<5; i++) {
        console.log(i + " Mars is a planet");
    }
}
function functionB() {
    for (let i=0; i<5; i++) {
        console.log(i + " The sky is blue");
    }
}
</script>
</html>