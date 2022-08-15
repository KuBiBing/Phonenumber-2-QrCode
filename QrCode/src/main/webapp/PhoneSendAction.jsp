<%@ page language="java" import="java.util.*, java.security.*, java.io.*, java.net.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="user.userDAO"%>
<%@ page import="java.io.PrintWriter"%>
<% response.setCharacterEncoding("UTF-8"); %>
<%@ page import = "java.util.Base64.Decoder" %>
<%@ page import = "java.util.Base64.Encoder" %>
<%

// userID로 userEamil을 찾아 세션에 저장
userDAO UserDAO = new userDAO();
String userID = null;
if(session.getAttribute("userID") != null) {
	userID = (String) session.getAttribute("userID");
}
	if(userID == null) {
	    PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
	    script.println("location.href = 'userLogin.jsp'");
   		script.println("</script>");
   		script.close();
   	return;
}

// 만약 emailChecked가 이미 되있다면 이미 인증 된 회원입니다. 출력
//boolean phCheck = UserDAO.getchecked(id);
//if(phCheck == true) {
//   PrintWriter script = response.getWriter();
//   script.println("<script>");
//   script.println("alert('이미 인증 된 회원입니다.');");
//   script.println("location.href = 'index.jsp'");
//   script.println("</script>");
//   script.close();
//   return;
//} 

%>

<%!
public static String nullcheck(String str,  String Defaultvalue ) throws Exception
{
     String ReturnDefault = "" ;
     if (str == null)
     {
         ReturnDefault =  Defaultvalue ;
     }
     else if (str == "" )
    {
         ReturnDefault =  Defaultvalue ;
     }
     else
     {
                 ReturnDefault = str ;
     }
      return ReturnDefault ;
}
/**
* BASE64 Encoder
* @param str
* @return
*/
public static String base64Encode(String str)  throws java.io.IOException {
   Encoder encoder = Base64.getEncoder();
   byte[] strByte = str.getBytes("UTF-8");
   String result = encoder.encodeToString(strByte);
   return result ;
}

/**
* BASE64 Decoder
* @param str
* @return
*/
public static String base64Decode(String str)  throws java.io.IOException {
   Decoder decoder = Base64.getDecoder();
   byte[] strByte = decoder.decode(str);
   String result = new String(strByte);
   return result ;
}
%>
<%
/**==============================================================
 Description        : 캐릭터셋 정의
 EUC-KR: @ page contentType="text/html;charset=EUC-KR
 UTF-8: @ page contentType="text/html;charset=UTF-8
==============================================================**/
%>
<%
/**==============================================================
 Description        :  사용자 샘플코드
==============================================================**/
String charsetType = "UTF-8"; //EUC-KR 또는 UTF-8

