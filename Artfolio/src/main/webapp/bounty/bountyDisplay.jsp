<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<div id="searchBox">
A排序:<br>
<input class="box" type="checkbox" value="b_bonus_total" name="order"/>最高獎金
<input class="box" type="checkbox" value="b_click" name="order"/>熱門活動
<input class="box" type="checkbox" value="b_update" name="order"/>最新活動
<!-- <input type="button" id="ok" value="確定"> -->
<hr>

B階段: <br>
<input class="state" type="checkbox" value="all"/>不限
<input class="state" type="checkbox" value=""/>徵件中
<input class="state" type="checkbox" value=""/>獲選公佈 
<hr>

<div >C獎金範圍:</div> <br>
<input class="brange" type="checkbox" value="below50k"/>5萬以下<br>
<input class="brange" type="checkbox" value="50to100k"/>5萬到10萬<br>
<input class="brange" type="checkbox" value="100to250k"/>10萬到25萬 <br>
<input class="brange" type="checkbox" value="250to500k"/>25萬到50萬 <br>
<input class="brange" type="checkbox" value="500kup"/>50萬以上 <br>
<hr>

類別選擇:<input id="clear" type="button" value="重置"/><br> 
</div> 
<div id="column1">
	<table id="bountyTable">
		<tbody>
		
			by JSON 排序目前完成 A、C排序 尚無法進行綜合搜尋
		</tbody>
	</table>
</div>
  <script src="../js/jquery-3.2.1.min.js"></script>
  <script language="Javascript">
  
  $(function() {	
	    var contentPath = "${pageContext.request.contextPath}"
		if(!$('input:checkbox').prop('checked')){   //如果條件選擇器未勾選預設載入所有活動資訊
			loadBounty();
		}
		$('input:checkbox').change(function(){	                             //選擇器選取狀態改變
			if($(':checkbox:checked').prop('checked')){	                 //若checkbox有打勾			                          
				selectBounty($(this).val());                 //取得打勾checkbox的值並以此選取活動資訊
			}else{
				loadBounty();            //取消選擇  載入loadBounty()
			}
		})
			
		function loadBounty() {
			$.getJSON('display.controller', function(datas) {
				var docFrag = $(document.createDocumentFragment());
				var tb = $('#bountyTable>tbody');
				tb.empty();
					                     
				$.each(datas, function(idx, bounty) {
// 					alert("<img src='/bountyImgs/"+bounty.b_attach_pic.substring(bounty.b_attach_pic.lastIndexOf('/')+1)+"'>")			                                                                   
					var cell1=  $('<td></td>').html( "<a href='/Artfolio/bounty/bountyPage.controller?id="+bounty.b_id+"'><img src='/bountyImgs/"+bounty.b_attach_pic.substring(bounty.b_attach_pic.lastIndexOf('/')+1)+"'></a>")
					   var cell2 = $('<td></td>').html("<h3><a href='/Artfolio/bounty/bountyPage.controller?id="+bounty.b_id+"'>"+bounty.b_title+"</a></h3><span>總獎金 TWD$ : "+bounty.b_bonus_total+"<span><br><span>截止收件: " +bounty.b_enddate +"</span><br><span>瀏覽數: " +bounty.b_click + "</span><br><span><input type='button' value='追蹤'/><input type='button' value='參加'/></span>" );			   
					   var cell3= $('<td></td>').html("<div style='display:none'>"+bounty.b_id+"</div>")
					   var cell4= $('<td></td>').html("<div style='display:none'>"+bounty.mid+"</div>")
					   var cell5= $('<td></td>').html("<div style='display:none'>"+bounty.b_title+"</div>")		
					   var row = $('<tr></tr>').append(
								[cell1,cell2,cell3,cell4,cell5]);
						docFrag.append(row);
				})
				tb.append(docFrag);
			})
		}	
		
		function selectBounty(Selector) {
			$.getJSON('bountySelect.controller', {'Selector' : Selector},function(datas) {
				var docFrag = $(document.createDocumentFragment());
				var tb = $('#bountyTable>tbody');
				tb.empty();
				$.each(datas, function(idx, bounty) {
					   var cell1=  $('<td></td>').html( "<a href='/Artfolio/bounty/bountyPage.controller?id="+bounty.b_id+"'><img src='/bountyImgs/"+bounty.b_attach_pic.substring(bounty.b_attach_pic.lastIndexOf('/')+1)+"'></a>")
 					   var cell2 = $('<td></td>').html("<h3><a href='/Artfolio/bounty/bountyPage.controller?id="+bounty.b_id+"'>"+bounty.b_title+"</a></h3><span>總獎金 TWD$ : "+bounty.b_bonus_total+"<span><br><span>截止收件: " +bounty.b_enddate +"</span><br><span>瀏覽數: " +bounty.b_click + "</span><br><span><input type='button' value='追蹤'/><input type='button' value='參加'/></span>" );			   
					   var cell3= $('<td></td>').html("<div style='display:none'>"+bounty.b_id+"</div>")
					   var cell4= $('<td></td>').html("<div style='display:none'>"+bounty.mid+"</div>")
					   var cell5= $('<td></td>').html("<div style='display:none'>"+bounty.b_title+"</div>")
					   var row = $('<tr></tr>').append(
								[cell1,cell2,cell3,cell4,cell5]);
						docFrag.append(row);
				})
				tb.append(docFrag);
			})
		}
		
// ====================================================================================================
		$('#bountyTable>tbody').on('click','input:nth-child(1)',function(data) { //追蹤
			//alert($(this).parents('tr').children('td:eq(2)').children('div').text())
			var b_id = $(this).parents('tr').children('td:eq(2)').children('div').text();
			var mid = "${loginOK.mid}";	
			$.get("bountyTrack.controller",{"b_id":b_id,"mid":mid}, function(data) {			
				alert(data);
			});
		});
		
		// ====================================================================================================		
		$('#bountyTable>tbody').on('click','input:nth-child(2)',function(data) { //參加
			var toId = $(this).parents('tr').children('td:eq(3)').children('div').text();
			var title = $(this).parents('tr').children('td:eq(4)').children('div').text();	 			
			$(location).attr('href', contentPath+'/mail/mailUploadList.controller?toId='+toId+'&title='+title+'&mailClass=signup');
		});
	});
</script>
</body>
</html>