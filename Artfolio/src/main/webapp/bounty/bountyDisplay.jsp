<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Artfolio活動徵稿</title>

<!-- Bootstrap Core CSS -->
<link href="/Artfolio/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="/Artfolio/font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" type="text/css" media="screen"
	href="/Artfolio/css/bootstrap-datetimepicker.min.css">
<link href="/Artfolio/css/fileinput.min.css" rel="stylesheet">
<link href="/Artfolio/css/sweetalert.css" rel="stylesheet">

<script src="/Artfolio/js/jquery-3.2.1.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/Artfolio/js/bootstrap.min.js"></script>
<script src="/Artfolio/js/sweetalert.min.js"></script>
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
#bd .competition__keyBg {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 0;
	width: 100%;
	height: 200px;
	overflow: hidden
}

#bd .competition__keyBg img {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%) scale(1.15);
	transform-origin: center;
 	-ms-filter: 
	"progid:DXImageTransform.Microsoft.MotionBlur(strength=50), progid:DXImageTransform.Microsoft.BasicImage(mirror=1)"; 
   	filter: blur(0px)   
}

#bd .competition__keyBg__mask {
	position: absolute;
	top: 0;
	width: 0;
	background-color: rgba(0, 0, 0, .2);
	background-image: linear-gradient(180deg, transparent 0, rgba(0, 0, 0, .45));
	width: 100%;
	height: 100%
}

#bd .col-md-4 h1 {
	max-width: calc(100% - 120px);
	color: #fff;
	margin-left:150px;
	margin-bottom:10px;
	margin-top:10px;
}


#bd .btn-primary.raised {
	box-shadow: 0 3px 0 0 #007299;
}


#bd .btn-primary.raised:active, .btn-primary.raised.active {
	background: #33a6cc;
	box-shadow: none;
	margin-bottom: -3px;
	margin-top: 3px;
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

		<!-- /.row -->

		<!-- Project One -->
		<div class="row">
			<div class="col-md-4" style="padding-top:10px;">

				
				  <div style="box-shadow:3px 3px 12px gray;" id="carousel-example-generic" class="carousel slide" data-ride="carousel" align="center">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img class="img-responsive" src="http://placehold.it/750x500" alt="">
                        </div>
                        <div class="item">
                            <img class="img-responsive" src="http://placehold.it/750x500" alt="">
                        </div>
                        <div class="item">
                            <img class="img-responsive" src="http://placehold.it/750x500" alt="">
                        </div>
                        </div>
                    </div>

                    <!-- Controls -->
                 <br>
				
				
				
				
				
				

				<form id="bountySearch">

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
								<li class="list"><input type="checkbox" value="0" name="orderby"> 最高獎金</li>
								<li class="list"><input type="checkbox" value="1" name="orderby"> 熱門活動</li>
								<li class="list"><input type="checkbox" value="2" name="orderby"> 最新活動</li>
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
									<li class="list"><input type="checkbox" value="1" name="state">徵件中</li>
									<li class="list"><input type="checkbox" value="2" name="state">即將截止</li>
									<li class="list"><input type="checkbox" value="4" name="state">已結束</li>
									<li class="list"><input type="checkbox" value="8" name="state">獲選公佈</li>
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
									value="1" name="amount">5萬以下</li>
								<li class="list-group-item"><input type="checkbox"
									value="2" name="amount">5萬到10萬</li>
								<li class="list-group-item"><input type="checkbox"
									value="4" name="amount">10萬到25萬 </li>
								<li class="list-group-item"><input type="checkbox"
									value="8" name="amount">25萬到50萬 </li>
								<li class="list-group-item"><input type="checkbox"
									value="16" name="amount">50萬以上  </li>
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
									value="平面設計" name="tag">平面設計</li>
								<li class="list-group-item"><input type="checkbox"
									value="產品設計" name="tag">產品設計</li>
								<li class="list-group-item">影像類別:</li>
								<li class="list-group-item"><input type="checkbox"
									value="攝影" name="tag">攝影</li>
								<li class="list-group-item"><input type="checkbox"
									value="影片" name="tag">影片</li>
								<li class="list-group-item">寫作類別:</li>
								<li class="list-group-item"><input type="checkbox"
									value="文學獎" name="tag">文學獎</li>
								<li class="list-group-item"><input type="checkbox"
									value="創意寫作" name="tag">創意寫作</li>
								<li class="list-group-item">商業類別:</li>
								<li class="list-group-item"><input type="checkbox"
									value="企劃" name="tag">企劃</li>
								<li class="list-group-item"><input type="checkbox"
									value="創業" name="tag">創業</li>
								<li class="list-group-item">其他類別:</li>
								<li class="list-group-item"><input type="checkbox"
									value="實習生徵求" name="tag">實習生徵求</li>
								<li class="list-group-item"><input type="checkbox"
									value="其他" name="tag">其他</li>
							</ul>
						</div>
					</div>
				</div>
				</form>
			</div>



			<div id="bountyTable" class="col-md-8">
			
				<!--            row1 -->		
				<!-- row -->
			</div>
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
	</div>
	<!-- /.container -->

	<!-- jQuery -->

	</div>
	
