<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
div#replyBox {
	border: 1px solid #E6E6E6;
	padding-right: 50px;
	padding-bottom: 50px;
	width: 450px;
	font-size: 12px;
	color: #A4A4A4;
}
div#sendBox {
	font-size: 12px;
	color: #000000;
}
div#column1{
	position:absolute;
	border: 1px solid #ccc;
	padding:10px;
	width:100px;	
}
div#allcontent{
	position:absolute;
	left:200px;
}
div#mailcontent {
	border: 1px solid #E6E6E6;
	width: 500px;
	font-size: 12px;
/* 	color: #A4A4A4; */
}
div#content {
	position: relative;
	left:200px;
	width: 500px;
	border: 1px solid #E6E6E6;
}
.text {
	font-size: 12px;
	color: #A4A4A4;
	text-decoration: underline;
}

.textOver {
	font-size: 12px;
	color: #5858FA;
	text-decoration: underline;
}

.textout {
	font-size: 12px;
	color: #A4A4A4;
	text-decoration: underline;
}
.writeout{
	padding:5px;
	background-color: #819FF7;
	text-align:center;
}
.writeover{
	padding:5px;
	background-color: #0040FF;
	color: white;
	text-align:center;
}
div.mailboxout{
	padding:5px;
	font-size:12px;
	background-color: ;
	text-align:center;
}
div.mailboxover{
	padding:5px;
	font-size:12px;
	background-color: #E6E6E6;
	text-align:center;
}


</style>
</head>
<body>
	<h3>ArtFolio活動專區</h3>
	<a href="<c:url value="/bounty/bountyIndex.jsp"/>">活動首頁</a> |
	<a href="<c:url value="/bounty/bountyDisplay.jsp"/>">所有活動</a> |
	<a href="<c:url value="/bounty/bountyUpload.jsp"/>">舉辦活動</a> |
	<a href="<c:url value="/bounty/bountyTrackPage.jsp"/>">活動追蹤</a> |
	<a href="<c:url value="/bounty/bountyPersonal.jsp"/>">活動管理</a> |
	<a href="">回作品集</a>  |
	<a href="<c:url value="/mail/mailIndex.jsp"/>">站內信</a>  |
	<a href="<c:url value="/secure/login.jsp"/>">登入</a> |
	<a href="<c:url value="/secure/logout.jsp"/>">登出</a> |  <span>您好，${loginOK.name}</span>
	<hr>


<div id="column1">
	<h3>站內信通知</h3>
	
	<div id="write">撰寫</div>
	<hr>
	<div id="mailbox">收件匣</div>
	<br>
	<div id="mailcopy">寄件備份</div>
	<br>
	<div id="draft">草稿</div>
	<br>
	<div id="read">已讀 </div>
	<br>
	<div id="junk">垃圾桶</div>
	<br>
</div>

<div id="allcontent">
	<div id="mailcontent">
		<h3>${mailBean.mailtitle}</h3>
	</div>
	
	<div id="#content">
		<br>
		<c:forEach var="re" items="${replyList}">
			<c:url var="link" value="FileDownServlet">
				<c:param name="attachId" value="${re.mattach.substring(re.mattach.lastIndexOf('/')+1)}"></c:param>
			</c:url>
			<div id="mailcontent">
				<table>
					<tr><td>寄件者:${re.memberBean.name} (${re.memberBean.email}):<br>${re.maildate}</td></tr>
					<tr><td width="300px"><br>${re.mailcontent}</td></tr>						
					<c:if test="${not empty re.mattach}">
					<tr><td class="mailDownLoad"><a href="${link}">附件下載</a></td></tr><!--mailAttach -->	
					</c:if>						
				</table>
			</div>
		</c:forEach>
	</div>
	<br>

	<div id="replyBox">
		按這裡即可<label id="reply">回覆</label>或<label id="forward">轉寄</label>郵件
	</div>

	<div id="sendBox">
		<form action="mail.controller" method="post"
			enctype="multipart/form-data" id="form">
			<table>
				<tbody>
					<tr>
						<td><span>收件者</span></td>
						<td><input type="text" size="40" name="recipientmail"
							value="${mailBean.memberBean.name} ${mailBean.memberBean.email}" /></td>
						<!--取得要回覆者的ID -->
						<td><input type="hidden" id="recipient" name="recipient"
							size="40" value="${mailBean.memberBean.mid}" /></td>
						<!--取得要回覆者的ID -->
					</tr>
					<tr>
						<td><span>主旨</span></td>
						<td><input type="text" name="title" size="40"
							value="Re:${mailBean.mailtitle}" /></td>
					</tr>
					<tr>
						<td colspan="2"><textarea cols="49" rows="20" name="content"></textarea></td>
					</tr>
					<tr>
						<td><input type="hidden" name="reply"
							value="${mailBean.reid}" /></td>
						<td><input type="hidden" name="mailid"
							value="${mailBean.mailid}" /></td>
							<!-- 取得要回覆的mailId -->
						<td><input type="hidden" name="replystate" value="true"></td>
							<!--  -->
					</tr>
					<tr>
						<td colspan="2"><input type="submit" name="submit" value="傳送" /><input
							type="file" name="file" /></td>
					</tr>
				</tbody>
			</table>
		</form>
		<div>${err.alert}</div>
	</div>
