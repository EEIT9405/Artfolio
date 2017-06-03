<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活動徵稿專區</title>
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
	});
</script>
</head>
<body>

<h3>ArtFolio活動專區</h3>

		<a href="<c:url value="/bountyIndex.jsp"/>">活動首頁</a> | <a href="<c:url value="/bountyDisplayJson.controller"/>">所有活動</a> | <a href="<c:url value="/bountyUpload.jsp"/>">舉辦活動</a>  | <a href="">活動追蹤</a>
		| <a href="">個人活動管理</a> | <a href="">回作品集</a>
		
		<hr>
		得獎活動
		<div id="abgne_marquee">
		<ul>
			<li class="b1"><a href="http://www.flycan.com.tw/course/course_javascript.php"><img height="100px" src="img/1.jpg"></a></li>
			<li class="b2"><a href="http://www.flycan.com.tw/course/course_photopro.php"><img height="100px" src="img/2.png"></a></li>
			<li class="b3"><a href="http://abgne.tw/site-proclamation/questionnaire-1.html"><img height="100px" src="img/3.jpg"></a></li>
		</ul>
	</div>

</body>
</html>