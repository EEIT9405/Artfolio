<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modern Business - Start Bootstrap Template</title>

<!-- Bootstrap Core CSS -->
<link href="/Artfolio/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="/Artfolio/font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" type="text/css" media="screen"
	href="/Artfolio/css/bootstrap-datetimepicker.min.css">
<link href="/Artfolio/css/fileinput.min.css" rel="stylesheet">
<link href="/Artfolio/css/sweetalert.css" rel="stylesheet">
<link href="/Artfolio/css/bountyPage.css" rel="stylesheet">
	<script src="/Artfolio/js/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="/Artfolio/js/bootstrap.min.js"></script>
	<script src="/Artfolio/js/sweetalert.min.js"></script>
<style type="text/css">

</style>
</head>
<body background="/Artfolio/webbackground/vintage-leaves.png">
		<jsp:include page="../top/header.jsp"></jsp:include>
		<div id="bd">
		<header >
				<ol class="breadcrumb">
					<li class="active"><a href="<c:url value="/bounty/bountyDisplay.jsp"/>">所有活動</a></li>
					<li class="active"><a href="<c:url value="/bounty/bountyTrackPage.jsp"/>">活動追蹤</a></li>
					<li class="active"><a href="<c:url value="/bounty/bountyPersonal.jsp"/>">活動管理</a></li>
					<li class="active"><a href="<c:url value="/bounty/bountyUpload.jsp"/>">舉辦活動</a></li>
				</ol>		

		</header>

	<!-- /.container -->
