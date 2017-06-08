<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
	div#abgne_marquee {
		position: relative;
		overflow: hidden;	/* 超出範圍的部份要隱藏 */
		width: 200px;
		height: 100px;
/* 		width: 375px; */
/* 		height: 25px; */
		border: 1px solid #ccc;
	}
	div#similar{
		position: relative;
		width: 200px;
		height: 450px;
		border: 1px solid #ccc;
	}
	div#abgne_marquee ul, div#abgne_marquee li {
		margin: 0;
		padding: 0;
		list-style: none;
	}
	div#abgne_marquee ul {
		position: absolute;
	}
	div#abgne_marquee ul li a {
		display: block;
 		overflow: hidden;	/* 超出範圍的部份要隱藏 */ 
		font-size:12px;
		height: 100px;
/* 		height: 25px; */
		line-height: 25px;
		padding-left: 40px;
		text-decoration: none;
		background: #fff url(back.gif) no-repeat;
	}
	div#abgne_marquee ul li.b1 a {
		background-position: 5px 5px;
	}
	div#abgne_marquee ul li.b2 a {
		background-position: 5px -15px;
	}
	div#abgne_marquee ul li.b3 a {
		background-position: 5px -35px;
	}
</style>
<script type="text/javascript">
	$(function(){
		// 先取得 div#abgne_marquee ul
		// 接著把 ul 中的 li 項目再重覆加入 ul 中(等於有兩組內容)
		// 再來取得 div#abgne_marquee 的高來決定每次跑馬燈移動的距離
		// 設定跑馬燈移動的速度及輪播的速度
		var $marqueeUl = $('div#abgne_marquee ul'),
			$marqueeli = $marqueeUl.append($marqueeUl.html()).children(),
			_height = $('div#abgne_marquee').height() * -1,
			scrollSpeed = 1000,
			timer,
			speed = 3000 + scrollSpeed;
		
		// 幫左邊 $marqueeli 加上 hover 事件
		// 當滑鼠移入時停止計時器；反之則啟動
		$marqueeli.hover(function(){
			clearTimeout(timer);
		}, function(){
			timer = setTimeout(showad, speed);
		});
		
		// 控制跑馬燈移動的處理函式
		function showad(){
			var _now = $marqueeUl.position().top / _height;
			_now = (_now + 1) % $marqueeli.length;
			
			// $marqueeUl 移動
			$marqueeUl.animate({
				top: _now * _height
			}, scrollSpeed, function(){
				// 如果已經移動到第二組時...則馬上把 top 設 0 來回到第一組
				// 藉此產生不間斷的輪播
				if(_now == $marqueeli.length / 2){
					$marqueeUl.css('top', 0);
				}
			});
			
			// 再啟動計時器
			timer = setTimeout(showad, speed);
		}
		
		// 啟動計時器
		timer = setTimeout(showad, speed);

		$('a').focus(function(){
			this.blur();
		});
		
		
		$('#t').css('color', 'green');
		
//==============================================================================================
		$("#track").click(function() {   //新增追蹤				
			var b_id = "${bean.b_id}";
			var mid = "${loginOK.mid}";	
			$.get("bountyTrack.controller",{"b_id":b_id,"mid":mid}, function(data) {			
				alert(data);
			});
			//${loginOK.mid}
			//${bean.b_id}
			//傳送到servlet(/bountyTrack.controller)進行資料新增
			//新增成功後在畫面顯示成功訊息		
		});
	});
</script>
<style type="text/css">
#column1 {
position:absolute;
border: 1px solid #ccc;
width:300px;
left:50px;
top:100px;
padding:10px;
}
#column2 {
position:absolute;
left:380px;
width:400px;
height:80px;
top:100px;
border: 1px solid #ccc;
padding-top:85px;
padding-left:30px;
padding-right:430px;padding-bottom:40px;
}
#column3 {
position:absolute;
width:500px;
left:380px;
top:345px;
border: 1px solid #ccc;
padding:50px;
overflow:auto;

}
#column4 {
position:absolute;
left:1000px;
top:345px;
border: 1px solid #ccc;
width:200px;
padding-top:30px;
padding-left:30px;
padding-right:20px;
}
#column5 {

