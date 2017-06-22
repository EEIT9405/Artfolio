<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" type="text/css" media="screen"
	href="css/bootstrap-datetimepicker.min.css">

<link href="css/fileinput.min.css" rel="stylesheet">

<link rel="stylesheet" href="/Artfolio/css/sweetalert.css">
<style type="text/css">



.radio1{

width:20px ;

height:20px;
font-size: 20px;

}
#contact_form{
background-color: #D3D3D3;

}

</style>
</head>
<body>

<jsp:include page="top/header.jsp"></jsp:include>


<div class="container" style="height:auto; min-height:500px; margin-bottom:30px; margin-top:50px;">
	

			<form class="well form-horizontal" action=" member.controller" method="post"
					id="contact_form" enctype="multipart/form-data">
					<fieldset>
						<legend>更新會員資訊</legend>

						<!-- text 1 -->
						<div class="form-group">
							<label class="col-md-4 control-label">信箱帳號</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-envelope"></i></span> <input
										name="email" placeholder="Email" class="form-control" value="${loginOK.email}"
										type="text">
								</div>
								<span style="color: red; font-size: 60%; display: inline">${ErrorMsg.email}</span>
							</div>
						</div>
						<!-- text 2 -->
						<div class="form-group">
							<label class="col-md-4 control-label">密碼</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-lock"></i></span> <input name="pwd"
										placeholder="Password" value="${loginOK.pwd}" class="form-control" type="text">
										
								</div>
								<span style="color: red; font-size: 60%; display: inline">${ErrorMsg.pwd}</span>
							</div>
						</div>

						<!-- text 3 -->
						<div class="form-group">
							<label class="col-md-4 control-label">暱稱</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input
										name="name" placeholder="name" class="form-control" value="${loginOK.name}"
										type="text">
								</div>
								<span style="color: red; font-size: 60%; display: inline">${ErrorMsg.name}</span>
							</div>
						</div>
						<!-- text 4 -->
						<div class="form-group">
							<label class="col-md-4 control-label">性別</label>
							<div class="col-md-4 inputGroupContainer ">
								<div class="input-group " >
						
										 <input class="radio1"
										name="gender" type=radio value="boy" 
										checked>男<input class="radio1" name="gender" type=radio value="girl">女<span>${err.topic}</span>
										
								</div>
							</div>
						</div>

						
						
						<!-- textarea 1 -->
						<div class="form-group">
							<label class="col-md-4 control-label">自我介紹</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-pencil"></i></span>
										
									<textarea   id="changearea"   onfocus="test3()" Wrap="hard" class="form-control" name="info" 
										placeholder="自我介紹">${loginOK.info}</textarea><span>${err.aprti}</span>
								</div>
							</div>
						</div>

						

						<!-- file 1  -->
						<div class="form-group">
							<label class="col-md-4 control-label">大頭貼</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-picture"></i></span>  
										
										
									<div class="file-preview-frame krajee-default  kv-preview-thumb"
								id="imgori" data-fileindex="0" data-template="image" style="display:inline">
								<div class="kv-file-content">
									<img
										src="${loginOK.mphoto}" class="file-preview-image kv-preview-data rotate-1"
										title="" alt=""
										style="width: auto; height: 160px;">
								</div>
								<div class="file-thumbnail-footer">
									<div class="file-footer-caption" title="">
										原圖<br>
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
										
										
					
										<input id="pic" name="mphoto" type="file" class="file" multiple data-show-upload="false" value="">
										
								</div>
<%-- 								<img id="imgori" alt="" style="height: 80px;" src="/memberPhoto/${loginOK.mphoto.substring(loginOK.mphoto.lastIndexOf('/')+1)}"> --%>
							</div>
							
						</div>
						

						<!-- submit   -->

						<div class="form-group">
							<label class="col-md-4 control-label"></label>
							<div class="col-md-2">
							<input  id="change"type="submit" class="btn btn-warning " name="action"  value="更新" />
							</div>
							<div class="col-md-4">
							<input type="reset" class="btn btn-info" value="重置" />
							</div>
						</div>
 
					</fieldset>
				</form>
	
</div>
<jsp:include page="top/footer.jsp"></jsp:include>
	<script src="js/jquery-3.2.1.min.js"></script>
	

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
	<script src="js/fileinput.min.js"></script>
	<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
	<script src="/Artfolio/js/sweetalert.min.js"></script>
	
	
	
	
	<script type="text/javascript">
	$(document).ready(function() {
		
		$("body").on("change", "#pic", function (){
 	        $('#imgori').hide();
 	    }) 	
		
		
		
		
		var aa='${ErrorMsg.noupdate}';
                 if(aa){
                 
                  swal(aa,"" ,"error")
            }
	});
	
	function test3(){
		$('#changearea').css('width','300px').css('height','200px');
	}
	
	
	
	</script>
</body>
</html>