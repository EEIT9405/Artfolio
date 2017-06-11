<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div id='push'
		style="float: right; width: 300px; height: 600px; border-width: 3px; border-style: solid; border-color: #FFAC55; padding: 5px; border-width: 500; overflow: auto;">
		<p>
	</div>
	
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script type="text/javascript">
	var wsUri = "ws://localhost:8080/Artfolio/ws/echo";
	var webSocket = new WebSocket(wsUri);
	var count = 0;

	var messageArray = new Array();

	window.onunload = function() {
		console.log("onunload");
		if (messageArray.length != 0) {
			sessionStorage.setItem("work" , JSON.stringify(messageArray));
		}
	}

	window.onload = function() {
		console.log("onload");
		var data = JSON.parse(sessionStorage.getItem('work'));
		console.log("data=" + data);
		if(data){
			for(var i = 0 ; i < data.length ; i++){
				messageArray.push(data[i]);
				var p = data[i].picURL;
				var push = document.getElementById("push");
				var img = document.createElement("img");
				var hr = document.createElement("hr");
				img.setAttribute("src", p);
				img.setAttribute("width", "280");
				push.insertBefore(img, push.firstChild);
				push.insertBefore(hr, push.firstChild);
			}
		}
// 		localStorage.removeItem('work');
	}

	function onMessage(event) {
		var push = document.getElementById("push");
		var img = document.createElement("img");
		var hr = document.createElement("hr");
		var message = JSON.parse(event.data);
		messageArray.push(message);
		console.log("messageArray=" +JSON.stringify(messageArray));
		img.setAttribute("src", message.picurl);
		img.setAttribute("width", "280");
		push.insertBefore(img, push.firstChild);
		push.insertBefore(hr, push.firstChild);
// 		count += 1;
// 		if (count > 3) {
// 			push.removeChild(push.lastChild.previousSibling);
// 			push.removeChild(push.lastChild.previousSibling);
// 			count = 3;
// 		}
	}

	webSocket.onmessage = function(event) {
		onMessage(event);
	}
</script>
</body>
<!-- <script src="//cdn.kaazing.com/releases/enterprise.javascript.client/4.1.0/WebSocket.js"></script> -->
</html>