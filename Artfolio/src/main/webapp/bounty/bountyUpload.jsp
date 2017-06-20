<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modern Business - Start Bootstrap Template</title>

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../css/modern-business.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/bootstrap-datetimepicker.min.css">
<link href="../css/fileinput.min.css" rel="stylesheet">


  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">

<style type="text/css">
#bd {
	margin: 0;
	font-family: "微軟正黑體", Helvetica, Arial, sans-serif;
	font-size: 14px;
	line-height: 20px;
	
/* 	background-color: #ffffff; */
/* 	background-image: url('/Artfolio/webbackground/26.jpg'); */
/* 	-moz-background-size: cover; */
/* 	-webkit-background-size: cover; */
/* 	-o-background-size: cover; */
/* 	background-size: cover; 	 */
}
#bd .img-responsive {
	width: 300px;
}
#bd .t1 {
	border-style: solid;
	border-width: 3px;
	border-radius: 10px;
}
#bd .row{
	margin-top:10px;
	margin-left: 0px;
	margin-right: 0px;
	padding:0;
}
#bd .breadcrumb {
margin-bottom:0;
background-color:#E6E6E6;
/* border-bottom:1px solid black; */
color:#F3F781;
font-weight:bolder;
text-align:center;
}
#bd .col-md-4 h1 {
	max-width: calc(100% - 120px);
	color: #fff;
	margin-left:150px;
	margin-bottom:10px;
	margin-top:10px;
}


</style>
</head>

<body background="/Artfolio/webbackground/vintage-leaves.png">
		<jsp:include page="../top/header.jsp"></jsp:include>
		<div id="bd">
		<header>
				
			<ol class="breadcrumb">
				<li class="active"><a
					href="<c:url value="/bounty/bountyDisplay.jsp"/>">所有活動</a></li>
				<li class="active"><a
					href="<c:url value="/bounty/bountyTrackPage.jsp"/>">活動追蹤</a></li>
				<li class="active"><a
					href="<c:url value="/bounty/bountyPersonal.jsp"/>">活動管理</a></li>
				<li class="active"><a
					href="<c:url value="/bounty/bountyUpload.jsp"/>">舉辦活動</a></li>
			</ol>
		
		</header>

	<!-- /.container -->
	<!-- Page Content -->
	<div class="container">
		
		<!-- Content Row -->
		<div class="row">
			<div class="col-lg-12" >
				<form class="well form-horizontal" action="bounty.controller" method="POST" enctype="multipart/form-data" 
					id="contact_form">
					<fieldset>
<!-- 						<legend>舉辦活動</legend> -->
						<!-- text 1 -->
						<div class="form-group">
							<label class="col-md-4 control-label">主題</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-screenshot"></i></span> <input
										name="topic" placeholder="topic" value="${param.topic}" class="form-control"
										type="text">
								</div>
								<div>${err.topic}</div>
							</div>
						</div>
						<!-- text 2 -->
						<div class="form-group">
							<label class="col-md-4 control-label">標籤</label>
							<div class="col-md-4 inputGroupContainer">
								<ul class="list-inline">
									<li class="list"><input type="checkbox"
									value="設計" name="tag">設計</li>
									<li class="list"><input type="checkbox"
									value="攝影" name="tag">攝影  </li>
									<li class="list"><input type="checkbox"
									value="企劃" name="tag">企劃 </li>
									<li class="list"><input type="checkbox"
									value="實習生徵求" name="tag">實習生徵求 </li>
									<li class="list"><input type="checkbox"
									value="其他" name="tag">其他 </li>
								</ul>
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-tags"></i></span> <input id="tag" name="tag"
										placeholder="tag" class="form-control" type="text"> <span
										class="input-group-btn"><button id="button" class="btn btn-default"
											type="button">新增</button> </span>
								</div>	
									<div id="newTag"></div>
									<div id="tagInfo"></div>							
							</div>
						</div>														
						
						<!-- text 3 -->
						<div class="form-group">
							<label class="col-md-4 control-label">開始日期</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-time"></i></span>
										<input name="startdate"
										placeholder="startdate" class="form-control" id="datetimepicker" value="${param.startdate}"
										type="text">
								</div>
								<div>${err.start}</div>
							</div>
						</div>
						<!-- text 4 -->
						<div class="form-group">
							<label class="col-md-4 control-label">截止日期</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-time"></i></span> <input name="enddate"
										placeholder="enddate" class="form-control" id="datetimepicker1" value="${param.enddate}"
										type="text">
								</div>
								<div>${err.end}</div>
							</div>
						</div>
						<!-- text 5 -->
						<div class="form-group">
							<label class="col-md-4 control-label">公布得獎日期</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-time"></i></span> <input name="announced"
										placeholder="date" class="form-control" id="datetimepicker2" value="${param.announced}"
										type="text">
								</div>
								<div>${err.anno}</div>
							</div>
						</div>
						<!-- text 6 -->
						<div class="form-group">
							<label class="col-md-4 control-label">總獎金</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-usd"></i></span> <input name="totalbonus" value="${param.totalbonus}"
										placeholder="totalbonus" class="form-control" type="text">
								</div>
								<div>${err.totalbonus}</div>
							</div>
						</div>								
						<!-- text 7 -->
						<div class="form-group">
							<label class="col-md-4 control-label">最高獎金</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-usd"></i></span> <input name="maxbonus" value="${param.maxbonus}"
										placeholder="maxbonus" class="form-control" type="text">
								</div>
								<div>${err.maxbonus}</div>
							</div>
						</div>
						<!-- text 8 -->
						<div class="form-group">
							<label class="col-md-4 control-label">主辦單位</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input name="organizer" value="${param.organizer}"
										placeholder="organizer" class="form-control" type="text">
								</div>
								<div>${err.organizer}</div>
							</div>
						</div>
						<!-- textarea 1 -->
						<div class="form-group">
							<label class="col-md-4 control-label">活動詳情</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-pencil"></i></span>
									<textarea class="form-control" name="content" id="content"
										 placeholder="content"></textarea>
								</div>
								<div>${err.content}</div>
							</div>
						</div>

						<!-- textarea 2 -->
						<div class="form-group">
							<label class="col-md-4 control-label">參加辦法</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-pencil"></i></span>
									<textarea class="form-control" name="particimethod" id="particimethod"
										placeholder="particimethod"></textarea>
								</div>
								<div>${err.aprti}</div>
							</div>
						</div>
						<!-- file 1  -->
						<div class="form-group">
							<label class="col-md-4 control-label">活動圖片</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-picture"></i></span> <input id="pic"
										name="pic" type="file" class="file" multiple data-show-upload="false">
								</div>
								<div>${err.attach}</div>
							</div>
						</div>
						<!-- file 2  -->
						<div class="form-group">
							<label class="col-md-4 control-label">檔案</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-folder-open"></i></span> <input
										id="file" name="file" type="file" class="file">
								</div>
								<div></div>
							</div>
						</div>

						<!-- submit   -->
						<div class="form-group">
							<label class="col-md-4 control-label"></label>
							<div class="col-md-2">
							<input id="submit" type="submit" class="btn btn-warning " name="submit"  value="發布" />
							</div>
							<div class="col-md-4">
							<input type="button" class="btn btn-info" value="重置" />
							</div>
						</div>
						<div>${err.error}</div>
					</fieldset>
				</form>

			</div>
		</div>
		<!-- /.row -->
	</div>