border: 1px solid #ccc;
padding:50px;
width:500px;
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
		<img width="300px" src="/bountyImgs/${bean.b_attach_pic.substring(bean.b_attach_pic.lastIndexOf("/")+1)}"/>
		<br>
	
		<br>
		<br>
		投稿期間:  ${bean.b_startdate.toString().substring(0,10)}  至   ${bean.b_enddate.toString().substring(0,10)} </br>
		<br>
		得獎公佈日期:   ${bean.b_announced.toString().substring(0,10)}
		<br>
		<br>
		總獎金:${bean.b_bonus_total}
		</br>
		最高獎金:${bean.b_bonus_max}  
		</br>	
		</br>
		<input id="track" type="button" value="追蹤"/><input type="button" value="參加"/>
		</br>
		</br>
		</br>
		主辦單位:${bean.b_organizer}  
		</br>
		</br>
		</br>
		
		<div id="fileDownload">
			<c:url var="link" value="FileDownServlet">
				<c:param name="fileId" value="${bean.b_attach_pdf.substring(bean.b_attach_pdf.lastIndexOf('/')+1)}"></c:param>
			</c:url>
			<a href="${link}">附件下載</a>
		</div>
		
		</div>
		<div id="column2">
			${bean.b_title}</br>
		<br>
		標籤:
		<c:forEach var="tag" items="${tags}">
			${tag.b_tag}
		</c:forEach>
		<br>
		<pre>瀏覽數:${bean.b_click}  收藏數:${trackcount}  留言數:   </pre> 
		</div>
<%-- 		徵稿會員編號:${bean.mid} 徵稿編號:${bean.b_id}  登入會員編號:${loginOK.mid}  --%>
<%-- 		<div id="b_id" style="display:none">${bean.b_id}</div> --%>
<%-- 		<div id="loginOK" style="display:none">${loginOK.mid}</div> --%>
		<div id="column3">
			<div>活動詳情<br>
			    ${bean.b_content} 
			</div>
			<br>
			<div>參加辦法<br>
			     ${bean.b_partimethod} 
			</div>
			
			
			
<!-- 		wang -->
			<form action="<c:url value="/message.controller"/>" method="post">

			<c:if test="${not empty select}">
				<table cellspacing="0" align="center" border="1">
					<caption>所有留言信息</caption>
					<thead>
						<tr>
							<th>留言人姓名</th>
							<th>留言时间</th>
							<th>留言内容</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="row" items="${select}">
							<tr>

								<td>${row.member.name}</td>
								<td>${row.msg.b_msgdate}</td>
								<td>${row.msg.b_msgcontent}</td>
								<td><input type="hidden" value="${row.msg.b_msgid}">
									<c:if test="${loginOK.mid == row.msg.mid}">
										<input type="submit" name="prodaction" value="Delete" />
									</c:if></td>
								<td><input type="hidden" value="${row.msg.b_msgid}">
									<c:if test="${loginOK.mid == row.msg.mid}">
										<input type="button" value="Updatemsg" />
									</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<span style="font-weight: bold; margin-left: 30%; color: red">${error.deletex}</span>
			</c:if>
			<br> <br> <br>
			<table align="center" border="1">
				<caption>填寫留言訊息</caption>

				<tr>
					<td>留言內容</td>
					<td><textarea name="message" rows="5" cols="35"></textarea></td>
					<td>${error.message}</td>
				</tr>
			</table>
			<input style="margin-left: 25%" type="submit" name="prodaction"
				value="Insert" /> <input type="reset" value="重置" /> <input
				type="hidden" name="cmsgid"> <input type="hidden"
				name="bid">
		</form>
		<h3>
			<span class="error">${errors.action}</span>
		</h3>
