<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <!-- Bootstrap Core CSS -->
<link href="/Artfolio/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/Artfolio/css/modern-business.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/Artfolio/font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
  
 <link rel="stylesheet" href="/Artfolio/css/loginstyle.css">
	<script src="/Artfolio/js/jquery-3.2.1.min.js"></script>
	<script src="/Artfolio/js/bootstrap.min.js"></script>
<style type="text/css">
#content{
margin-top: 100px;
}

</style>


</head>
<body>





<jsp:include page="../top/header.jsp"></jsp:include>

<div class="container">
	<section id="content">
		<form action="<c:url value="/secure/forgotpass.controller" />"  method="post">
			<h1>忘記密碼</h1>
			
			<div>
				<input type="text" name="femail" placeholder="請輸入你的信箱帳號">
<span>${error.femail}</span>
			</div>
			
		
			<div>
	<input  style="left:25%;"  id="subOK" type="submit"  name="action" value="重新申請"><span>${error.action}</span>
			</div>
		</form><!-- form -->
		
	</section><!-- content -->
</div><!-- container -->











 <script src="/Artfolio/js/index.js"></script>

<script type="text/javascript">


</script>
</body>
</html>