</div>
	<!-- /.container -->
	<!-- jQuery -->
	<script src="../js/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/fileinput.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap-datetimepicker.zh-CN.js"></script> 


	<script type="text/javascript">	
	 	$(function() {
	 		
	 		
	 		 $('#datetimepicker').datetimepicker({
		 			Date:'yyyy-mm-dd',
		 			format: 'yyyy-mm-dd hh:ii:ss',
		 			language:'zh-CN',
		 			autoclose:true,
		 			minView:'hour',
		 			maxView:1,
		 			todayBtn:'linked',
		 			showMeridian:false,
		 		});
		 		$('#datetimepicker1').datetimepicker({
		 			Date:'yyyy-mm-dd',
		 			format: 'yyyy-mm-dd hh:ii:ss',
		 			language:'zh-CN',
		 			autoclose:true,
		 			minView:'hour',
		 			maxView:1,
		 			todayBtn:'linked',
		 			showMeridian:false,
		 		});
		 		$('#datetimepicker2').datetimepicker({
		 			Date:'yyyy-mm-dd',
		 			format: 'yyyy-mm-dd hh:ii:ss',
		 			language:'zh-CN',
		 			autoclose:true,
		 			minView:'hour',
		 			maxView:1,
		 			todayBtn:'linked',
		 			showMeridian:false,
		 		});
	 		
	 		
	 		
// 	 		$('#datetimepicker').datetimepicker({
// 				format : 'yyyy-mm-dd hh:ii:ss'
// 			})
// 			$('#datetimepicker1').datetimepicker({
// 				format : 'yyyy-mm-dd hh:ii:ss'
// 			})
// 			$('#datetimepicker2').datetimepicker({
// 				format : 'yyyy-mm-dd hh:ii:ss'
// 			})
			
			
			
			
			$('input[name=startdate]').val('${param.startdate}');
			$('input[name=enddate]').val('${param.enddate}');
			$('input[name=announced]').val('${param.announced}');
	 		console.log($('input[name=announced]').val());
			$('#submit').click(function() {	
				if($(this).prop('checked')){	        //if checkbox打勾  append <input>
					$("#tagInfo").append('<input type="hidden" name="tag" id=id'+$(this).val()+' value='+$(this).val()+' />')
				}
			})	
			$('#button').click(function() {
// 				alert($('#tag').val())
				$("#newTag").append('<span  class="btn btn-default btn-sm">'+$('#tag').val()+'<span/>')
				$("#tagInfo").append('<input type="hidden" name="tag" id=id'+$('#tag').val()+' value='+$('#tag').val()+' />')
				$('#tag').val("")
			})
	});
	 
		
	</script>
</body>
</html>