<!-- Page Content -->
		<!-- Content Row -->
	
		<div id="layout">

			<div class="onHeaderfixed">
				<div class="competitions" transition="app-layout">
					<section class="bg__wrap--full" transition-mode="out-in">
					
									
					<!--標頭圖片 -->
					<div class="competition__keyBg" style="box-shadow: 5px 5px 5px #BDBDBD;">
						<img
							src="/Artfolio/webbackground/21.jpg"
							style="width: 100%;">
						<div class="competition__keyBg__mask"></div>
					</div>
							
					<div class="container" >
						<div class="row competition__content-wrap">
							<div class="sidebar col-md-4" style="position: relative; z-index: 1; background-color:#FAFAFA ;border:1px solid #D8D8D8; padding:5px; box-shadow: 5px 5px 5px #E6E6E6;">
								<aside class="card card-default">
								
							<!--活動圖片 -->
								<div class="competition__cover text-center">   
									<img class="img-responsive img-hover img-thumbnail" style="width: 100%;" src="/bountyImgs/${bean.b_attach_pic.substring(bean.b_attach_pic.lastIndexOf("/")+1)}" alt="">
								</div>
								
								<hr>
								
								<div class="competition__times">
									
									<div class="row button-hack">
										<!--button -->		
										<c:choose>
											<c:when test="${loginOK.mid != bean.mid}">
												<div class="subscribe-button col-xs-6">
													<div id="track" class="competition__btn-save btn btn-block btn-primary">
														<!---->
														<span>追蹤</span>
													</div>												
												</div>
												
												<div class="official-button col-xs-6">
													<div class="classes">
														<a id="participate" class="competition__btn-enter btn btn-block btn-success"><span>參加</span></a>
													</div>
												</div>
											</c:when>
											<c:otherwise>
												<div class="official-button col-xs-12">
													<div class="classes">
														<a id="edit" class="competition__btn-enter btn btn-block btn-default"><span>編輯</span></a>
													</div>
												</div>															
														<div id="closebutton" class="official-button col-xs-12">
															<div class="classes">
																<a id="close" class="competition__btn-enter btn btn-block btn-default"><span>關閉活動</span></a>
															</div>
														</div>
											
														<div id="openbutton" class="official-button col-xs-12">
															<div class="classes">
																<a id="open" class="competition__btn-enter btn btn-block btn-default"><span>活動已關閉</span></a>
															</div>	
														</div>		
											</c:otherwise>
										</c:choose>
									</div>				
									<hr>
	
									<div class="competition__times__row submissionDuring">
										<div id="addToCalendarTime">	
										</div>
										<div>
											<span style="padding-left:40px" content="${bean.b_startdate.toString().substring(0,19)}">${bean.b_startdate.toString().substring(0,19)}</span>
											<span>至</span>
											<span content="${bean.b_enddate.toString().substring(0,19)}">${bean.b_enddate.toString().substring(0,19)}</span>
										</div>
									</div>
									
									<div class="competition__times__row winnerAnnouncements">
										<div id="addToCalendarAnnounced">
										</div>
										<div style="padding-left:40px">${bean.b_announced.toString().substring(0,19)}</div>
									</div>
									
									<hr>
									
									<div
										class="competition__award card card-default card-flat border-radius clearfix"
										style="background-color: rgb(243, 242, 240); margin: 12px 0px; padding:10px;">
										
										
										<div class="competition__award__item" style="margin-left:50px">
											<span>總獎金</span><span><i class="glyphicon glyphicon-usd">${bean.b_bonus_total}</i></span>
										</div>
										<div class="competition__award__item">
											<span>最高獎金</span><span><i class="glyphicon glyphicon-usd">${bean.b_bonus_max}</i></span>
										</div>
									</div>	
									
									
									
									<div id="fileDownload">
										<c:url var="link" value="FileDownServlet">
											<c:param name="fileId" value="${bean.b_attach_pdf.substring(bean.b_attach_pdf.lastIndexOf('/')+1)}"></c:param>
										</c:url>
										<a class='btn btn-mini btn-primary' type="button" href="${link}" style='font-size:12px'><span class='glyphicon glyphicon-cloud-download'></span>  附件下載</a>		
									</div>
									
																
								</div>
								</aside>
								
								
								<address class="row">
									<div class="col-xs-12">
										<div class="card card-default">
											<div 
												class="competition__organizer card clearfix">
												<h4 >主辦單位</h4>
												<div  class="card border-radius">
													<div 
														class="competition__organizer__avatar pull-left">
														<img 
															src="/Artfolio/img/img_avatar1.png"
															class="img-circle" width="50px" style="padding:5px;">
													</div>
													<div class="competition__organizer__content">
														<div  class="organizerTitle">${bean.b_organizer}</span></div>
													</div>
												</div>
											</div>
											<hr>

										</div>
			
									</div>
								</address>
								<div class="row">
									<div class="col-xs-12">
										<div class="similarCompetitions">
									
									
										</div>
									</div>
								</div>
							</div>
										<div class="col-md-8">
											<div class="competition__description__wrap ">
												<h1>${bean.b_title}</h1>	
												
												
												
												
													
														<div class="social__share ">	
																<a class="btn btn-outline" style="color:#0040FF" onclick="share()"><i class="fa fa-facebook fa-lg"></i></a>
																<a class="btn btn-outline"><i class="fa fa-twitter fa-lg"></i></a>		
														</div>
														
														
														
														
														<div style='font-size:12px; font-weight:bolder; color:black' class='btn btn-default btn-xs' id='soon'>即將截止</div>
														<div style='font-size:12px; font-weight:bolder; color:black' class='btn btn-default btn-xs' id='ing'>進行中</div>
														<div style='font-size:12px; font-weight:bolder; color:black' class='btn btn-default btn-xs' id='end'>已結束</div>
														<div style='font-size:12px; font-weight:bolder; color:black' class='btn btn-default btn-xs' id='ann'>獲選公布</div><br>	
												<div class="competition__description hidden-xs hidden-sm"
													style="margin: 5px 0px;">
													<div class="counts-wrap clearfix border-radius">
														<div class="" style="font-size:14px; margin-top:0px;margin-left:10px;">
															<!--瀏覽數 -->
															<i class="glyphicon glyphicon-eye-open" style="padding:5px;"></i><span>${bean.b_click}</span>
															<i class="glyphicon glyphicon-heart" style="padding:5px;"></i><span>${trackcount}</span>
															<i class="glyphicon glyphicon-comment" style="padding:5px;"></i><span>${msgcount}</span>			
														
														<c:if test="${not empty tags}">
															<div class="" style="font-size:16px; margin-top:20px;">
																<i class="glyphicon glyphicon-tags"></i>
																	<c:forEach var="tag" items="${tags}">${tag.b_tag}   </c:forEach></i>
															</div>
														</c:if>
														</div>
													</div>
												</div>
											</div>
											

											<article
												class="competition__content card card-default border-radius col-xs-12"
												style="box-shadow: none; ">
												<div></div>
												<div class="bh-redactor" style="padding-top: 22px;"></div>
												<div>
													<h3>活動詳情</h3>
													${bean.b_content}
												</div>
												<br>
												<div>
													<h3>參加辦法</h3>
													${bean.b_partimethod}
												</div>
												<div>
												<br><br>
							<!-- wang -->
											<div id="column1">
												<div style="overflow-y: scroll; height: 200px;">
													<table class="table table-striped" id="bmsgTable">
														<thead>
															<tr>
																<th>留言&提問</th>
																<th></th>
																<th></th>
																<th></th>
																<th></th>
															</tr>
														</thead>
														<tbody>


														</tbody>
													</table>
													<span id='table_page'></span>
												</div>
												<table id="textareaTable" class="table table-striped">
													<tbody>
													<caption>填寫留言訊息</caption>
													<tr>
														<td><textarea class="form-control" id="text1" name="message" rows="5"
																onfocus="onTextarea()" onkeyup="onTextareaChang()"
																rows="5" cols="200" ></textarea></td>
														<td>${error.message}</td>
													</tr>
													</tbody>
												</table>
												<div id="column2" align="center">
													<input id="closeb" type="submit" class="btn btn-primary"
														name="prodaction" value="留言" /> <input type="reset"
														class="btn btn-default" value="重置" />
												</div>

											</div>
											<!-- wang -->
										</div>
										</article>
								<!---->
								<div class="competition__extra">
									
								</div>
							</div>
						</div>
					</div>
				
				</div>
			</div>
	</div>
	</div>
		<!---->
		<!---->
	
	<!-- /.container -->
