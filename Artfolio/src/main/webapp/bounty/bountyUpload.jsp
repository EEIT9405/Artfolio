<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script language="JavaScript" type="text/javascript" src="jj/html2xhtml.min.js"></script>
	<script language="JavaScript" type="text/javascript" src="jj/richtext.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
.test{
 background-color:lightgreen;
  padding-left:5px; 
  padding-right:5px; 

 margin-right:3px;
}

div#content{
position:absolute;
width:580px;
left:100px;
top:100px;
border: 1px solid #ccc;
padding:30px;
}
</style>



<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$(".datepicker").datepicker();
		$(".datepicker").datepicker("option", "dateFormat", "yy-mm-dd");
	});
	
	function doClick(){ //標籤doclick
		
		var tag = document.getElementById("tag").value; //取得輸入標籤內容
		var textnode = document.createTextNode(tag);	//將標籤內容塞入TextNode
		
		var iSpan = document.createElement("span");	
		iSpan.setAttribute("class","test");
		iSpan.appendChild(textnode);
		
		var newTagNode = document.getElementById("newTag");
		newTagNode.appendChild(iSpan); 
		
		var inputElement = document.createElement("input");
		inputElement.setAttribute("type","hidden");
	 	inputElement.setAttribute("name", "tag");
		inputElement.setAttribute("value",tag);
		
		var tagInfoNode = document.getElementById("tagInfo");
		tagInfoNode.appendChild(inputElement);
		
		document.getElementById("tag").value="";
	}
</script>

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

<!-- bounty.controller -->

<div id="content">
	<h3>舉辦活動</h3>
	<form name="RTEDemo" action="bounty.controller" method="POST" enctype="multipart/form-data" onsubmit="return submitForm();">
		<table>
			<tr>
				<td>主題:</td>
				<td><input type="text" name="topic" value="${param.topic}" /><span>${err.topic}</span></td>
			</tr>
			<tr>
				<td>標籤:</td>
				<td>
					<input id="tag" type="text" name="tagbox" /><input type="button" value="新增" onclick="doClick()" />
					</br>
					<div id="newTag"></div>
					<div id="tagInfo"></div>	
				</td>
			</tr>
			<tr>
				<td>開始日期:</td>
				<td><input type="text" name="startdate" 
					class="datepicker" /><span>${err.start}</span></td>
			</tr>
			<tr>
				<td>截止日期:</td>
				<td><input type="text" name="enddate" 
					class="datepicker" /><span>${err.end}</span></td>
			</tr>
			<tr>
				<td>公布得獎日期:</td>
				<td><input type="text" name="announced" 
					class="datepicker" /><span>${err.anno}</span></td>
			</tr>
			<tr>
				<td>總獎金:</td>
				<td><input type="text" name="totalbonus" value="${param.totalbonus}" /><span>${err.totalbonus}</span></td>

			</tr>
			<tr>
				<td>最高獎金:</td>
				<td><input type="text" name="maxbonus" value="${param.maxbonus}" /><span>${err.maxbonus}</span></td>

			</tr>
			<tr>
				<td>主辦單位:</td>
				<td><input type="text" name="organizer" value="${param.organizer}" /><span>${err.organizer}</span></td>
			</tr>
			<tr>
				<td>活動詳情:</td>
				<td><textarea  rows="10" cols="60" name="content" id="content"></textarea><span>${err.content}</span></td>
			</tr>
				<td>參加辦法:</td>
				<td><textarea  rows="10" cols="60" name="particimethod" id="particimethod"></textarea><span>${err.aprti}</span></td>
			</tr>
			<tr>
				<td>活動圖片:</td>
				<td><input type="file" name="pic" /><span>${err.attach}</span></td>
			</tr>
			<tr>
				<td>檔案:</td>
				<td><input type="file" name="file" /></td>
			</tr>
			<tr>
				<td><input type="submit" name="submit"  value="發布" /></td>
				<td><input type="button" value="重置" /></td>
			</tr>
		</table>
		<span>${err.error}</span>
	</form>
</div>
</body>
</html>