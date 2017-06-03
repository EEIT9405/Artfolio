<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
img {
/* IE7、FF 等其他非 IE 瀏覽器下最大寬度為 500px , IE6 以下不支援 max-width 屬性 */
max-width:200px;
/* 所有瀏覽器中圖片的大小為 500px */
width:200x; 
/* 當圖片大小大於 500px，自動縮小為 500px */
width:expression(document.body.clientWidth>200?"200px":"auto");
overflow:hidden;
}
</style>


</head>
<body>
		<h3>ArtFolio活動專區</h3>
		<a href="<c:url value="/bountyIndex.jsp"/>">活動首頁</a> | <a href="<c:url value="/bountyDisplay.controller"/>">所有活動</a> | <a href="<c:url value="/bountyUpload.jsp"/>">舉辦活動</a>  | <a href="">活動追蹤</a>
		| <a href="">個人活動管理</a> | <a href="">回作品集</a>
		
		<hr>

排序:
<input type="checkbox" name="random"/>隨機
<input type="checkbox" name="random"/>最高獎金
<input type="checkbox" name="random"/>熱門活動
<input type="checkbox" name="random"/>最新活動
<input type="checkbox" name="random"/>即將截止
<input type="button" value="重置"/>
<hr>

階段: 
<input type="checkbox" value="random"/>不限
<input type="checkbox" value="random"/>徵件中
<input type="checkbox" value="random"/>獲選公佈 
<input type="button" value="重置"/>

<hr>
獎金範圍: 
<input type="checkbox" value="random"/>5萬以下
<input type="checkbox" value="random"/>5萬到10萬
<input type="checkbox" value="random"/>10萬到25萬 
<input type="checkbox" value="random"/>25萬到50萬 
<input type="checkbox" value="random"/>50萬以上 
<input type="button" value="重置"/>

<hr>
類別選擇:


	<table>
		<c:forEach var="aVar" items="${bountyList}">
			<c:url value="/bountyPage.controller" var="link">
				<c:param name="id" value="${aVar.b_id}"></c:param>
			</c:url>
			<tr>
				<td><a href="${link}">${aVar.b_id}</a></td>
				<td><img src="/img/${aVar.b_attach_pic.substring(aVar.b_attach_pic.lastIndexOf('/')+1)}"></td>
				<td> ${aVar.b_title} </br>
					 總獎金:${aVar.b_bonus_total} </br>
					 最高獎金:${aVar.b_bonus_max} </br>
					 投稿期間:${aVar.b_startdate.toString().substring(0,10)}至${aVar.b_enddate.toString().substring(0,10)} </br>
					<input type="button" value="收藏"/><input type="button" value="參加"/>
				</td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>