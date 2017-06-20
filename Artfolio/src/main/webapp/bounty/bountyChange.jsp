<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Artfolio活動徵稿--活動更新</title>

<!-- Bootstrap Core CSS -->
<link href="/Artfolio/css/bootstrap.min.css" rel="stylesheet">
<link href="/Artfolio/font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" type="text/css" media="screen"
	href="/Artfolio/css/bootstrap-datetimepicker.min.css">
<link href="/Artfolio/css/fileinput.min.css" rel="stylesheet">
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<style type="text/css">
#bd {
	margin: 0;
	font-family: "微軟正黑體", Helvetica, Arial, sans-serif;
	font-size: 14px;
	line-height: 20px;
	height:auto;
	min-height:500px;
	margin-bottom:30px;
	margin-top:50px;
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
#header {
	padding-top:50px;
	margin:0;
    max-width:100%;
    max-height:auto;
/*     border-bottom:1px solid black */
}
#bd .navbar {
	margin-bottom:0;
}
#bd .breadcrumb {
margin-bottom:0;
background-color:#E6E6E6;
/* border-bottom:1px solid black; */
color:#F3F781;
font-weight:bolder;
text-align:center;
}
#bd h2{
padding-top:60px;
}
#bd .col-md-2{
	text-align:right;
	height:183px;
	padding:0;
	padding-right:30px;
}
#bd .col-md-4{
	padding:0;
}
#bd .col-md-6{
	padding:0;
	height:183px;
	padding-left:10px;
}
#bd .div panel-heading{
	background-color:#F3F781
}
#bd p{
	margin:0
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
				<form class="well form-horizontal" action="personal.controller" method="POST" enctype="multipart/form-data" 
					id="contact_form">
					<fieldset>
						<!-- text 1 -->
						<div class="form-group">
							<label class="col-md-4 control-label">主題</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-screenshot"></i></span> <input
										name="topic" placeholder="topic" value="${change.b_title}" class="form-control"
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
										class="glyphicon glyphicon-time"></i></span> <input name="startdate"
										placeholder="startdate" class="form-control" id="datetimepicker" value="${change.b_startdate}"
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
										placeholder="enddate" class="form-control" id="datetimepicker1" value="${change.b_enddate}"
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
										placeholder="date" class="form-control" id="datetimepicker2" value="${change.b_announced}"
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
										class="glyphicon glyphicon-usd"></i></span> <input name="totalbonus" value="${change.b_bonus_total}"
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
										class="glyphicon glyphicon-usd"></i></span> <input name="maxbonus" value="${change.b_bonus_max}"
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
										class="glyphicon glyphicon-user"></i></span> <input name="organizer" value="${change.b_organizer}"
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
										 rows="10" placeholder="content">${change.b_content}</textarea>
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
										rows="10" placeholder="particimethod">${change.b_partimethod}</textarea>
								</div>
								<div>${err.aprti}</div>
							</div>
						</div>
						<!-- file 1  -->
						<div class="form-group">
							<label class="col-md-4 control-label">活動圖片</label>
							<div class="col-md-4 inputGroupContainer">
							
							<div class="file-preview-frame krajee-default  kv-preview-thumb"
								id="imgori" data-fileindex="0" data-template="image" style="display:inline">
								<div class="kv-file-content">
									<img
										src="/bountyImgs/${change.b_attach_pic.substring(change.b_attach_pic.lastIndexOf("/")+1)}" class="file-preview-image kv-preview-data rotate-1"
										title="" alt=""
										style="width: auto; height: 160px;">
								</div>
								<div class="file-thumbnail-footer">
									<div class="file-footer-caption" title="">
										${change.b_title}<br>
									</div>
									<div class="file-upload-indicator" title="Not uploaded yet">
										<i class="glyphicon glyphicon-hand-down text-warning"></i>
									</div>
									<div class="file-actions">
										<div class="file-footer-buttons">
											<button type="button"
												class="kv-file-zoom btn btn-xs btn-default"
												title="View Details">
												<i class="glyphicon glyphicon-zoom-in"></i>
											</button>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
									<input type="hidden" name="oriurl" value="C:/Artfolio/BountyImgs/${change.b_attach_pic.substring(change.b_attach_pic.lastIndexOf("/")+1)}"/>						
							
							
							
							
							
							<div style="position:absolute;"></div>
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
							<input id="submit" type="submit" class="btn btn-warning " name="action"  value="修改" />
							<input type="reset" class="btn btn-warning " value="復原"/>
							</div>
							<div class="col-md-4">
							<input type="button" class="btn btn-info" value="重置" />
							</div>
						</div>
						<div>${err.error}</div>
						<input type="hidden" name="bid"  value="${change.b_id}" >	
					</fieldset>
				</form>

			

			</div>
		</div>
		<!-- /.row -->
		<hr>

	
	</div>
	</div>
<jsp:include page="../top/footer.jsp"></jsp:include>
	<!-- /.container -->
	<!-- jQuery -->

	<script src="../js/fileinput.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap-datetimepicker.zh-CN.js"></script>

	<script type="text/javascript">	
	 	$(function() {
	 		
	 		$("body").on("change", "#pic", function (){
	 	        $('#imgori').hide();
	 	    }) 	
	 		
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
	 		
	 		
	 		$('input[name=startdate]').val('${change.b_startdate}'.substring(0,19));
			$('input[name=enddate]').val('${change.b_enddate}'.substring(0,19));
			$('input[name=announced]').val('${change.b_announced}'.substring(0,19));
	 		
	 		
// 			$('input[name=startdate]').val('${change.b_startdate}');
// 			$('input[name=enddate]').val('${change.b_enddate}');
// 			$('input[name=announced]').val('${change.b_announced}');
	 		
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