<!-- 		wang -->	
		</div>
		
		
	<div id="column4">
		獲選活動
		<br>
		<div id="abgne_marquee">
		<ul>
			<li class="b1"><a href="http://www.flycan.com.tw/course/course_javascript.php"><img height="100px" src="img/1.jpg"></a></li>
			<li class="b2"><a href="http://www.flycan.com.tw/course/course_photopro.php"><img height="100px" src="img/2.png"></a></li>
			<li class="b3"><a href="http://abgne.tw/site-proclamation/questionnaire-1.html"><img height="100px" src="img/3.jpg"></a></li>
		</ul>
	</div>
		<br><br><br>
		相似的活動
		<div id="similar">
		<ul>
			<li class="b1"><a href="http://www.flycan.com.tw/course/course_javascript.php"><img height="100px" src="img/3.jpg"></a></li>
			<li class="b2"><a href="http://www.flycan.com.tw/course/course_photopro.php"><img height="100px" src="img/4.jpg"></a></li>
			<li class="b3"><a href="http://abgne.tw/site-proclamation/questionnaire-1.html"><img height="100px" src="img/5.png"></a></li>
			<li class="b3"><a href="http://abgne.tw/site-proclamation/questionnaire-1.html"><img height="100px" src="img/1.jpg"></a></li>
		</ul>
		<br>
		</div>
		
		
	<script src="js/jquery-3.2.1.min.js" ></script>
	<script>
		$(document).ready(function() {				
			var isAttach = "${bean.b_attach_pdf}"
			if(isAttach != "C:/Artfolio/BountyAttchs/"){
				$('#fileDownload').show();
			}else{
				$('#fileDownload').hide();
			}		
		});
	</script>
	
	
	
	<script>
		
			var bid ="${bean.b_id}";
			$('input[name=bid]').val(bid);
			$('input[value=Delete]').click(function(){
				$('input[name=cmsgid]').val($(this).prev('input').val());
			});
			
			$('input[value=Updatemsg]').click(function(e){
				$('input[name=cmsgid]').val($(this).prev('input').val());
				$('input[value=Insert]').val('Update');
				var t=$(this).parent('td').parent('tr').children('td:nth-child(3)').text();
				$('textarea[name=message]').val(t);			
			});
			
// 			$('input[value=Insert]').click(function(){
// 				$('input[name=bid]').val(bid);
// 			});
		</script>
		<script> 
$(function(){ 
var $table = $('table:first'); 
var currentPage = 0;//当前页默认值为0 
var pageSize = 3;//每一页显示的数目 
$table.bind('paging',function(){ 
$table.find('tbody tr').hide().slice(currentPage*pageSize,(currentPage+1)*pageSize).show(); 
}); 
var sumRows = $table.find('tbody tr').length; 
var sumPages = Math.ceil(sumRows/pageSize);//总页数 

var $pager = $('<div class="page" style="margin-left: 45%"></div>'); //新建div，放入a标签,显示底部分页码 
for(var pageIndex = 0 ; pageIndex<sumPages ; pageIndex++){ 
$('<a href="#" rel="external nofollow" id="pageStyle" onclick="changCss(this)"><span>'+(pageIndex+1)+'</span></a>').bind("click",{"newPage":pageIndex},function(event){ 
currentPage = event.data["newPage"]; 
$table.trigger("paging"); 
//触发分页函数 
}).appendTo($pager); 
$pager.append(" "); 
} 
$pager.insertAfter($table); 
$table.trigger("paging"); 

//默认第一页的a标签效果 
var $pagess = $('#pageStyle'); 
$pagess[0].style.backgroundColor="#006B00"; 
$pagess[0].style.color="#ffffff"; 
}); 

//a链接点击变色，再点其他回复原色 
function changCss(obj){ 
var arr = document.getElementsByTagName("a"); 
for(var i=0;i<arr.length;i++){ 
if(obj==arr[i]){ //当前页样式 
obj.style.backgroundColor="#006B00"; 
obj.style.color="#ffffff"; 
} 
else 
{ 
arr[i].style.color=""; 
arr[i].style.backgroundColor=""; 
} 
} 
} 
</script>
	
		
</body>
</html>