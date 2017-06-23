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
<link rel="stylesheet" href="/Artfolio/css/sweetalert.css">
<script src='/Artfolio/js/jquery-3.2.1.min.js'></script>
<script src='/Artfolio/js/sweetalert.min.js'></script>
<style type="text/css">
*{
	font-family:monospace 微軟正黑體;
}
.wmsgArea {
	min-height: auto;
	max-height: 500px;
/* 	overflow-y: auto; */
/* 	overflow-x: hidden; */
}
.recommendPhoto {
  overflow: hidden;
  width: 100px;
  height: 100px;
  margin-top: 12px;
  margin-bottom: 12px;
  margin-right:30px;
  position: relative;
  float:left;
  cursor:pointer;
  transition:0.4s;
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
.wmsgimg {
  overflow: hidden;
  width: 30px;
  height: 0;
  padding-bottom: 100%;
  margin-top: 12px;
  margin-bottom: 12px;
  position: relative;
  box-shadow: 3px 15px 50px -15px;
}
.wmsgimg img {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
  width: 160%;
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
			<div class="col-sm-0 col-md-1">
				<a id="timer" class="btn btn-lg"></a>
			</div>
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
									<img src="" alt="" />
									<div class="title-box">
										<div class="info">
											<h3 class="author"></h3>
											<h2 class="pic-title">error</h2>
											<div class="goto-pic">show view</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-12 col-md-4">
								<div class="row">
									<div class="col-sm-6 col-md-12 padding-0">
										<div id="top8" class="img-box tobig">
											<img src="" alt="" />
										</div>
									</div>
									<div class="col-sm-6 col-md-12 padding-0">
										<div id="top9" class="img-box tobig">
											<img src="" alt="" />
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-12 col-md-8 padding-0">
								<div id="top3" class="img-box">
									<img src="" alt="" />
									<div class="title-box">
										<div class="info">
											<h3 class="author"></h3>
											<h2 class="pic-title">error</h2>
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
									<img src="" alt="" />
									<div class="title-box">
										<div class="info">
											<h3 class="author"></h3>
											<h2 class="pic-title">error</h2>
											<div class="goto-pic">show view</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6 padding-0">
								<div id="top5" class="img-box">
									<img src="" alt="" />
									<div class="title-box">
										<div class="info">
											<h3 class="author"></h3>
											<h2 class="pic-title">error</h2>
											<div class="goto-pic">show view</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-12 col-md-8 padding-0">
								<div id="top2" class="img-box">
									<img src="" alt="" />
									<div class="title-box">
										<div class="info">
											<h3 class="author"></h3>
											<h2 class="pic-title">error</h2>
											<div class="goto-pic">show view</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-12 col-md-4">
								<div class="row">
									<div class="col-sm-6 col-md-12 padding-0">
										<div id="top10" class="img-box tobig">
											<img src="" alt="" />
										</div>
									</div>
									<div class="col-sm-6 col-md-12 padding-0">
										<div id="top11" class="img-box tobig">
											<img src="" alt="" />
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6 padding-0">
								<div id="top6" class="img-box">
									<img src="" alt="" />
									<div class="title-box">
										<div class="info">
											<h3 class="author"></h3>
											<h2 class="pic-title">error</h2>
											<div class="goto-pic">show view</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6 padding-0">
								<div id="top7" class="img-box">
									<img src="" alt="" />
									<div class="title-box">
										<div class="info">
											<h3 class="author"></h3>
											<h2 class="pic-title">error</h2>
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
	<section id="showWorksArea" class="container-fluid new-picture">
		<div class="row">
			<div class="col-sm-0 col-md-1"></div>
			<div class="col-sm-12 col-md-10">
				<h1>New Pictures</h1>
				<hr/>
				<div id="searchResult" class="row" >
				</div>
			</div>
			<div class="col-sm-0 col-md-1"></div>
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
											<h4 class="modal-title" id="reviewmodalLabel">評分作品</h4>
										</div>
										<div class="modal-body">
											<table class="table" style="font-size:16px;">
												<thead>
													<tr>
														<th colspan="3">項目</th>
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
															type="button" name="submit" value="送出"> <input
															type="button" name="cancel" value="重置"><span></span>
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
								<div style="height:auto; min-height:100px;padding-left:15px;" id="workInfo"></div>
							</div>
							<div style="height:auto; min-height:100px" id="tag" class="row">
							<div class="col-md-10">
								<form>
									<ul style="padding-left:0px;height:auto; min-height:60px;">
										<li class="tag"></li>
									</ul>

									<div id="addtag" class="itagh">
										<input type="text" name="tag" value="">
										<button class="btn btn-primary btn-sm" type="button" name="add" value="add"><span class="glyphicon glyphicon-plus"></span></button>
										<button class="btn btn-danger btn-sm" type="button" onclick="addtags()" value="cancel"><span class="glyphicon glyphicon-remove"></span></button>
										<span></span>
									</div>
									<div id="edittag" class="itagh">
										<input type="hidden" name="targettag"> <input class="btn btn-sm btn-warning"
											type="button" name="vote" value="vote">  <input class="btn btn-sm btn-danger"
											type="button" name="delete" value="delete"> <input class="btn btn-sm btn-default"
											type="button" onclick="cancele()" value="關閉"> <span></span>
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
										<textarea wrap="hard" id="wmsgTextarea" class="form-control" rows="3"
											cols="20"></textarea>
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
	<div class="modal fade bs-example-modal-sm" id="reportmodal"
								tabindex="-1" role="dialog" aria-labelledby="reportmodalLabel">
							<div class="modal-dialog modal-sm" role="document">
								<div class="modal-content">
									<div class="modal-header" style="text-align: left">
										<button type="button" class="close" id="closereport" aria-label="Close">
										<span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title" id="reportmodalLabel">檢舉</h4>
									</div>
									<div class="modal-body">
										<div class="row">
											<form id='reportForm'>
												<div class="form-group">
													<h5><span>檢舉事由：</span></h5><br/>
													<textarea class="form-control" rows="5"
														cols="30" name="mailcontent"></textarea>
														<input type="hidden" name="toId" value="1">
														<input type="hidden" name="mailtitle" value="">
														<input type="hidden" name="mstatus" value="3">
													<div class="pull-right">
														<input type="button" class="btn btn-primary disabled"
															name="reportSubmit" value="送出" disabled> <input
															type="button" class="btn btn-default disabled"
															name="reportCancel" value="取消" disabled>
													</div>
												</div>
											</form>
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

			var searchToken = "${searchToken}";
			if(searchToken == 1){
				$.getJSON('');
			}
			
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
			var wmsgTextarea = $('#wmsgTextarea');
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
							top1.children('input[name="wid"]').remove();
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
							top2.children('input[name="wid"]').remove();
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
							top3.children('input[name="wid"]').remove();
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
							top4.children('input[name="wid"]').remove();
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
							top5.children('input[name="wid"]').remove();
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
							top6.children('input[name="wid"]').remove();
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
							top7.children('input[name="wid"]').remove();
							top7.append($(
									'<input type="hidden" name="wid"></input>')
									.val(value.workBean.wid));
							break;
						case 7:
							top8.children('img').attr('src',
									value.workBean.picurl);
							top8.children('input[name="wid"]').remove();
							top8.append($(
									'<input type="hidden" name="wid"></input>')
									.val(value.workBean.wid));
							break;
						case 8:
							top9.children('img').attr('src',
									value.workBean.picurl);
							top9.children('input[name="wid"]').remove();
							top9.append($(
									'<input type="hidden" name="wid"></input>')
									.val(value.workBean.wid));
							break;
						case 9:
							top10.children('img').attr('src',
									value.workBean.picurl);
							top10.children('input[name="wid"]').remove();
							top10.append($(
									'<input type="hidden" name="wid"></input>')
									.val(value.workBean.wid));
							break;
						case 10:
							top11.children('img').attr('src',
									value.workBean.picurl);
							top11.children('input[name="wid"]').remove();
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
				if (issue == "more") {

				} else {
					showTop(issue);
					$('#topHeading').text(
							'Top Pictures of the Issue ' + issue);
				}
			});
			//顯示最新top

			var searchResult = $('#searchResult');
			
			
			var fromTag='${param.tag}';
			var doSearch='${param.type}';
			var andCondition='${param.andCondition}';
			var orCondition='${param.orCondition}';
			var notCondition='${param.notCondition}';
			var orderBy='${param.orderby}';
			var order='${param.order}';
			var period='${param.period}';
			if(fromTag){
				doSearch='tag';
				andCondition=fromTag;
			}
			if(doSearch && (andCondition || orCondition || notCondition)){
				$('select[name=type]','#search').val(doSearch);
				if(orderBy)
				$('select[name=orderby]','#search').val(orderBy);
				if(order)
				$('select[name=order]','#search').val(order);
				if(period)
				$('select[name=period]','#search').val(period);
				$('input[name="and"]').val(andCondition);
				$('input[name="or"]').val(orCondition);
				$('input[name="not"]').val(notCondition);
				$('button[value=submit]','#search').get(0).click();
			}else
				showNews();
			
			function showNews(){
				$.get('searchRecent.controller',function(data){
					var docFrag = $(document.createDocumentFragment()); 
					$.each(data, function(index, value){
						var div = $('<div class="col-sm-12 col-md-3 padding-0" style="margin-bottom:12px;">');
						var imgbox = $('<div style="cursor:pointer;" class="img-box">');
						var img = $('<img class="lazy">').attr('data-original', value.picurl);
						var widHidden = $('<input type="hidden" name="wid">').val(value.wid);
						imgbox.append(img);
						imgbox.append(widHidden);
						div.append(imgbox);
						docFrag.append(div);
					});
					searchResult.append(docFrag);
				})
			}
			
			//博超--------

			function showModal() {
				thisWid = $(this).children('input[name="wid"]').val();
				$('#wid').val(thisWid);
				var mb = $('#modalbodyimage').empty();
				$(this).children('img').clone().attr("style",
							"max-width:100%;max-height:700px;").appendTo(mb);
				$('#ImageModal').modal(
					{backdrop : 'static',keyboard:false}
				);
				showWmsg();
				showWorkInfo();
				getAll();
				showRecommendPhoto();
				saveUserBrowse();
				$('input[name="mailtitle"]').val(thisWid+":圖片檢舉");
			}
			
			function saveUserBrowse(){
				if($('#user').val()){
					$.post('browsed.controller', {wid:thisWid}, function(){
					});
				}
			}
			
			function showWorkInfo(){
				memberName.empty();
				workInfo.empty();
				ImageModalLabel.empty();
				$.getJSON('getWorkById.controller', {wid:thisWid}, function(data){
					memberName.append($('<h4>').append($('<a>').text(data.memberBean.name).attr('href','/Artfolio/getAuthor.controller?targetId='+data.memberBean.mid)));
					workInfo.append(data.workBean.winfo);
					ImageModalLabel.append(data.workBean.wtitle);
				});
			}
			
			$(document).on('click','div.search-box', showModal);
			
			$(document).on('click','div.img-box',showModal);
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
				if($('#user').val()){
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
			}
			
			//wmsg
			function showWmsg() {
				$.getJSON('showWmsg.controller', {wid:thisWid}, function(data) {
					wmsgTable.empty();
					var docFrag = $(document.createDocumentFragment());
					$.each(data, function(index, value) {
						var td1 = $('<td width="10%">').append($('<div class="wmsgimg">').append($('<img>').attr('src',value.memberBean.mphoto)));
						var td2 = $('<td width="12%">').append($('<a>').attr('href','/Artfolio/getAuthor.controller?targetId='+value.memberBean.mid).text(value.memberBean.name));
						var td3 = $('<td width="40%">').html(value.wmsgcontent);
						var td4 = $('<td width="35%">').text($.formatDateTime('yy-mm-dd hh:ii',new Date(value.wmsgdate)));
						var td6 = $('<input type="hidden">').val(value.wmsgid);
						var row = $('<tr>');
						if (value.memberBean.mid == $('#user').val()) {
							var td5 = $('<td width="3%">').append($('<a title="delete" class="btn glyphicon glyphicon-remove-circle">'));
								td5.append($('<a title="edit" class="btn glyphicon glyphicon-pencil">'));
							row.append([td1, td2, td3, td4, td5, td6 ]);
						}else {
							var td5 = $('<td width="3%">');
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
				if($('#user').val()){
					var msg = wmsgTextarea.val();
					$.post('insertWmsg.controller',	{wmsgcontent : msg,	wid : thisWid},function(data) {
						var td1 = $('<td width="10%">').append($('<div class="wmsgimg">').append($('<img>').attr('src',data.memberBean.mphoto)));
						var td2 = $('<td width="12%">').append($('<a>').attr('href','/Artfolio/getAuthor.controller?targetId='+data.memberBean.mid).text(data.memberBean.name));
						var td3 = $('<td width="40%">').html(data.wmsgcontent);
						var td4 = $('<td width="35%">').text($.formatDateTime('yy-mm-dd hh:ii', new Date(data.wmsgdate)));
						var td6 = $('<input type="hidden">').val(data.wmsgid);
						var row = $('<tr>');
						if (data.memberBean.mid == $('#user').val()) {
							var td5 = $('<td width="3%">').append($('<a title="delete" class="btn glyphicon glyphicon-remove-circle">'));
								td5.append($('<a title="edit" class="btn glyphicon glyphicon-pencil">'));
								row.append([ td1, td2, td3, td4, td5, td6 ]);
						} else {
							var td5 = $('<td width="3%">');
							row.append([ td1, td2, td3, td4, td5,td6 ]);
						}
						wmsgTable.prepend(row);
					});
				}else{
					swal('警告','請登入後重試','warning');
				}
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
						var msg = td.html().replace(/<br>/g,"\n");
						
						if (thiz.hasClass('glyphicon-pencil')) {
							td.empty();
							td.append($('<textarea rows="3" cols="18">').val(
									htmldecode(msg)));
							thiz.removeClass('glyphicon-pencil');
							thiz.addClass('glyphicon-ok-circle');
						} else if (thiz.hasClass('glyphicon-ok-circle')) {
							var wmsgcontent = td.children('textarea').val();
							$.get('updateWmsg.controller', {
								wmsgid : id,
								wmsgcontent : wmsgcontent
							}, function(data) {
								td.empty();
								td.html(data.wmsgcontent.replace(/\n/g,'<br>'));
								thiz.removeClass('glyphicon-ok-circle');
								thiz.addClass('glyphicon-pencil');
							});
						}
					});

			function htmldecode(s){  
			    var div = document.createElement('div');  
			    div.innerHTML = s;  
			    return div.innerText || div.textContent;  
			}  
			
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
								addmsg.text("標籤必須在20字以下");
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
						if(stag.length==0){
							addmsg.text("全部重複");
						}
						else
						if(current.length+stag.length<=20){
							$.post("tag/add.controller", {
								wid : wid.val(),
								tags : stag
							}, function(data){
								if(data){
									showTags(data);
									if(message!="")
										addmsg.text("標籤已存在: "+message);
									else
										addmsg.text("完成");
									itag.val("");
								}else
									addmsg.text("錯誤");
							});
						}else
							addmsg.text("標籤不能超過10個");
					} else
						addmsg.text("以逗點分隔，限中英文與空白，且輸入兩字以上，最多10個，每個最多20字元");
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
			var ds = "刪除 " +s;
			if (divedit.hasClass("itagh")) {
				divedit.toggleClass("itags itagh").find('span').text("");
				deltagbutton.val(ds);
			} else if (deltagbutton.val() != ds) {
				deltagbutton.val(ds);
			} else
				divedit.toggleClass("itags itagh").find('span').text("");
			
			$.get('tag/voted.controller',{wid:wid.val(),tag:s},function(data){
				if(data){
					vote.val("撤銷");
				}else{
					vote.val("投票");
				}
			});

		});
		deltagbutton.on('click', function() {
			addmsg.text('');
			var tag = deltagbutton.val().substr(3);
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
				var tag=data[i].tag;
				if (data[i].lock)
					data[i].tag+="*";
				$('<li class="tag"><a class="label label-default" href="/Artfolio/index.jsp?tag='+tag+'" target="_blank">' + data[i].tag+ '</a></li>').appendTo(target);
			}
			if ($('li>a','#tag').length==10)
				addtagbutton.prop("disabled",true);
		}
		
		
		
		vote.click(function(){
			var c=vote.val()=='投票';
				$.post('tag/vote.controller',{wid:wid.val(),tag:targettag.val(),check:c},function(data){
					if(data && c)
						vote.val('撤銷');
					else if(data)
						vote.val('投票');
					else
						swal('錯誤','error','error');
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
		var reportSubmit = $('input[name="reportSubmit"]');
		var reportCancel = $('input[name="reportCancel"]');
		var reportTextarea = $('#reportForm').find('textarea');
	
		function changeBtnDisableReport() {
			if (reportTextarea.val().length <= 0) {
				reportSubmit.addClass('disabled');
				reportSubmit.prop('disabled', true);
				reportCancel.addClass('disabled');
				reportCancel.prop('disabled', true);
			} else if (reportTextarea.val().length > 0) {
				reportSubmit.removeClass('disabled');
				reportSubmit.prop('disabled', false);
				reportCancel.removeClass('disabled');
				reportCancel.prop('disabled', false);
			}
		}
		
		report.click(function(){
			$('#reportmodal').modal(
					{backdrop : 'static'}
			);
		});
		reportTextarea.keyup(function() {
			changeBtnDisableReport();
		});

		reportTextarea.mouseout(function() {
			changeBtnDisableReport();
		});
		
		reportSubmit.click(function() {
			if($('#user').val() != null){
				$.post('sendToAdminMail.controller', $('#reportForm').serialize(), function(data){
					$('#reportmodal').modal('hide');
					swal('成功',data,'success');
				});
			}else {
				swal('錯誤',"請登入後重試",'error');
			}
			
			reportTextarea.val('');
		});

		reportCancel.click(function() {
			reportTextarea.val('');
			changeBtnDisableReport();
		});
		
		
		records.on('change',function(){
			$(this).parent('td').next('td').text($(this).val());
		});
		submit.on('click',function(){
			$.post('record/insert.controller',frm.serialize(),function(data){
				if(data){
					if(update.val()=='true'){
						swal('已更新','','success');
					}else{
						swal('已評分','','success');
						update.val('true');
						submit.val('更新');
						cancel.val('刪除');
					}
				}else{
					swal('錯誤','error','error');
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
						swal('已刪除','','success');
						update.val('false');
						submit.val('送出');
						cancel.val('重置');
						resetform();
					}else{
						swal('刪除失敗','','error');
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
			$('#reportmodal').modal(
					{backdrop : 'static',keyboard:false}
			);
		});
		$('#closereport').click(function() {
			reportTextarea.val('');
			$('#reportmodal').modal('hide');
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
						swal('錯誤','error','error');
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
						swal('錯誤','error','error');
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
						swal('錯誤','error','error');
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
						swal('錯誤','error','error');
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
		$('#reportmodal').on('hidden.bs.modal',function(){
			$('body').addClass('modal-open');
		});
		$('#closeimagemodal').click(function() {
			$('#ImageModal').modal('hide');
			divedit.removeClass().addClass('itagh').find('span').text("");
			divadd.removeClass().addClass('itagh').find('span').text("");
// 			addtags();
// 			cancele();
		});
		
		function getAll(){
			$.get('follow/check.controller',{wid:wid.val()},function(data){
				followers.text(data.followers);
				console.log("data.followed=" + data.followed);
				if(data.followed){
					follow.val('unfollow');
					follow.removeClass('btn-default');
					follow.addClass('btn-info');
				}else {
					follow.val('follow');
					follow.removeClass('btn-info');
					follow.addClass('btn-default');
				}
			});
			$.get("tag/get.controller", {
				wid : wid.val()
			},function(data){
				$('form>ul','#tag').empty();
				showTags(data); 
			});
			
			$.get('record/getw.controller',{wid:wid.val()},function(data){
				if(!data.iswmsg){
					$('#wmsgTextarea').prop('disabled', true);
				}else{
					$('#wmsgTextarea').prop('disabled', false);
				}
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
							submit.val('更新');
							cancel.val('刪除');
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
		
		if(${empty loginOK}) $('#rc').remove();
		
		$('#timer').click(function(){
			window.open('/Artfolio/timer.jsp','_blank','height=200,width=500');
		});
	</script>
	
</body>
</html>