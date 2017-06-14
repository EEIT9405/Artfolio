<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Artfolio</title>

<link rel='stylesheet prefetch' href='css/bootstrap.min.css'>
<link rel='stylesheet prefetch'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel='css/bootstrap-theme.min.css'>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/workWindow.css">
<script src='js/jquery-3.2.1.min.js'></script>
<style type="text/css">
*{
	font-family:微軟正黑體;
}
.wmsgArea {
	height: 350px;
/* 	overflow-y: auto; */
/* 	overflow-x: hidden; */
}
.recommendPhoto {
  overflow: hidden;
  width: 100px;
  height: 100px;
  margin-top: 12px;
  margin-bottom: 12px;
  margin-right:15px;
  position: relative;
  float:left;
  cursor:pointer;
}
.recommendPhoto img {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
  width: 150%;
}
.btn-circle {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.428571429;
  border-radius: 15px;
}
#ImageModalLabel {
	color:#fff;
}
#likes {
	color:#fff;
}
#followers{
	color:#fff;
}
</style>

</head>

<body>
	<input id="user" type="hidden" value="${sessionScope.loginOK.mid}">
	<jsp:include page="top/header.jsp"></jsp:include>
	<c:if test="${!empty loginOK }">
		<jsp:include page="top/pushPage.jsp"></jsp:include>
	</c:if>
	<section class="container-fluid top-colleciton">
		<div class="row">
			<div class="col-sm-0 col-md-1"></div>
			<div class="col-sm-0 col-md-1">
				<div id="issueMenu">
					<div class="circle">
						<p>I</p>
						<div class="issue"></div>
					</div>
					<div class="circle">
						<p>s</p>
						<div class="issue"></div>
					</div>
					<div class="circle">
						<p>s</p>
						<div class="issue"></div>
					</div>
					<div class="circle">
						<p>u</p>
						<div class="issue"></div>
					</div>
					<div class="circle">
						<p>e</p>
						<div class="issue"></div>
					</div>
					<div class="circle">
						<p>s</p>
						<div class="issue"></div>
					</div>
				</div>
			</div>
			<div class="col-sm-12 col-md-8">
				<h1 id="topHeading">Top Pictures</h1>
				<div class="row">
					<div class="col-sm-12 col-md-6">
						<div class="row">
							<div class="col-sm-12 col-md-12 padding-0">
								<div id="top1" class="img-box">
									<img src="http://bit.ly/2qYyyVS " alt="" />
									<div class="title-box">
										<div class="info">
											<h3 class="author">louis</h3>
											<h2 class="pic-title">cat vary cute</h2>
											<div class="goto-pic">show view</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-12 col-md-4">
								<div class="row">
									<div class="col-sm-6 col-md-12 padding-0">
										<div id="top8" class="img-box tobig">
											<img src="http://bit.ly/2qYyyVS " alt="" />
										</div>
									</div>
									<div class="col-sm-6 col-md-12 padding-0">
										<div id="top9" class="img-box tobig">
											<img src="http://bit.ly/2qYyyVS " alt="" />
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-12 col-md-8 padding-0">
								<div id="top3" class="img-box">
									<img src="http://bit.ly/2qYyyVS " alt="" />
									<div class="title-box">
										<div class="info">
											<h3 class="author">louis</h3>
											<h2 class="pic-title">cat vary cute</h2>
											<div class="goto-pic">show view</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-12 col-md-6">
						<div class="row">
							<div class="col-sm-6 padding-0">
								<div id="top4" class="img-box">
									<img src="http://bit.ly/2qYyyVS " alt="" />
									<div class="title-box">
										<div class="info">
											<h3 class="author">louis</h3>
											<h2 class="pic-title">cat vary cute</h2>
											<div class="goto-pic">show view</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6 padding-0">
								<div id="top5" class="img-box">
									<img src="http://bit.ly/2qYyyVS " alt="" />
									<div class="title-box">
										<div class="info">
											<h3 class="author">louis</h3>
											<h2 class="pic-title">cat vary cute</h2>
											<div class="goto-pic">show view</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-12 col-md-8 padding-0">
								<div id="top2" class="img-box">
									<img src="http://bit.ly/2qYyyVS " alt="" />
									<div class="title-box">
										<div class="info">
											<h3 class="author">louis</h3>
											<h2 class="pic-title">cat vary cute</h2>
											<div class="goto-pic">show view</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-12 col-md-4">
								<div class="row">
									<div class="col-sm-6 col-md-12 padding-0">
										<div id="top10" class="img-box tobig">
											<img src="http://bit.ly/2qYyyVS " alt="" />
										</div>
									</div>
									<div class="col-sm-6 col-md-12 padding-0">
										<div id="top11" class="img-box tobig">
											<img src="http://bit.ly/2qYyyVS " alt="" />
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6 padding-0">
								<div id="top6" class="img-box">
									<img src="http://bit.ly/2qYyyVS " alt="" />
									<div class="title-box">
										<div class="info">
											<h3 class="author">louis</h3>
											<h2 class="pic-title">cat vary cute</h2>
											<div class="goto-pic">show view</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6 padding-0">
								<div id="top7" class="img-box">
									<img src="http://bit.ly/2qYyyVS " alt="" />
									<div class="title-box">
										<div class="info">
											<h3 class="author">louis</h3>
											<h2 class="pic-title">cat vary cute</h2>
											<div class="goto-pic">show view</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-0 col-md-2"></div>
		</div>
	</section>
	<section class="container-fluid new-picture">
		<div class="row">
			<div class="col-sm-0 col-md-2"></div>
			<div class="col-sm-12 col-md-8">
				<h1>New Picture</h1>
				<div class="row">
					<div class="col-sm-12 col-md-2 padding-0">
						<div class="img-box">
							<img src="http://bit.ly/2qYyyVS " alt="" />
						</div>
					</div>
					<div class="col-sm-12 col-md-2 padding-0">
						<div class="img-box">
							<img src="http://bit.ly/2qYyyVS " alt="" />
						</div>
					</div>
					<div class="col-sm-12 col-md-2 padding-0">
						<div class="img-box">
							<img src="http://bit.ly/2qYyyVS " alt="" />
						</div>
					</div>
					<div class="col-sm-12 col-md-2 padding-0">
						<div class="img-box">
							<img src="http://bit.ly/2qYyyVS " alt="" />
						</div>
					</div>
					<div class="col-sm-12 col-md-2 padding-0">
						<div class="img-box">
							<img src="http://bit.ly/2qYyyVS " alt="" />
						</div>
					</div>
					<div class="col-sm-12 col-md-2 padding-0">
						<div class="img-box">
							<img src="http://bit.ly/2qYyyVS " alt="" />
						</div>
					</div>
				</div>
				<div class="col-sm-0 col-md-2"></div>
			</div>
		</div>
	</section>
	<jsp:include page="top/footer.jsp"></jsp:include>

	<!-- 博超  -->

	<div class="modal fade" id="ImageModal" tabindex="-1" role="dialog"
		aria-labelledby="ImageModalLabel">
		<div class="modal-dialog" role="document">
			<div style="background-color:#222;" class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" id="closeimagemodal"
						aria-label="Close">
						<span style="color:white;" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title" id="ImageModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-8">
							<div id="modalbodyimage" class="row" style="text-align: center">
							</div>
							<div class="row">
					<!-- like欄位 -->
								<div class="col-md-12">
								<div id="rc">
								<form>
								<button type="button" class="btn btn-default" name="like" value="like"><span style="font-size:15px;" class="glyphicon glyphicon-heart-empty">喜歡</span></button> <label
								id="likes"></label> <button type="button" class="btn btn-default" name="follow"
								value="follow"><span class="glyphicon glyphicon-star-empty" style="font-size:15px;">追踪</span></button> <label id="followers"></label> <button style="margin-right:7px;"
								class="btn btn-default" type="button" value="donate"><span class="glyphicon glyphicon-usd" style="font-size:15px;">贊助</span></button><label></label><button style="margin-right:7px;" class="btn btn-default" type="button"
								name="review" value="review"><span class="glyphicon glyphicon-edit" style="font-size:15px;">評分</span></button><label></label>
								<button style="float:right;" class="btn btn-default" type="button"
								name="report" value="report"><span class="glyphicon glyphicon-flag" style="font-size:15px;">檢舉</span></button><label></label>
							<div class="modal fade bs-example-modal-sm" id="reviewmodal"
								tabindex="-1" role="dialog" aria-labelledby="reviewmodalLabel">
								<div class="modal-dialog modal-sm" role="document">
									<div class="modal-content">
										<div class="modal-header" style="text-align: left">
											<button type="button" class="close" id="closereview"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title" id="reviewmodalLabel">review</h4>
										</div>
										<div class="modal-body">
											<table>
												<thead>
													<tr>
														<th colspan="3">record</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td></td>
														<td><input type="range" max="9" min="1" step="1"
															name="record_1" value="5"></td>
														<td>5</td>
													</tr>
													<tr>
														<td></td>
														<td><input type="range" max="9" min="1" step="1"
															name="record_2" value="5"></td>
														<td>5</td>
													</tr>
													<tr>
														<td></td>
														<td><input type="range" max="9" min="1" step="1"
															name="record_3" value="5"></td>
														<td>5</td>
													</tr>
													<tr>
														<td></td>
														<td><input type="range" max="9" min="1" step="1"
															name="record_4" value="5"></td>
														<td>5</td>
													</tr>
													<tr>
														<td></td>
														<td><input type="range" max="9" min="1" step="1"
															name="record_5" value="5"></td>
														<td>5</td>
													</tr>
												</tbody>
												<tfoot>
													<tr>
														<td colspan="3" style="text-align: center"><input
															type="button" name="submit" value="submit"> <input
															type="button" name="cancel" value="reset"> <span></span>
														<td>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
								</div>
							</div>
							<input type="hidden" id="wid" name="wid">
							<input type="hidden" name="recordversion"> <input
								type="hidden" name="update"> 
						</form>
					</div>
				</div>
