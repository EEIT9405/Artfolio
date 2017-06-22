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
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/bootstrap-datetimepicker.min.css">
<link href="../css/fileinput.min.css" rel="stylesheet">
<link href="/Artfolio/css/sweetalert.css" rel="stylesheet">
<script src="/Artfolio/js/jquery-3.2.1.min.js"></script>
<script src="/Artfolio/js/bootstrap.min.js"></script>
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
#bd .btn{
 	margin-bottom:10px;
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
#bd .col-md-4 h1 {
	max-width: calc(100% - 120px);
	color: #fff;
	margin-left:150px;
	margin-bottom:10px;
	margin-top:10px;
}
#msg h4{
	margin-left:400px;
	font-weight:bolder;
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
		
		<!-- Project One -->
		<div class="row">
			<div class="col-md-4">
				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" href="#hidden-list3">排序</a>
							</h4>
						</div>
						<div id="hidden-list3" class="panel-collapse collapse"
							align="center">
							<ul class="list-inline">
								<li class="list"><label class="radio-inline"><input
										type="radio" value="b_bonus_total" name="order"> 最高獎金</label></li>
								<li class="list"><label class="radio-inline"><input
										type="radio" value="b_click" name="order"> 熱門活動</label></li>
								<li class="list"><label class="radio-inline"><input
										type="radio" value="b_update" name="order"> 最新活動</label></li>
							</ul>
						</div>
					</div>

					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" href="#hidden-list4">階段</a>
							</h4>
						</div>
						<div id="hidden-list4" class="panel-collapse collapse"
							align="center">
							<ul class="list-inline">
									<li class="list"><input type="checkbox" value="0" name="ing">徵件中</li>
									<li class="list"><input type="checkbox" value="2" name="sonn">即將截止</li>
									<li class="list"><input type="checkbox" value="1" name="end">已結束</li>
									<li class="list"><input type="checkbox" value="3" name="ann">獲選公佈</li>
							</ul>
						</div>
					</div>

					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" href="#hidden-list">總獎金範圍</a>
							</h4>
						</div>

						<div id="hidden-list" class="panel-collapse collapse">
							<ul class="list-group">
								<li class="list-group-item"><input type="checkbox"
									value="below50k" name="below50k">5萬以下</li>
								<li class="list-group-item"><input type="checkbox"
									value="50to100k" name="50to100k">5萬到10萬</li>
								<li class="list-group-item"><input type="checkbox"
									value="100to250k" name="100to250k">10萬到25萬 </li>
								<li class="list-group-item"><input type="checkbox"
									value="250to500k" name="250to500k">25萬到50萬 </li>
								<li class="list-group-item"><input type="checkbox"
									value="500kup" name="500kup">50萬以上  </li>
							</ul>
						</div>					
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" href="#hidden-list2">類別選擇</a>
							</h4>
						</div>

						<div id="hidden-list2" class="panel-collapse collapse">
							<ul class="list-group">
								<li class="list-group-item">設計類別:</li>
								<li class="list-group-item"><input type="checkbox"
									value="t平面設計" name="t平面設計">平面設計</li>
								<li class="list-group-item"><input type="checkbox"
									value="t產品設計" name="t產品設計">產品設計</li>
								<li class="list-group-item">影像類別:</li>
								<li class="list-group-item"><input type="checkbox"
									value="t攝影" name="t攝影">攝影</li>
								<li class="list-group-item"><input type="checkbox"
									value="t影片" name="t影片">影片</li>
								<li class="list-group-item">寫作類別:</li>
								<li class="list-group-item"><input type="checkbox"
									value="t文學獎" name="t文學獎">文學獎</li>
								<li class="list-group-item"><input type="checkbox"
									value="t創意寫作" name="t創意寫作">創意寫作</li>
								<li class="list-group-item">商業類別:</li>
								<li class="list-group-item"><input type="checkbox"
									value="tag企劃" name="t企劃">企劃</li>
								<li class="list-group-item"><input type="checkbox"
									value="tag創業" name="t創業">創業</li>
								<li class="list-group-item">其他類別:</li>
								<li class="list-group-item"><input type="checkbox"
									value="t實習生徵求" name="t實習生徵求">實習生徵求</li>
								<li class="list-group-item"><input type="checkbox"
									value="t其他" name="t其他">其他</li>
							</ul>
						</div>
					</div>
				</div>
			</div>



			<div id="bountyTable" class="col-md-8">
				<!--            row1 -->		
				<!-- row -->
			</div>
			
			<div id="msg"></div>
		</div>

		<!-- Pagination -->
		<div class="row text-center">
			<div class="col-lg-12">
				<ul class="pagination">
					<li><a href="#">&laquo;</a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>
			</div>
		</div>
		<!-- /.row -->

		<hr>

		<!-- Footer -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<p>Copyright &copy; Your Website 2014</p>
				</div>
			</div>
		</footer>

	</div>
	<!-- /.container -->
</div>
<jsp:include page="../top/footer.jsp"></jsp:include>


<script src="/Artfolio/js/sweetalert.min.js"></script>
<script type="text/javascript">
		
//=========顯示下拉式選單====================================
		$(function() {
			$('#hidden-list').collapse('show')
			$('#hidden-list2').collapse('show')
			$('#hidden-list3').collapse('show')
			$('#hidden-list4').collapse('show')
		});	
