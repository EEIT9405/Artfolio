<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Login</title>
  <!-- Bootstrap Core CSS -->
<link href="/Artfolio/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/Artfolio/css/modern-business.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/Artfolio/font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
  
 <link rel="stylesheet" href="/Artfolio/css/loginstyle.css">
 <link rel="stylesheet" href="/Artfolio/css/sweetalert.css">
    <script src="/Artfolio/js/jquery-3.2.1.min.js"></script>
    <script src="/Artfolio/js/bootstrap.min.js"></script>
<style type="text/css">
#content{
margin-top: 100px;
}

</style>
<script type="text/javascript">
//由<body>的onLoad事件處理函數觸發此函數
function setFocusToUserId(){   
	 document.forms[0].email.focus();   // 將游標放在userId欄位內
}






</script>
</head>
<body onLoad="setFocusToUserId()">
<jsp:include page="../top/header.jsp"></jsp:include>

<div class="container">
	<section id="content">
		<form action="<c:url value="/secure/login.controller" />" method="get">
			<h1>登入畫面</h1>
			
			<div>
				<input  type="text" name="email" placeholder="Email" value="${param.email}"/><spa style="color: red;">${error.email}</span>
			</div>
			<div>
				<input   type="password" name="password" placeholder="password"value="${param.password}"/><span style="color: red;">${error.password}</span>
			</div>
			<div><input autocomplete="off" type="text" name="vcode"placeholder="請輸入驗證碼" /><img id="imgchang"  src="<c:url value="/image.controller" />" /><span style="color: red;">${error.msg}</span><a href="#" id="change" >看不清楚，換一張</a></div>
			<div>
				<input  type="submit" value="登入">
				<a href="${pageContext.request.contextPath}/secure/forgotpass.jsp">Lost your password?</a>
				<a href="${pageContext.request.contextPath}/Member.jsp">註冊</a>
			</div>
		</form><!-- form -->
		
	</section><!-- content -->
</div><!-- container -->


    <script src="/Artfolio/js/index.js"></script>
   	<script src="/Artfolio/js/sweetalert.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	if('${newemail}'=='1'){
			
			swal("已寄新的密碼到您的信箱", "You clicked the button!", "success")
	}
	
	
	$('#change').click(function(){
	   
	$('#imgchang').attr('src','/Artfolio/image.controller?'+new Date().getTime())
	

	})
	

	var aa='${InsertOK}';
             if(aa){
             
              swal("註冊完成","","success")
        }
      
	
	});



</script>
<c:remove var="InsertOK" scope="session" />
</body>
</html>