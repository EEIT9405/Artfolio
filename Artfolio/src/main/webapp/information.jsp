<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Information</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.css">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/Artfolio/css/sweetalert.css">
<link href="/Artfolio/css/lightbox.css" rel="stylesheet">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="/Artfolio/js/lightbox.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src='/Artfolio/js/sweetalert.min.js'></script>
<style type="text/css">
*{
	font-family:monospace 微軟正黑體;
}

.tdmiddle{
 
   vertical-align:middle; 
   text-align:left;
}
.top-colleciton {
  background-image: url(/Artfolio/img/bg_index.jpg);
  background-size: 100%;
  padding-top: 60px;
}
.active{
	font-size:16px;
}
.footer {
  padding-top: 40px;
  padding-bottom: 10px;
  background-color: #222;
  color: #999;
  font-size: 10px;
  letter-spacing: 1px;
}
.footer hr {
  background-color: #222;
  opacity: 0.1;
}

.title h3{
	text-align:center;
}
.lab1 {

font-size:22px;
}

.col-md-6{
font-style:italic;
}
#contact_form{
background-color:#FFF8DC;
}
.nav-tabs > li > a:hover{
  background-color: #FFEFD5 !important;
    border: medium none;
    border-radius: 0;
    color:	#F4A460;
}
.nav-tabs > li > a{
  border: medium none;
}
.myPhoto {
	overflow: hidden;
	width: 200px;
	height: 200px;
	margin:0 auto;
	margin-top: 12px;
	position: relative;
	cursor: pointer;
	border-radius:100%;
}
.myPhoto img {
	position: absolute;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	width: 140%;
}
</style>


</head>
<body>
<jsp:include page="top/header.jsp"></jsp:include>
<c:if test="${!empty loginOK }">
		<jsp:include page="top/pushPage.jsp"></jsp:include>
	</c:if>
<div class="container-fluid top-colleciton">
   <div class="row">
   	 <div class="col-md-1"></div>
   	 <div class="col-md-10">
		<h1 class="page-header">My info <small>關於我</small></h1>
     </div>   
     <div class="col-md-1"></div>        
   </div>             
</div>
<br/> 
	<!-- Page Content -->
	<div class="container" style="height:auto; min-height:660px; margin-bottom:30px;">

		<!-- Page Heading/Breadcrumbs -->


		<div class="row">
			<div class="col-lg-12">
				<ol class="breadcrumb">
					<li><a href="/Artfolio/index.jsp">Home</a></li>
					<li class="active">個人資訊</li>
				</ol>

			</div>
		</div>
		<!-- /.row -->

		<!-- Project One -->
		<div class="tabbable">
			<!-- Only required for left/right tabs -->
			<ul class="nav nav-tabs" ">
				<li class="active" style="background-color: #FFE4C4;"><a href="#tab1" data-toggle="tab">個人資訊</a></li>
				<li style="background-color: #FFE4C4;"><a href="#tab2" data-toggle="tab">黑名單</a></li>

			</ul>


			<div class="tab-content">

				<!-- 第一格 -->
				<div class="tab-pane active" id="tab1">
					<form class="well form-horizontal" action="MemberUpdate.jsp" method="post"
						id="contact_form">

						<fieldset>
				<legend>個人資訊</legend>
							<div class="row"></div>
							<div class="col-md-9">

								<div class="form-group">
									<label class="col-md-3 control-label lab1">名稱：</label> <label
										class="col-md-6  control-label" style="text-align:left;">${loginOK.name}</label>
								</div>
                            
								<div class="form-group">
									<label class="col-md-3 control-label lab1">信箱：</label> <label
										class="col-md-6  control-label" style="text-align:left;">${loginOK.email}</label>
								</div>

								<div class="form-group">
									<label class="col-md-3 control-label lab1">性別：</label> <label
										class="col-md-6  control-label" style="text-align:left;">
										
										<c:choose>
										<c:when test="${loginOK.gender}">
											男			
										</c:when>
										<c:otherwise>										
										女										
										</c:otherwise>
										</c:choose>
										
		
										</label>
								</div>

								<div class="form-group">
									<label class="col-md-3 control-label lab1">點數：</label> <label  
										class="col-md-6  control-label" style="text-align:left;">${loginOK.point}</label>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label lab1">自我介紹:</label> <label
										class="col-md-6  control-label" style="text-align:left;">${loginOK.info}</label>
								</div>
								
                               <div class="form-group" align="right">

								
									<input type="submit"  class="btn btn-info " name="submit"
										value="更改" />
							

							        </div>
								
							
							</div>


							<div class="col-md-3">

								<div class="form-group">
									<div class="myPhoto"><a href="${loginOK.mphoto}"  rel="lightbox" title="大頭照"><img
									 
										class=" img-hover"
										src="${loginOK.mphoto}" alt="">
									</a>
									</div>
								</div>
								    

							</div>
                            
							
							
						</fieldset>
					</form>
				</div>
				<!-- 黑名單 -->
				<div class="tab-pane " id="tab2">
					<form class="well form-horizontal" action=" " method="post" id="contact_form">
						<fieldset>
							<legend>黑名單</legend>
							<div class="row">
							<div class="col-md-12">
							<table id="blockTable" class="table" style="width:100%">
								<thead>
									<tr>
										<th></th>										
										<th>姓名</th>
										<th>封鎖日期</th>
										<th></th>
										<th></th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							</div>
							</div>
						</fieldset>
					</form>
				</div>

			</div>

		</div>





		<!-- /.row -->

		<hr>

		<!-- Footer -->

	</div>
	<!-- /.container -->
<jsp:include page="top/footer.jsp"></jsp:include>
<script src="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.js"></script>
<script src="js/jquery.formatDateTime.min.js"></script>
<script type="text/javascript">

$(function(){
	var blockTable = $('#blockTable');
	showBlock();
	function showBlock(){
		$.getJSON('listBlock.controller', function(data){
				blockTable.DataTable({
					"data":data,
					"columnDefs": [
					    {"width": "10%", "targets": 3}
					  ],
					"aoColumns":[
						{"data":"targetBean.mphoto",
						    "render": function(mphoto, type, row) {
						        return '<img src="'+mphoto+'" class="img-rounded" style="width:35px; box-shadow: 3px 3px 5px 3px gray;" />';
						    }},
					    {"data":"targetBean.name"},
						{"data":"blockdate", "type":"date", "render":function(data){
							return $.formatDateTime('yy-mm-dd hh:ii',new Date(data));
						}},
						{"data":null,"defaultContent":"<input class='btn btn-danger' name='unBlock' type='button' value='解除'>"},
						{"data":"targetBean.mid", "class":"hidden"}
					]
				});
		});
	}
	
	blockTable.on('click', 'input[name="unBlock"]', function(){
		var mid = $(this).parent('td').parent('tr').children('td:last').text();
		$.get('unBlock.controller', {mid:mid}, function(data){
			if(data == '錯誤'){
				swal('錯誤','error','error');
			}else{
				swal('成功',data,'success');
			}
		});
			$(this).parent('td').parent('tr').remove();
	});
	
	var aa='${ErrorMsg.noupdate}';
    if(aa){

              swal(aa," ","success");
        }
    
    
    var loginOK='${loginOK.mid}';
    if(loginOK)
    $.get('reload.controller',{mid:loginOK},function(data){
    	if(data)
    		$('label.col-md-6.control-label').eq(3).text(data);	
    });
	
});
</script>
</body>
</html>