request.setCharacterEncoding(charsetType);
response.setCharacterEncoding(charsetType);
String  action = "go"; 
nullcheck(action, "");
if(action.equals("go")) {

   String sms_url = "";
   sms_url = "https://sslsms.cafe24.com/sms_sender.php"; // SMS 전송요청 URL
   String user_id = base64Encode("bh2528"); // SMS아이디
   String secure = base64Encode("1ae44832b574101f771796a71e3c0fd5");//인증키
   String msg = base64Encode(nullcheck("문자 인증 시스템 입니다. 인증코드는[" + UserDAO.SMScheck(userID) + "] 입니다. 화면의 인증코드를 입력해 주세요.", ""));	// msg
   String rphone = base64Encode(nullcheck(UserDAO.search1(userID) + UserDAO.search2(userID) + UserDAO.search3(userID), ""));
//   String rphone1 = base64Encode(nullcheck(UserDAO.search1(id), ""));			// 수신자 번호
//   String rphone2 = base64Encode(nullcheck(UserDAO.search2(id), ""));
//   String rphone3 = base64Encode(nullcheck(UserDAO.search3(id), ""));
   String sphone1 = base64Encode(nullcheck("010", ""));						// 발신자 번호
   String sphone2 = base64Encode(nullcheck("9803", ""));					// 발신자 번호
   String sphone3 = base64Encode(nullcheck("9952", ""));					// 발신자 번호
   String rdate = base64Encode(nullcheck(request.getParameter("rdate"), ""));
   String rtime = base64Encode(nullcheck(request.getParameter("rtime"), ""));
   String mode = base64Encode("1");
   String subject = "";
   if(nullcheck(request.getParameter("smsType"), "").equals("L")) {
       subject = base64Encode(nullcheck(request.getParameter("subject"), ""));
   }
   String testflag = base64Encode(nullcheck(request.getParameter("testflag"), ""));
   String destination = base64Encode(nullcheck(request.getParameter("destination"), ""));
   String repeatFlag = base64Encode(nullcheck(request.getParameter("repeatFlag"), ""));
   String repeatNum = base64Encode(nullcheck(request.getParameter("repeatNum"), ""));
   String repeatTime = base64Encode(nullcheck(request.getParameter("repeatTime"), ""));
   String returnurl = nullcheck(request.getParameter("returnurl"), "");
   String nointeractive = nullcheck(request.getParameter("nointeractive"), "");
   String smsType = base64Encode(nullcheck(request.getParameter("smsType"), ""));

   String[] host_info = sms_url.split("/");
   String host = host_info[2];
   String path = "/" + host_info[3];
   int port = 80;

   // 데이터 맵핑 변수 정의
   String arrKey[]
       = new String[] {"user_id","secure","msg", "rphone", "sphone1","sphone2","sphone3","rdate","rtime"
                   ,"mode","testflag","destination","repeatFlag","repeatNum", "repeatTime", "smsType", "subject"};
   String valKey[]= new String[arrKey.length] ;
   valKey[0] = user_id;
   valKey[1] = secure;
   valKey[2] = msg;
   valKey[3] = rphone;
//   valKey[3] = rphone1;
//   valKey[4] = rphone2;
//   valKey[5] = rphone3;
   valKey[4] = sphone1;
   valKey[5] = sphone2;
   valKey[6] = sphone3;
   valKey[7] = rdate;
   valKey[8] = rtime;
   valKey[9] = mode;
   valKey[10] = testflag;
   valKey[11] = destination;
   valKey[12] = repeatFlag;
   valKey[13] = repeatNum;
   valKey[14] = repeatTime;
   valKey[15] = smsType;
   valKey[16] = subject;

   String boundary = "";
   Random rnd = new Random();
   String rndKey = Integer.toString(rnd.nextInt(32000));
   MessageDigest md = MessageDigest.getInstance("MD5");
   byte[] bytData = rndKey.getBytes();
   md.update(bytData);
   byte[] digest = md.digest();
   for(int i =0;i<digest.length;i++)
   {
       boundary = boundary + Integer.toHexString(digest[i] & 0xFF);
   }
   boundary = "---------------------"+boundary.substring(0,11);

   // 본문 생성
   String data = "";
   String index = "";
   String value = "";
   for (int i=0;i<arrKey.length; i++)
   {
       index =  arrKey[i];
       value = valKey[i];
       data +="--"+boundary+"\r\n";
       data += "Content-Disposition: form-data; name=\""+index+"\"\r\n";
       data += "\r\n"+value+"\r\n";
       data +="--"+boundary+"\r\n";
   }

   //out.println(data);

   InetAddress addr = InetAddress.getByName(host);
   Socket socket = new Socket(host, port);
   // 헤더 전송
   BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), charsetType));
   wr.write("POST "+path+" HTTP/1.0\r\n");
   wr.write("Content-Length: "+data.length()+"\r\n");
   wr.write("Content-type: multipart/form-data, boundary="+boundary+"\r\n");
   wr.write("\r\n");

   // 데이터 전송
   wr.write(data);
   wr.flush();
/*
   // 결과값 얻기
   BufferedReader rd = new BufferedReader(new InputStreamReader(socket.getInputStream(),charsetType));
   String line;
   String alert = "";
   ArrayList tmpArr = new ArrayList();
   while ((line = rd.readLine()) != null) {
       tmpArr.add(line);
   }
   wr.close();
   rd.close();

   String tmpMsg = (String)tmpArr.get(tmpArr.size()-1);
   String[] rMsg = tmpMsg.split(",");
   String Result= rMsg[0]; //발송결과
   String Count= ""; //잔여건수
   if(rMsg.length>1) {Count= rMsg[1]; }

                   //발송결과 알림
   if(Result.equals("success")) {
      alert = "성공적으로 발송하였습니다.";
       alert += " 잔여건수는 "+ Count+"건 입니다.";
   }
   else if(Result.equals("reserved")) {
       alert = "성공적으로 예약되었습니다";
       alert += " 잔여건수는 "+ Count+"건 입니다.";
   }
   if(Result.equals("3205")) {
       alert = "잘못된 번호형식입니다.";
   }
   else {
       alert = "[Error]"+Result;
   }

   out.println(nointeractive);

   if(nointeractive.equals("1") && !(Result.equals("Test Success!")) && !(Result.equals("success")) && !(Result.equals("reserved")) ) {
       out.println("<script>alert('" + alert + "')</script>");
   }
   else if(!(nointeractive.equals("1"))) {
       out.println("<script>alert('" + alert + "')</script>");
   }


   out.println("<script>location.href='"+returnurl+"';</script>");*/
   
   
}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title> 우리가 만들 첫 번째 페이지 </title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">Hello world!</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="index.jsp">메인화면</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
					메뉴
					</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<a class="dropdown-item" href="userJoin.jsp">회원가입</a>
						<a class="dropdown-item" href="userLogin.jsp">로그인</a>
					</div>
				</li>
			</ul>
		</div>
	</nav>
	<section class="container mt-3" style="max-width: 560px;">
	<form method="post" action="PhoneCheckAction.jsp">
		
			<div class="form-group">
				<label>인증번호를 입력해주세요.</label>
				<input type="text" name="checknum" class="form-control" maxlength="6" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')"/>
			</div>
			<button type="submit" class="btn btn-primary">인증번호 확인</button>
		</form>
	</section>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	
</body>
</html>
