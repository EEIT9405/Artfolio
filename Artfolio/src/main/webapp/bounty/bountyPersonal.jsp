<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>個人活動管理</title>
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

div#column1{
position:absolute;
width:600px;
left:380px;
top:100px;
border: 1px solid #ccc;
padding:50px;
overflow:auto;
}
div#searchBox{
position:absolute;
border: 1px solid #ccc;
width:300px;
left:40px;
top:100px;
padding:10px;
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
		<table id="bountyTable">
			<tbody><h3>活動管理</h3>
			</tbody>
		</table>
	</div>
	
	
	<script src="../js/jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function() {	
		var mid = "${loginOK.mid}";
		loadBounty(mid);
		
		function loadBounty(mid) {
			$.getJSON('personalDisplay.controller',{"mid":mid}, function(datas) {
				var docFrag = $(document.createDocumentFragment());
				var tb = $('#bountyTable>tbody');
				tb.empty();
								
				$.each(datas, function(idx, bounty) {
					   var cell1=  $('<td></td>').html( "<a href='/Artfolio/bountyPage.controller?id="+bounty.b_id+"'><img src='/bountyImgs/"+bounty.b_attach_pic.substring(bounty.b_attach_pic.lastIndexOf('/')+1)+"'></a>")
					   var cell2 = $('<td></td>').html("<h3><a href='/Artfolio/bountyPage.controller?id="+bounty.b_id+"'>"+bounty.b_title+"</a></h3><span>總獎金 TWD$ : "+bounty.b_bonus_total+"<span><br><span>截止收件: " +bounty.b_enddate +"</span><br><span>瀏覽數: " +bounty.b_click + "</span><br><span><input type='button' value='編輯'/><input type='button' value='刪除'/></span>" );			   
					   var cell3= $('<td></td>').html("<div style='display:none'>"+bounty.b_id+"</div>")
					    var cell4= $('<td></td>').html("<div style='display:none'>"+bounty.mid+"</div>")
					   var row = $('<tr></tr>').append(
							   [cell1,cell2,cell3, cell4]);
						docFrag.append(row);
				})
				tb.append(docFrag);
			})
		}
		
		$('#bountyTable>tbody').on('click','input:nth-child(2)',function(data) {    //刪除
// 			alert($(this).parents('tr').children('td:eq(2)').children('div').text())
			var b_id = $(this).parents('tr').children('td:eq(2)').children('div').text();
			$.ajax({
				'url':'personalDelete.controller',
	    		'data':{'b_id':b_id},
	    		'type':'get'
	    	}).done(function(data){
	    		 alert(data);
	    		 loadBounty(mid);
	    	})	
		});
	});
	

</script>

</body>
</html>