<jsp:include page="../top/footer.jsp"></jsp:include>


<!-- FB分享 -->
<script>

//var str1= location.href;
//var path = str1.replace('localhost','192.168.31.4')
var path= location.href;

window.fbAsyncInit = function() {
    FB.init({
      appId      : '130481644193160',
      xfbml      : true,
      version    : 'v2.9'
    });
    FB.AppEvents.logPageView();
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
  
  
  function share()
  {
     FB.ui(
      {
        method: 'share',
        href: path,
      },
      // callback
      function(response) {
        if (response && !response.error_message) {
          alert('分享成功後即可領取紅利!');
        } else {
          // alert('Error while posting.');
        }
      }
    )
  };
</script>




	<script>
		$(document).ready(function() {			
		
			var title = '${bean.b_title}'
			var start = new Date('${bean.b_startdate}').toISOString();
				start = start.replace(/-/g,"");
				start = start.replace(/:/g,"");
				start = start.replace(start.substring(start.lastIndexOf(".")), "Z");			
			var end = new Date('${bean.b_enddate}').toISOString();
				end = end.replace(/-/g,"");
				end = end.replace(/:/g,"");
				end = end.replace(end.substring(end.lastIndexOf(".")), "Z");
			var ann = new Date('${bean.b_announced}').toISOString();
				ann = ann.replace(/-/g,"");
				ann = ann.replace(/:/g,"");
				ann = ann.replace(ann.substring(ann.lastIndexOf(".")), "Z");
			
		
			$('#addToCalendarTime')
			.html('<span style="padding-left:30px" >投稿期間</span><a href="////www.google.com/calendar/event?action=TEMPLATE&amp;text='+title+' 報名時間&amp;dates='+start+'/'+end+'&amp;details=活動網址 https://bhuntr.com/tw/competitions/2017HGpoemmv&amp;location=&amp;trp=false&amp;sprop=&amp;sprop=name:" target="_blank" class="addToCalender btn btn-default btn-xs"><i class="glyphicon glyphicon-calendar"></i></a>')
			$('#addToCalendarAnnounced')
			.html('<span style="padding-left:30px" >得獎公佈</span><a href="////www.google.com/calendar/event?action=TEMPLATE&amp;text='+title+' 得獎公佈&amp;dates='+start+'/'+end+'&amp;details=活動網址 https://bhuntr.com/tw/competitions/2017HGpoemmv&amp;location=&amp;trp=false&amp;sprop=&amp;sprop=name:" target="_blank" class="addToCalender btn btn-default btn-xs"><i class="glyphicon glyphicon-calendar"></i></a>')
			
			
			
			
			var b_state = '${bean.b_state}'
			switch(b_state){
			case '0'://進行中
				$("#ing").removeClass().addClass('btn btn-warning btn-xs');
				break;
			case '1'://已結束
				$("#end").removeClass().addClass('btn btn-warning btn-xs');
				break;
			case '2'://即將截止
				$("#soon").removeClass().addClass('btn btn-warning btn-xs');
				break;
			case '3'://獲選公布
				$("#ann").removeClass().addClass('btn btn-warning btn-xs');
				break;	
			}	
			
		
	//==============================================================================================
			var contentPath = "${pageContext.request.contextPath}"
			$("#track").click(function() {   //追蹤	
				var b_id = "${bean.b_id}";
				var mid = "${loginOK.mid}";	
				$.get("bountyTrack.controller",{"b_id":b_id,"mid":mid}, function(data) {
					swal({
						  title: "新增成功!",
						  text: data,
						  type: "success",
						  confirmButtonText: "OK"
						});	
				});
				//${loginOK.mid}
				//${bean.b_id}
				//傳送到servlet(/bountyTrack.controller)進行資料新增
				//新增成功後在畫面顯示成功訊息		
			});

	// ====================================================================================================		
			$('#participate').click(function() {//參加
						var toId = "${bean.mid}";
						var title = "${bean.b_title}";
						$(location).attr('href',contentPath
														+ '/mail/mailUploadList.controller?toId='
														+ toId + '&title='
														+ title
														+ '&mailClass=signup');
					});

			$('#edit').click(function() { //編輯
						var b_id = "${bean.b_id}";
						$.ajax({'url' : 'personalUpdate.controller',
								'data' : {'b_id' : b_id},
								'type' : 'get'
								}).done(function(data) {
									document.open();
									document.write(data);
									document.close();
								})
					});
			
			
			if(${bean.b_state!='1'}){			
				$('#closebutton').show();
				$('#openbutton').hide();
			}else{
				$('#closebutton').hide();
				$('#openbutton').show();
			}
			
	
			$('#close').click(function() { //關閉活動
				$('#closebutton').hide();
				$('#openbutton').show();
				
				var b_id = "${bean.b_id}";
				$.ajax({'url' : 'bountyStateUpdate.controller',
						'data' : {'b_id' : b_id, 'bountyState': 'close'},
						'type' : 'get'
						})
			});
			
			
	// ====================================================================================================				
		
			var isAttach = "${bean.b_attach_pdf}"
			if(isAttach != "C:/Artfolio/BountyAttchs/"){
				$('#fileDownload').show();
			}else{
				$('#fileDownload').hide();
			}		
		});
	</script>
	<!-- 	=================================================================== -->
		<script type="text/javascript">
			$(function() {

				var mid = '${loginOK.mid}';
				var bid = '${bean.b_id}';
				console.log(bid);
				loadBmsg();
				function loadBmsg() {
					$
							.getJSON(
									'showBmsg.controller',
									{
										'b_id' : bid
									},
									function(datas) {

										console.log(datas);
										var docFrag = $(document
												.createDocumentFragment());
										var tb = $('#bmsgTable>tbody');
										tb.empty();

										$
												.each(
														datas,
														function(idx, bmg) {
															var img = $('<img>')
																	.attr(
																			'src',
																			bmg.member.mphoto)
																	.css(
																			'width',
																			'50px')
																	.css(
																			'height',
																			'50px')
																	.css(
																			'box-shadow',
																			'3px 3px 5px 3px gray')
																	.css(
																			'border-radius',
																			'10px');

															var cell0 = $(
																	'<td></td>')
																	.append(img);
															var cell1 = $(
																	'<td></td>')
																	.html(
																			'<a href="/Artfolio/bounty/NewpersonalDisplay.controller?mid='+bmg.member.mid+'">'+bmg.member.name+'<a>');
															var cell2 = $(
																	'<td></td>')
																	.text(
																			bmg.msg.b_msgdate);
															var cell3 = $(
																	'<td></td>')
																	.text(
																			bmg.msg.b_msgcontent);
															if (bmg.msg.mid == mid) {
																var cell4 = $(
																		'<td></td>')
																		.html(
																				"<button class='b1 btn btn-danger'><span class='glyphicon glyphicon-remove'></span></button><button class='btn btn-info' value='編輯'><span class='glyphicon glyphicon-pencil'></span></button>")

															} else {
																var cell4 = $('<td></td>')
															}
															var cell5 = $(
																	"<input type='hidden' name='bmsgid'>")
																	.val(
																			bmg.msg.b_msgid);
															var row = $(
																	'<tr></tr>')
																	.append(
																			[
																					cell0,
																					cell1,
																					cell2,
																					cell3,
																					cell4,
																					cell5 ]);

															docFrag.append(row);

														})
										tb.append(docFrag);

									})

				}

				$('#column2').on('click', 'input:nth-child(1)', function(data) { //新增
					//alert($(this).parents('tr').children('td:eq(2)').children('div').text())
					var content = $('#text1').val();
					// 	alert(content);
					var mid = "${loginOK.mid}";
					console.log(mid);
					$.post("insertBmsg.controller", {
						"b_id" : bid,
						"b_msgcontent" : content
					}, function(data) {
						loadBmsg();
					});
				});

				$('#bmsgTable>tbody').on(
						'click',
						'button:nth-child(1)',
						function(e) { //刪除
// 							swal('成功','留言已刪除','success');
// 							//alert($(this).parents('tr').children('td:eq(2)').children('div').text())
// 							console.log(this);
							var mid = "${loginOK.mid}";
						
							swal({
								  title: "確定要刪除?",
//	 							  text: "You will not be able to recover this imaginary file!",
								  type: "warning",
								  showCancelButton: true,
								  confirmButtonColor: "#DD6B55",
								  confirmButtonText: "確定",
								  cancelButtonText:"取消",
								  closeOnConfirm: false
								},
								function(){
							$.get("deletebmsg.controller", {
								"b_msgid" : $(e.currentTarget).parent('td').parent('tr')
										.children('input[name=bmsgid]').val()
							}, function(data) {
								swal('成功','留言已刪除','success');
								loadBmsg();
							});
								});
						});

				$('#bmsgTable>tbody').on(
						'click',
						'button:nth-child(2)',
						function(data) { //修改
							//alert($(this).parents('tr').children('td:eq(2)').children('div').text())
							var content = $('.textarea1').val();
							if ($(this).val() == '編輯') {
								$(this).val('修改');

								var t1 = $(this).parent('td').parent('tr')
										.children('td:eq(3)').text();
								$(this).parent('td').parent('tr').children(
										'td:eq(3)').empty();

								$(this).parent('td').parent('tr').children(
										'td:eq(3)').append(
										$("<textarea class='textarea1'>" + t1
												+ "</textarea>"));
							} else {

								$.get("updateBmsg.controller", {
									"b_id" : bid,
									"b_msgid" : $(this).parent('td').parent(
											'tr')
											.children('input[name=bmsgid]')
											.val(),
									"b_msgcontent" : content
								}, function(data) {
									loadBmsg();
								});

							}
						});

			});

			function onTextarea() {
				if ($('#text1').val() == '') {
					// 		$('#closeb').prop('disabled','true');
					document.getElementById("closeb").disabled = true;

				}
			}
			function onTextareaChang() {
				if ($('#text1').val() != '') {
					document.getElementById("closeb").disabled = false;
				}
			}
			
		
			
			
			
			
		</script>
		</body>
</html>