<!-- like欄位 -->
<!-- 看過這張圖的也看過 -->
				<div class="col-md-12">
					<div id="recommend" class="row">
					</div>
				</div>
<!-- 看過這張圖的也看過 -->
			</div>
		</div>
		
<!-- 留言、標籤區 -->
						<div style="overflow-y:auto; background-color:#fff;" class="col-md-4">
							<div class="row">
								<div class="col-md-12" id="memberName"></div>
								<div class="col-md-12" id="workInfo"></div>
							</div>
							<div style="height:100px" id="tag" class="row">
							<div class="col-md-10">
								<form>
									<ul style="height:60px;">
										<li class="tag"></li>
									</ul>

									<div id="addtag" class="itagh">
										<input type="text" name="tag" value="">
										<button class="btn btn-primary" type="button" name="add" value="add"><span class="glyphicon glyphicon-plus"></span></button>
										<button class="btn btn-danger" type="button" onclick="addtags()" value="cancel"><span class="glyphicon glyphicon-remove"></span></button>
										<span></span>
									</div>
									<div id="edittag" class="itagh">
										<input type="hidden" name="targettag"> <input
											type="button" name="vote" value="vote">  <input
											type="button" name="delete" value="delete"> <input
											type="button" onclick="cancele()" value="cancel"> <span></span>
									</div>
								</form>
								</div>
								<div style="margin-top:50px;" class="col-md-2">
									<button style="margin-left:0;" class="btn btn-primary" type="button" value="addtag"
											onclick="addtags()"><span style="font-size:15px;" class="glyphicon glyphicon-tag"></span></button>
								</div>
						</div>
							
							<div style="margin-top:15px;" id="wmsg" class="row">
								<form>
									<div class="form-group" style="margin-right: 5px;">
										<textarea class="form-control" rows="3"
											cols="30"></textarea>
										<div class="pull-right">
											<input type="button" class="btn btn-primary disabled"
												name="wmsgSubmit" value="留言" disabled> <input
												type="button" class="btn btn-default disabled"
												name="wmsgCancel" value="取消" disabled>
										</div>
										<hr style="margin-top: 50px;">
									</div>
								</form>
								<div class="wmsgArea">
									<table class="table table-striped">
										<tbody>
										</tbody>
									</table>
								</div>
							</div>

				
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 博超  -->
	<!-- JS -->
	<script src='js/bootstrap.min.js'></script>
	<script src='js/jquery.formatDateTime.min.js'></script>
	<script>
		$(function() {
			//top區
			var top1 = $('#top1');
			var top2 = $('#top2');
			var top3 = $('#top3');
			var top4 = $('#top4');
			var top5 = $('#top5');
			var top6 = $('#top6');
			var top7 = $('#top7');
			var top8 = $('#top8');
			var top9 = $('#top9');
			var top10 = $('#top10');
			var top11 = $('#top11');
			var issueMenu = $('#issueMenu');
			//top區

			//wmsg用
			var wmsgTable = $('.wmsgArea>table.table>tbody');
			var wmsgSubmit = $('div.form-group>div.pull-right input[name="wmsgSubmit"]');
			var wmsgCancel = $('div.form-group>div.pull-right input[name="wmsgCancel"]');
			var wmsgTextarea = $('div.form-group textarea');
			//wmsg用

			var modelTitle = $('#ImageModalLabel');
			var recommend = $('#recommend');
			var memberName = $('#memberName');
			var workInfo = $('#workInfo');
			var ImageModalLabel = $('#ImageModalLabel');
			showTop();
			putIssueNo();

			//顯示最新top
			function showTop(issue) {
				$.getJSON('showTop.controller', {
					issue : issue
				}, function(datas) {
					$.each(datas, function(index, value) {
						switch (index) {
						case 0:
							top1.children('img').attr('src',
									value.workBean.picurl);
							top1.children('div').children('div').children('h3')
									.text(value.memberBean.name);
							top1.children('div').children('div').children('h2')
									.text(value.workBean.wtitle);
							top1.append($(
									'<input type="hidden" name="wid"></input>')
									.val(value.workBean.wid));
							break;
						case 1:
							top2.children('img').attr('src',
									value.workBean.picurl);
							top2.children('div').children('div').children('h3')
									.text(value.memberBean.name);
							top2.children('div').children('div').children('h2')
									.text(value.workBean.wtitle);
							top2.append($(
									'<input type="hidden" name="wid"></input>')
									.val(value.workBean.wid));
							break;
						case 2:
							top3.children('img').attr('src',
									value.workBean.picurl);
							top3.children('div').children('div').children('h3')
									.text(value.memberBean.name);
							top3.children('div').children('div').children('h2')
									.text(value.workBean.wtitle);
							top3.append($(
									'<input type="hidden" name="wid"></input>')
									.val(value.workBean.wid));
							break;
						case 3:
							top4.children('img').attr('src',
									value.workBean.picurl);
							top4.children('div').children('div').children('h3')
									.text(value.memberBean.name);
							top4.children('div').children('div').children('h2')
									.text(value.workBean.wtitle);
							top4.append($(
									'<input type="hidden" name="wid"></input>')
									.val(value.workBean.wid));
							break;
						case 4:
							top5.children('img').attr('src',
									value.workBean.picurl);
							top5.children('div').children('div').children('h3')
									.text(value.memberBean.name);
							top5.children('div').children('div').children('h2')
									.text(value.workBean.wtitle);
							top5.append($(
									'<input type="hidden" name="wid"></input>')
									.val(value.workBean.wid));
							break;
						case 5:
							top6.children('img').attr('src',
									value.workBean.picurl);
							top6.children('div').children('div').children('h3')
									.text(value.memberBean.name);
							top6.children('div').children('div').children('h2')
									.text(value.workBean.wtitle);
							top6.append($(
									'<input type="hidden" name="wid"></input>')
									.val(value.workBean.wid));
							break;
						case 6:
							top7.children('img').attr('src',
									value.workBean.picurl);
							top7.children('div').children('div').children('h3')
									.text(value.memberBean.name);
							top7.children('div').children('div').children('h2')
									.text(value.workBean.wtitle);
							top7.append($(
									'<input type="hidden" name="wid"></input>')
									.val(value.workBean.wid));
							break;
						case 7:
							top8.children('img').attr('src',
									value.workBean.picurl);
							top8.append($(
									'<input type="hidden" name="wid"></input>')
									.val(value.workBean.wid));
							break;
						case 8:
							top9.children('img').attr('src',
									value.workBean.picurl);
							top9.append($(
									'<input type="hidden" name="wid"></input>')
									.val(value.workBean.wid));
							break;
						case 9:
							top10.children('img').attr('src',
									value.workBean.picurl);
							top10.append($(
									'<input type="hidden" name="wid"></input>')
									.val(value.workBean.wid));
							break;
						case 10:
							top11.children('img').attr('src',
									value.workBean.picurl);
							top11.append($(
									'<input type="hidden" name="wid"></input>')
									.val(value.workBean.wid));
							break;
						}
					});
				});
			}

			function putIssueNo() {
				$.getJSON('showAllIssueNo.controller', function(datas) {
					if (datas.length < 5) {
						console.log("length<5");
						$.each(datas, function(index, value) {
							issueMenu.children(
									'div:nth-child(' + (index + 1) + ')')
									.children('div').text(value);
						});
						for (var i = 6; i > datas.length; i--) {
							issueMenu.children('div:nth-child(' + i + ')')
									.children('div').text('more');
						}
					} else {
						for (var i = 0; i < 5; i++) {
							issueMenu
									.children('div:nth-child(' + (i + 1) + ')')
									.children('div').text(datas[i]);
						}
						issueMenu.children('div:nth-child(6)').children('div')
								.text('more');
					}
				});
			}

			issueMenu.on('click', 'div.circle', function() {
				var issue = $(this).children('div').text();
				console.log(issue);
				if (issue == "more") {

				} else {
					showTop(issue);
					$('#topHeading').text(
							'Top Pictures of the Issue ' + issue);
				}
			});
			//顯示最新top

			//博超--------

			function showModal() {
				thisWid = $(this).children('input[name="wid"]').val();
				$('#wid').val(thisWid);
				var mb = $('#modalbodyimage').empty();
				$(this).children('img').clone().attr("style",
							"max-width:100%;max-height:500px").addClass(
							'img-fluid').appendTo(mb);
				$('#ImageModal').modal(
					{backdrop : 'static',keyboard:false}
				);
				showWmsg();
				getAll();
				showRecommendPhoto();
				showWorkInfo();
			}
			
			function showWorkInfo(){
				memberName.empty();
				workInfo.empty();
				ImageModalLabel.empty();
				$.getJSON('getWorkById.controller', {wid:thisWid}, function(data){
					memberName.append($('<h5>').append($('<a>').text(data.memberBean.name).attr('href','#')));
					workInfo.append(data.workBean.winfo);
					ImageModalLabel.append(data.workBean.wtitle);
				});
			}
			
			$('.img-box').click(showModal);
			//博超-----------
			
			//推薦欄點擊
			recommend.on('click', 'div.recommendPhoto', showModal);
			
			//推播欄點擊
			$('#push').on(
					'click',
					'div.pushbefore',
					showModal);

			function showRecommendPhoto(){
				recommend.empty();
				$.getJSON('showRelationalWork.controller', {wid:thisWid}, function(data){
					var documentFrag = $(document.createDocumentFragment());
					recommend.append($('<div class="col-md-1">'));
					$.each(data, function(index, value){
						var div = $('<div class="col-md-2 recommendPhoto">').addClass('img-rounded');
						var img = $('<img>').attr('src', value.picurl);
						var widhidden = $('<input name="wid" type="hidden">').val(value.wid);
						div.append(img);
						div.append(widhidden);
						documentFrag.append(div);
					});
					recommend.append(documentFrag);
					recommend.append($('<div class="col-md-1">'));
				});
			}
			
			//wmsg
			function showWmsg() {
				$.getJSON('showWmsg.controller', {wid:thisWid}, function(data) {
					wmsgTable.empty();
					var docFrag = $(document.createDocumentFragment());
					$.each(data, function(index, value) {
						var td1 = $('<td width="10%">').append($('<img>').attr('src',value.memberBean.mphoto));
						var td2 = $('<td width="15%">').text(value.memberBean.name);
						var td3 = $('<td width="40%">').html(value.wmsgcontent);
						var td4 = $('<td width="30%">').text($.formatDateTime('yy-mm-dd gg:ii:ss a',new Date(value.wmsgdate)));
						var td6 = $('<input type="hidden">').val(value.wmsgid);
						var row = $('<tr>');
						if (value.memberBean.mid == $('#user').val()) {
							var td5 = $('<td width="5%">').append($('<a title="delete" class="btn glyphicon glyphicon-remove-circle">'));
								td5.append($('<a title="edit" class="btn glyphicon glyphicon-pencil">'));
							row.append([td1, td2, td3, td4, td5, td6 ]);
						}else {
							var td5 = $('<td width="5%">');
							row.append([td1, td2, td3, td4, td5, td6]);
						}
						docFrag.prepend(row);
					});
					wmsgTable.append(docFrag);
				});
			}

			function changeBtnDisable() {
				if (wmsgTextarea.val().length <= 0) {
					wmsgSubmit.addClass('disabled');
					wmsgSubmit.prop('disabled', true);
					wmsgCancel.addClass('disabled');
					wmsgCancel.prop('disabled', true);
				} else if (wmsgTextarea.val().length > 0) {
					wmsgSubmit.removeClass('disabled');
					wmsgSubmit.prop('disabled', false);
					wmsgCancel.removeClass('disabled');
					wmsgCancel.prop('disabled', false);
				}
			}

			wmsgTextarea.keyup(function() {
				changeBtnDisable();
			});

			wmsgTextarea.mouseout(function() {
				changeBtnDisable();
			});

			wmsgSubmit.click(function() {
				var msg = wmsgTextarea.val();
				$.post('insertWmsg.controller',	{wmsgcontent : msg,	wid : thisWid},function(data) {
					var td1 = $('<td width="10%">').append($('<img>').attr('src',data.memberBean.mphoto));
					var td2 = $('<td width="15%">').text(data.memberBean.name);
					var td3 = $('<td width="40%">').html(data.wmsgcontent);
					var td4 = $('<td width="30%">').text($.formatDateTime('yy-mm-dd gg:ii:ss a', new Date(data.wmsgdate)));
					var td6 = $('<input type="hidden">').val(data.wmsgid);
					var row = $('<tr>');
					if (data.memberBean.mid == $('#user').val()) {
						var td5 = $('<td width="5%">').append($('<a title="delete" class="btn glyphicon glyphicon-remove-circle">'));
							td5.append($('<a title="edit" class="btn glyphicon glyphicon-pencil">'));
							row.append([ td1, td2, td3, td4, td5, td6 ]);
					} else {
						var td5 = $('<td width="5%">');
						row.append([ td1, td2, td3, td4, td5,td6 ]);
					}
					wmsgTable.prepend(row);
				});
				wmsgTextarea.val('');
				changeBtnDisable();
			});

			wmsgCancel.click(function() {
				wmsgTextarea.val('');
				changeBtnDisable();
			});

			wmsgTable.on('click', 'a[title="edit"]',
					function() {
						var thiz = $(this);
						var id = thiz.parent('td').parent('tr').children(
								'input').val();
						var td = thiz.parent('td').parent('tr').children('td')
								.eq(2);
						var msg = td.text();
						if (thiz.hasClass('glyphicon-pencil')) {
							td.empty();
							td.append($('<textarea rows="3" cols="18">').val(
									msg));
							thiz.removeClass('glyphicon-pencil');
							thiz.addClass('glyphicon-ok-circle');
						} else if (thiz.hasClass('glyphicon-ok-circle')) {
							var wmsgcontent = td.children('textarea').val();
							$.get('updateWmsg.controller', {
								wmsgid : id,
								wmsgcontent : wmsgcontent
							}, function(data) {
								td.empty();
								td.text(data.wmsgcontent);
								thiz.removeClass('glyphicon-ok-circle');
								thiz.addClass('glyphicon-pencil');
							});
						}
					});

			wmsgTable.on('click', 'a[title="delete"]',
					function() {
						var thiz = $(this);
						var id = thiz.parent('td').parent('tr').children(
								'input').val();
						$.get('deleteWmsg.controller', {
							wmsgid : id
						}, function(data) {
							if (data) {
								thiz.parent('td').parent('tr').remove();
							}
						});
					});
			//wmsg

		});
	
		var wid=$('#wid');
		var divadd = $('#addtag');
		var divedit = $('#edittag');
		var deltagbutton = divedit.find('input[name=delete]');	
		var itag = divadd.find('input[name=tag]');
		var addtagbutton = divadd.find('button[name=add]');
		var addmsg = divadd.children('span');
		var editmsg = divedit.children('span');
		var targettag=divedit.find('input[name=targettag]');
		var vote=divedit.find('input[name=vote]');
		addtagbutton.on(
				'click',
				function() {
					editmsg.text('');
					var tags = itag.val();
					if (/^[A-Za-z \u4E00-\u9FFF]+[A-Za-z ,\u4E00-\u9FFF]*[A-Za-z \u4E00-\u9FFF]+$/.test(tags) && tags.trim() != "") {
						var stag = tags.trim().split(",");
						for (var i=0;i<stag.length;i++){
							if(stag[i].length>20){
								addmsg.text("length of tag must be less than or equal to 20.");
								return;
							}
						}
						var message="";
						var current=$('form>ul>li>a','#tag');
						current.each(function(){
							var ctag=$(this).text();
							for(var i=0;i<stag.length;i++){
								if(stag[i]==ctag){
									message=message+stag.splice(i,1)[0]+" ";
									i=i-1;
								}
							}	
						});
						if(current.length+stag.length<=20){
							$.post("tag/add.controller", {
								wid : wid.val(),
								tags : stag
							}, function(data){
								if(data){
									showTags(data);
									if(message!="")
										addmsg.text("ignored following tags:"+message+"since existed");
									else
										addmsg.text("done");
									itag.val("");
								}else
									addmsg.text("error");
							});
						}else
							addmsg.text("number of tags is limited to 10");
					} else
						addmsg.text("format error,must begin and end with letters "+ 
								"and contain only letters,space and comma,at least two letters.");
				});
		
		
		
		$('form>ul','#tag').on('click', 'li>a', function(e) {
			e.preventDefault();
			addmsg.text('');
			var s = $(this).text();
			var i=s.indexOf('*');
			if(i>=0){
				s=s.substring(0,i);
				deltagbutton.prop("disabled",true);
			}else{
				deltagbutton.prop("disabled",false);
			}
			targettag.val(s);
			var ds = "delete " +s;
			if (divedit.hasClass("itagh")) {
				divedit.toggleClass("itags itagh").find('span').text("");
				deltagbutton.val(ds);
			} else if (deltagbutton.val() != ds) {
				deltagbutton.val(ds);
			} else
				divedit.toggleClass("itags itagh").find('span').text("");
			
			$.get('tag/voted.controller',{wid:wid.val(),tag:s},function(data){
				if(data){
					vote.val("unvote");
				}else{
					vote.val("vote");
				}
			});

		});
		deltagbutton.on('click', function() {
			addmsg.text('');
			var tag = deltagbutton.val().substr(7);
			$.ajax({
				url : "tag/del.controller",
				data : {
					wid : wid.val(),
					tag : tag
				}
			}).done(function(data) {				
				if (data) {
					$('form>ul>li>a:contains("' + tag + '")','#tag').parent('li').remove();
					divedit.toggleClass("itags itagh").find('span').text("");
					deltagbutton.val("delete");
					addtagbutton.prop("disabled",false);
				} else
					editmsg.text("failed to delete");
			});

		});
		
		function cancele(){
			addmsg.text('');
			divedit.toggleClass("itags itagh").find('span').text("");
		}
		function addtags() {
			editmsg.text('');
			divadd.toggleClass("itags itagh").find('span').text("");
			itag.val("");
		}
		function showTags(data) {
			var target = $('form>ul','#tag');
			for (var i = 0; i < data.length; i++) {
				if (data[i].lock)
					data[i].tag+="*";
				$('<li class="tag"><a href="" target="_blank">' + data[i].tag+ '</a></li>').appendTo(target);
			}
			if ($('li>a','#tag').length==10)
				addtagbutton.prop("disabled",true);
		}
		
		
		
		vote.click(function(){
			var c=vote.val()=='vote';
				$.post('tag/vote.controller',{wid:wid.val(),tag:targettag.val(),check:c},function(data){
					if(data && c)
						vote.val('unvote');
					else if(data)
						vote.val('vote');
					else
						alert('error');
				});
		});
		
	
		var version=$('input[name=recordversion]','#rc');
		var titles=$('tbody>tr>td:first-child','#rc');
		var values=$('tbody>tr>td:last-child','#rc');
		var frm=$('form', '#rc');
		var records=$('input[name^=record]','#rc');

		var update=$('input[name=update]','#rc');
		var submit=$('input[name=submit]','#rc');
		var cancel=$('input[name=cancel]','#rc');
		var review=$('button[name=review]','#rc');
		var message=cancel.next('span');
		var report = $('button[name=report]');
		
		
		report.click(function(){
			
			
		});
		
		records.on('change',function(){
			$(this).parent('td').next('td').text($(this).val());
		});
		submit.on('click',function(){
			$.post('record/insert.controller',frm.serialize(),function(data){
				if(data){
					if(update.val()=='true'){
						message.text('updated');
					}else{
						message.text('done');
						update.val('true');
						submit.val('update');
						cancel.val('delete');
					}
				}else{
					message.text('error');
				}
					
			});
		});
		function resetform(){
			for(var i=0;i<values.length;i++){
				values.eq(i).text('5');
				var r=records.eq(i)
				if(r.val()!=-1)
					r.val(5);
			}
		}
		cancel.on('click',function(){
			if(update.val()=='false'){
				resetform();
				message.text('');
			}else{
				$.post('record/delete.controller',frm.serialize(),function(data){
					if(data){
						message.text('deleted');
						update.val('false');
						submit.val('submit');
						cancel.val('reset');
						resetform();
					}else{
						message.text('failed to delete');
					}	
				});
			}
		});
		review.click(function(){
			$('#reviewmodal').modal(
					{backdrop : 'static',keyboard:false}
			);
		});
		
		review.mousedown(function(){
			$(this).addClass('btn-success');
		});
		review.mouseup(function(){
			$(this).removeClass('btn-success');
		});
		review.mouseout(function(){
			$(this).removeClass('btn-success');
		});
		
		report.click(function(){
			$('#reviewmodal').modal(
					{backdrop : 'static',keyboard:false}
			);
		});
		
		var like=$('button[name=like]','#rc');
		var likes=$('#likes');
		var follow=$('button[name=follow]','#rc');
		var followers=$('#followers');
		var donate = $('button[value=donate]');
		
		like.click(function(){
			if(like.val()=='like'){
				$.post('like/insert.controller',{wid:wid.val()},function(data){
					if(data.liked){
						like.val('unlike');
						like.removeClass('btn-default');
						like.addClass('btn-danger');
						likes.text(data.likes);
					}else{
						alert('error');
					}
				});
			}else{
				$.post('like/delete.controller',{wid:wid.val()},function(data){
					if(data!='' && !data.liked){
						like.val('like');
						like.removeClass('btn-danger');
						like.addClass('btn-default');
						likes.text(data.likes);
					}else{
						alert('error');
					}
				});
			}
		});
		
		follow.click(function(){
			if(follow.val()=='follow'){
				$.post('follow/insert.controller',{wid:wid.val()},function(data){
					if(data.followed){
						follow.val('unfollow');
						follow.removeClass('btn-default');
						follow.addClass('btn-info');
						followers.text(data.followers);
					}else{
						alert('error');
					}
				});
			}else{
				$.post('follow/deleteByWid.controller',{wid:wid.val()},function(data){
					if(data!='' && !data.followed){
						follow.val('follow');
						follow.removeClass('btn-info');
						follow.addClass('btn-default');
						followers.text(data.followers);
					}else{
						alert('error');
					}
				});
			}
		});
		
		donate.on('click',function(){
			window.open('point/donate.controller?wid='+wid.val(),'donate','height=300,width=300');
		});
		
		donate.on('mousedown', function(){
			$(this).addClass('btn-warning');
		});
		donate.on('mouseup', function(){
			$(this).removeClass('btn-warning');
		});
		donate.on('mouseout', function(){
			$(this).removeClass('btn-warning');
		});
		
		$('#closereview').click(function() {
			$('#reviewmodal').modal('hide');
		});
		$('#reviewmodal').on('hidden.bs.modal',function(){
			$('body').addClass('modal-open');
		});
		$('#closeimagemodal').click(function() {
			$('#ImageModal').modal('hide');
		});
		function getAll(){
			$.get('follow/check.controller',{wid:wid.val()},function(data){
				followers.text(data.followers);
				if(data.followed){
					follow.val('unfollow');
					follow.removeClass('btn-default');
					follow.addClass('btn-info');
				}
			});
			$.get("tag/get.controller", {
				wid : wid.val()
			},function(data){
				$('form>ul','#tag').empty();
				showTags(data); 
			});
			
			$.get('record/getw.controller',{wid:wid.val()},function(data){
				if(data.isscore){
					version.val(data.scoreversion);
					titles.each(function(i){
						var item=data['score_'+(i+1)];	
						if (item!=null && item.trim()!=""){
							$(this).text(item);
						}
						else{
							$(this).parent('tr').hide();
							records.eq(i).attr('type','text').val(-1);
						}
					});
					$.get('record/getr.controller',frm.serialize(),function(data){
						if(data){
							update.val('true');
							submit.val('update');
							cancel.val('delete');
							values.each(function(i){
								var current=records.eq(i);
								if(current.val()>=0){
									var v=data['record_'+(i+1)];
									$(this).text(v);	
									current.val(v);
								}
							});
						}else
							update.val('false');
					});
				}
				else{
					review.next('table').remove();	
					review.remove();
				}	
			});
			$.get('like/check.controller',{wid:wid.val()},function(data){
				likes.text(data.likes);
				if(data.liked){
					like.val('unlike');
					like.removeClass('btn-default');
					like.addClass('btn-danger');
				}
			});
		}
		
	</script>
	
</body>
</html>