</div>	

	<script src="../js/jquery-3.2.1.min.js"></script>
	<script language="Javascript">
		$(document).ready(function() {
			var contentPath = "${pageContext.request.contextPath}"		
			//=====按鈕樣式======================================
			$('#write').addClass('writeout').mouseover(function (){
				$(this).removeClass().addClass('writeover');
			}).mouseout(function (){
				$(this).removeClass().addClass('writeout');	
			});
			
			$('#mailbox').addClass('mailboxout').mouseover(function (){
				$(this).removeClass().addClass('mailboxover');
			}).mouseout(function (){
				$(this).removeClass().addClass('mailboxout');	
			});
			
			$('#junk').addClass('mailboxout').mouseover(function (){
				$(this).removeClass().addClass('mailboxover');
			}).mouseout(function (){
				$(this).removeClass().addClass('mailboxout');	
			});
			
			$('#mailcopy').addClass('mailboxout').mouseover(function (){
				$(this).removeClass().addClass('mailboxover');
			}).mouseout(function (){
				$(this).removeClass().addClass('mailboxout');	
			});
			
			$('#draft').addClass('mailboxout').mouseover(function (){
				$(this).removeClass().addClass('mailboxover');
			}).mouseout(function (){
				$(this).removeClass().addClass('mailboxout');	
			});	
			
			$('#read').addClass('mailboxout').mouseover(function (){
				$(this).removeClass().addClass('mailboxover');
			}).mouseout(function (){
				$(this).removeClass().addClass('mailboxout');	
			});
				
			$('#reply').addClass('text').mouseover(function() {
				$(this).removeClass().addClass('textOver');
			}).mouseout(function() {
				$(this).removeClass().addClass('textout');
			})
			
			$('#forward').addClass('text').mouseover(function() {
				$(this).removeClass().addClass('textOver');
			}).mouseout(function() {
				$(this).removeClass().addClass('textout');
			})
			
			//=====按鈕動作===========================================================================
			$('#write').click(function () {	
	 			$(location).attr('href', contentPath+'/mail/mailUploadList.controller?mailClass=general')	
			});
			
			$('#mailbox').click(function () {			
				$(location).attr('href', '<c:url value="/mail/mailIndex.jsp" />')				
			});
			
			$('#junk').click(function () {			
				$(location).attr('href', '<c:url value="/mail/junkemail.jsp" />')			
			});
			
			$('#read').click(function () {			
				$(location).attr('href', '<c:url value="/mail/readmail.jsp" />')			
			});
			
			$('#sendBox').hide();
			$('#reply').click(function(data) {
				$('#replyBox').hide();
				$('#sendBox').show();
			});
			
			var mid = "${loginOK.mid}"
			$.getJSON("mailDisplay.controller",{"targetId":mid, "ShowReadOrDelete":"undelete"},function(datas) {
				$('#mailbox').text("收件匣 ("+datas.length+")")
			})
			$.getJSON("mailDisplay.controller",{"targetId":mid, "ShowReadOrDelete":"read"},function(datas) {
				$('#read').text("已讀 ("+datas.length+")")
			})
			$.getJSON("mailDisplay.controller",{"targetId":mid,"ShowReadOrDelete":"delete"},function(datas) {
				$('#junk').text("垃圾桶 ("+datas.length+")")
			})	
		});
	</script>