//==========================================================		
		
		$(function() {
			var mid = "${loginOK.mid}"
				
				var contentPath = "${pageContext.request.contextPath}"
				if (!$('input:checkbox').prop('checked')) { //如果條件選擇器未勾選預設載入所有活動資訊
					loadBounty(mid);
				}
				$('input:checkbox').change(function() { //選擇器選取狀態改變
					if ($(':checkbox:checked').prop('checked')) { //若checkbox有打勾			                          
						selectBounty($(this).val()); //取得打勾checkbox的值並以此選取活動資訊
					} else {
						loadBounty(mid); //取消選擇  載入loadBounty()
					}
				})			
		})
		

	function loadBounty(mid) {	
				$.getJSON('personalDisplay.controller',{"mid" : mid},function(datas) {	
					
					if ( datas.length == 0 ) {
						$('#msg').empty();
						$('#msg').append("<div><h4>您目前沒有發布任何活動</h4></div>")
				    }
					
					var count = 0;
					$('#bountyTable').empty();
					$.each(datas,function(idx, bounty) {
						
						
						var enddate = bounty.b_enddate;
						enddate = enddate.replace('T',' ').replace(enddate.substring(enddate.lastIndexOf('.')),'')
						
						$('#bountyTable').append("<div id='row"+ count +"' class='row' style='border:1px solid #D8D8D8; border-radius:20px; overflow:hidden ;background-color:#fff'></div>");
						$('#row'+count).html("<div class='col-md-4'></div><div class='col-md-6'></div><div class='col-md-2'></div>");
						$('#row'+count+' >div:nth-child(1)').html("<a href='/Artfolio/bounty/bountyPage.controller?id="
								+ bounty.b_id
								+ "'><img style='border-radius:10px'  class='img-responsive' alt='Cinque Terre' src='/bountyImgs/"
								+ bounty.b_attach_pic
										.substring(bounty.b_attach_pic
												.lastIndexOf('/') + 1)
								+ "'></a>")
						$('#row'+count+' >div:nth-child(2)').html("<h3><a href='/Artfolio/bounty/bountyPage.controller?id="+ bounty.b_id+"'>"+bounty.b_title+"</a></h3>"
																   + "<div>總獎金 TWD$ : "+ bounty.b_bonus_total 
																   + "</div><div style=' margin-bottom:20px'>截止收件 : "+ enddate +"</div>"
																   + "<div style='font-size:12px' class='btn btn-default' id='soon"+count+"'>即將截止</div>"
																   + "<div style='font-size:12px' class='btn btn-default' id='ing"+count+"'>進行中</div>"
																   + "<div style='font-size:12px' class='btn btn-default' id='end"+count+"'>已結束</div>"
																   + "<div style='font-size:12px' class='btn btn-default' id='ann"+count+"'>獲選公布</div><br>"											  
																   + "<div style='display:none'>"+ bounty.b_id+ "</div>"
																   + "<div style='display:none'>"+ bounty.mid+ "</div>"
																   + "<div style='display:none'>"+ bounty.b_title+ "</div>")
						$('#row'+count+' >div:last-child').html("<br><p><i class='glyphicon glyphicon-eye-open'></i>"+ bounty.b_click +"</p>"
																   +"<p><i class='glyphicon glyphicon-comment'></i> 526</p>"
																   +"<p style=' margin-bottom:20px'><i class='glyphicon glyphicon-heart-empty'></i> 123</p>"
																   +"<a class='btn btn-mini btn-primary' style='font-size:12px'><span class='glyphicon glyphicon-edit'></span>  編輯</a>"
																   +"<a class='btn btn-mini btn-danger' style='font-size:12px'><span class='glyphicon glyphicon-trash'></span>  刪除</a>")
																		
						var b_state = bounty.b_state
						switch(b_state){
						case 0://進行中
							$("#ing"+count).removeClass().addClass('btn btn-info');
							break;
						case 1://已結束
							$("#end"+count).removeClass().addClass('btn btn-info');
							break;
						case 2://即將截止
							$("#soon"+count).removeClass().addClass('btn btn-info');
							break;
						case 3://獲選公布
							$("#ann"+count).removeClass().addClass('btn btn-info');
							break;	
						}						
																				
// 						//alert(bounty.mid +"  "+mid)
						//根據使用者判斷顯示活動按鈕
// 						if(bounty.mid==mid){
// 							$('.button').attr('type','hidden')
// 						}				
						count++;
					})
 				})
			}
	
		// ====================================================================================================
		$('#bountyTable').on('click','div:nth-child(3) a',
				function(data) {  //刪除  編輯
					var mid = "${loginOK.mid}"
					var button = $(this).text();
					var b_id = $(this).parent('div').parent('div').children('div').children('div:eq(6)').text();
					if("編輯"===button.trim()){
						$.ajax({'url' : 'personalUpdate.controller',
							'data' : {'b_id' : b_id},
							'type' : 'get'
							}).done(function(data) {
								document.open();
								document.write(data);
								document.close();
							})
					} else if ("刪除"===button.trim()){	
						swal({
							  title: "確定要刪除?",
// 							  text: "You will not be able to recover this imaginary file!",
							  type: "warning",
							  showCancelButton: true,
							  confirmButtonColor: "#DD6B55",
							  confirmButtonText: "確定",
							  cancelButtonText:"取消",
							  closeOnConfirm: false
							},
							function(){  
							  $.ajax({
									'url' : 'personalDelete.controller',
									'data' : {'b_id' : b_id},
									'type' : 'get'
								   }).done(function(data) {
									   swal({
											  title: "刪除成功!",
											  text: data,
											  type: "success",
											  confirmButtonText: "OK"
											});	
									   
									   loadBounty(mid);})					
							});			   
					}					
				});
	</script>

</body>

</html>