<jsp:include page="../top/footer.jsp"></jsp:include>	
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
					loadBounty();
					
				}
				$('input:checkbox').change(function() { //選擇器選取狀態改變
					if ($(':checkbox:checked').prop('checked')) { //若checkbox有打勾		
		//				selectBounty($(this).val()); //取得打勾checkbox的值並以此選取活動資訊
						bountySearch();
					} else {
						loadBounty(); //取消選擇  載入loadBounty()
					}
				})	
				
		})
		

		function loadBounty() {		
				$.getJSON('display.controller',function(datas) {		
					$('#bountyTable').empty();
					var count = 0;
					
					$.each(datas,function(idx, bounty) {	
														
						var trackcount;
						var msgcount;
						$.ajax({
								  url: 'displayCount.controller',
								  data:{'id':bounty.b_id},
								  async: false,
								  dataType: 'json',
								  success: function (data) {
									  trackcount = data.trackcount;
									  msgcount = data.msgcount;
								  }
							   });
										
						$('#bountyTable').append("<div id='row"+ count +"' class='row' style='border:1px solid #D8D8D8; border-radius:20px; overflow:hidden ;background-color:#fff ;box-shadow: 5px 5px 5px #E6E6E6;'></div>");
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
																   + "</div><div style=' margin-bottom:20px'>截止收件 : "+ bounty.b_enddate +"</div>"
																   + "<div style='font-size:12px' class='btn btn-default' id='soon"+count+"'>即將截止</div>"
																   + "<div style='font-size:12px' class='btn btn-default' id='ing"+count+"'>進行中</div>"
																   + "<div style='font-size:12px' class='btn btn-default' id='end"+count+"'>已結束</div>"
																   + "<div style='font-size:12px' class='btn btn-default' id='ann"+count+"'>獲選公布</div><br>"											  
																   + "<div style='display:none'>"+ bounty.b_id+ "</div>"
																   + "<div style='display:none'>"+ bounty.mid+ "</div>"
																   + "<div style='display:none'>"+ bounty.b_title+ "</div>")
						$('#row'+count+' >div:last-child').html("<br><p ><i style='padding-right:5px' class='glyphicon glyphicon-eye-open'></i>"+ bounty.b_click +"</p>"
																   +"<p><i style='padding-right:5px' class='glyphicon glyphicon-comment'></i>"+ msgcount +"</p>"
																   +"<p style=' margin-bottom:61px'><i style='padding-right:5px' class='glyphicon glyphicon-heart-empty'></i>"+  trackcount +"</p>"
																   +"<a class='btn btn-mini btn-primary' style='font-size:12px'><span class='glyphicon glyphicon-heart'></span>  追蹤</a>")
// 																   +"<a class='btn btn-primary' href='portfolio-item.html'><span class='glyphicon glyphicon-heart'></span>  參加</a>")
									
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
	
	
		function selectBounty(Selector) {
			$.getJSON('bountySelect.controller',{'Selector' : Selector},function(datas) {
				$('#bountyTable').empty();
					var count = 0;
					$.each(datas,function(idx, bounty) {	
						
						var trackcount;
						var msgcount;
						$.ajax({
								  url: 'displayCount.controller',
								  data:{'id':bounty.b_id},
								  async: false,
								  dataType: 'json',
								  success: function (data) {
									  trackcount = data.trackcount;
									  msgcount = data.msgcount;
								  }
							   });
						
						$('#bountyTable').append("<div id='row"+ count +"' class='row' style='border:1px solid #D8D8D8; border-radius:20px; overflow:hidden ;background-color:#fff;  box-shadow: 5px 5px 5px #E6E6E6;'></div>");
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
																   + "</div><div style=' margin-bottom:20px'>截止收件 : "+ bounty.b_enddate +"</div>"
																   + "<div style='font-size:12px' class='btn btn-default' id='soon"+count+"'>即將截止</div>"
																   + "<div style='font-size:12px' class='btn btn-default' id='ing"+count+"'>進行中</div>"
																   + "<div style='font-size:12px' class='btn btn-default' id='end"+count+"'>已結束</div>"
																   + "<div style='font-size:12px' class='btn btn-default' id='ann"+count+"'>獲選公布</div><br>"											  
																   + "<div style='display:none'>"+ bounty.b_id+ "</div>"
																   + "<div style='display:none'>"+ bounty.mid+ "</div>"
																   + "<div style='display:none'>"+ bounty.b_title+ "</div>")
							$('#row'+count+' >div:last-child').html("<br><p ><i style='padding-right:5px' class='glyphicon glyphicon-eye-open'></i>"+ bounty.b_click +"</p>"
																   +"<p><i style='padding-right:5px' class='glyphicon glyphicon-comment'></i>"+ msgcount +"</p>"
																   +"<p style=' margin-bottom:61px'><i style='padding-right:5px' class='glyphicon glyphicon-heart-empty'></i>"+  trackcount +"</p>"
																   +"<a class='btn btn-mini btn-primary' style='font-size:12px'><span class='glyphicon glyphicon-heart'></span>  追蹤</a>")
// 																   +"<a class='btn btn-primary' href='portfolio-item.html'><span class='glyphicon glyphicon-heart'></span>  參加</a>")
							 	
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
	
						//alert(bounty.mid +"  "+mid)
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
				function(data) {//追蹤
		
					var b_id = $(this).parent('div').parent('div').children('div').children('div:eq(6)').text();
					var mid = "${loginOK.mid}";
					$.get("bountyTrack.controller", {
						"b_id" : b_id,
						"mid" : mid
					}, function(data) {
						swal({
							  title: "新增成功!",
							  text: data,
							  type: "success",
							  confirmButtonText: "OK"
							});	
						if ($(':checkbox:checked').prop('checked')) { //若checkbox有打勾		
							selectBounty($(':checkbox:checked').val()); //取得打勾checkbox的值並以此選取活動資訊
						} else {
							loadBounty(); //取消選擇  載入loadBounty()
						}
					});
				});
		
		var orderCheckboxes=$('input[name=orderby]');
		orderCheckboxes.change(function(event){
			orderCheckboxes.each(function(index,element){
				if(event.target!=element)
					$(element).prop('checked',false);
			});
		});
		function bountySearch(){
			$.getJSON('bountySearch.controller',$('form#bountySearch').serialize(),function(datas) {
				$('#bountyTable').empty();
					var count = 0;
					$.each(datas,function(idx, bounty) {	
						
						var trackcount;
						var msgcount;
						$.ajax({
								  url: 'displayCount.controller',
								  data:{'id':bounty.b_id},
								  async: false,
								  dataType: 'json',
								  success: function (data) {
									  trackcount = data.trackcount;
									  msgcount = data.msgcount;
								  }
							   });
						
						$('#bountyTable').append("<div id='row"+ count +"' class='row' style='border:1px solid #D8D8D8; border-radius:20px; overflow:hidden ;background-color:#fff;  box-shadow: 5px 5px 5px #E6E6E6;'></div>");
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
																   + "</div><div style=' margin-bottom:20px'>截止收件 : "+ bounty.b_enddate +"</div>"
																   + "<div style='font-size:12px' class='btn btn-default' id='soon"+count+"'>即將截止</div>"
																   + "<div style='font-size:12px' class='btn btn-default' id='ing"+count+"'>進行中</div>"
																   + "<div style='font-size:12px' class='btn btn-default' id='end"+count+"'>已結束</div>"
																   + "<div style='font-size:12px' class='btn btn-default' id='ann"+count+"'>獲選公布</div><br>"											  
																   + "<div style='display:none'>"+ bounty.b_id+ "</div>"
																   + "<div style='display:none'>"+ bounty.mid+ "</div>"
																   + "<div style='display:none'>"+ bounty.b_title+ "</div>")
							$('#row'+count+' >div:last-child').html("<br><p ><i style='padding-right:5px' class='glyphicon glyphicon-eye-open'></i>"+ bounty.b_click +"</p>"
																   +"<p><i style='padding-right:5px' class='glyphicon glyphicon-comment'></i>"+ msgcount +"</p>"
																   +"<p style=' margin-bottom:61px'><i style='padding-right:5px' class='glyphicon glyphicon-heart-empty'></i>"+  trackcount +"</p>"
																   +"<a class='btn btn-mini btn-primary' style='font-size:12px'><span class='glyphicon glyphicon-heart'></span>  追蹤</a>")
// 																   +"<a class='btn btn-primary' href='portfolio-item.html'><span class='glyphicon glyphicon-heart'></span>  參加</a>")
							 	
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
	
						//alert(bounty.mid +"  "+mid)
						//根據使用者判斷顯示活動按鈕
// 						if(bounty.mid==mid){
// 							$('.button').attr('type','hidden')
// 						}	
						
						count++;
					})
 				})
			
		}
		$.getJSON('bountySearch.controller?orderby=1',function(datas){
			if(datas.length>0){
				for(var i=0;i<Math.min(3,datas.length);i++){
					$('img.img-responsive').get(i).src='/bountyImgs/'+ datas[i]
					.b_attach_pic.substring(datas[i].b_attach_pic.lastIndexOf('/') + 1);
					}
			}
			
			
			});
	</script>

</body>

</html>
