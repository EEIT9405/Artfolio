<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<link rel="stylesheet" href="/Artfolio/css/pushBar.css">
<style type="text/css">
  .pushbefore img {
  	width:170%;
  	position:absolute;
  	top:50%;
  	left:50%;
  	transform:translate(-50%, -50%);
  }
  
   .pushbefore {
   	display:block;
  	margin:0 auto;
	margin-top:15px;
	margin-right:10px;
  	width:200px;
  	height:0;
  	background-color:white;
  	position:relative;
  	transition:0.4s;
  	overflow:hidden;
  	cursor:pointer;
  	border:solid 1px white;
  	border-radius:2%;
  }
</style>
</head>
<a id="menu-toggle" href="#" class="btn btn-lg toggle"><i class="glyphicon glyphicon-th-list"></i></a>
<div id="sidebar-wrapper">
    <a id="menu-close" href="#" class="btn btn-lg toggle"><i class="glyphicon glyphicon-remove"></i></a>
    <div id='push' style="float: right; width: 243px; height: 87%; border-width: 2px; border-style: solid; border-color: silver; padding: 5px; overflow-y: auto;">
		
	</div>
</div>
<script>
	$(function(){
		var isOpen = sessionStorage.getItem('pushBarOpen');
		
		$("#menu-close").click(function(e) {
		    e.preventDefault();
		    $('#sidebar-wrapper').css('margin-right', '-245px');
		    sessionStorage.setItem("pushBarOpen" , 0);
		});

		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$('#sidebar-wrapper').css('margin-right', '0px');
			sessionStorage.setItem("pushBarOpen" , 1);
			
		});
		
		if(isOpen == 1){
			$('#sidebar-wrapper').css('margin-right', '0px');
			
		}else {
			$('#sidebar-wrapper').css('margin-right', '-245px');
		}
	});
</script>
<!-- <script src='js/pushBar.js'></script> -->
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script type="text/javascript">
	var wsUri = "wss://artfolio.ml:18443/Artfolio/ws/echo";
	var webSocket = new WebSocket(wsUri);

	var messageArray = new Array();
	var push = $('#push');
	
	window.onunload = function() {
		if (messageArray.length != 0) {
			sessionStorage.setItem("work" , JSON.stringify(messageArray));
		}
	}

	window.onload = function() {
		var data = JSON.parse(sessionStorage.getItem('work'));
		if(data){
			for(var i = 0 ; i < data.length ; i++){
				messageArray.push(data[i]);
				var p = data[i].picurl;
				var img = $('<img>');
				var widhidden = $('<input type="hidden" name="wid">');
				var frame = $('<div>');
				img.attr("src", p);
				console.log("wid="+data[i].wid);
				widhidden.val(data[i].wid);
				frame.addClass('pushbefore');
				frame.css('height',"200px");
				frame.append(img);
				frame.append(widhidden);
				push.prepend(frame);
			}
		}
		sessionStorage.removeItem('work');
	}

	function onMessage(event) {
		var img = $('<img>');
		var frame = $('<div>');
		var message = JSON.parse(event.data);
		var widhidden = $('<input type="hidden" name="wid">');
		messageArray.push(message);
		img.attr("src", message.picurl);
		widhidden.val(message.wid);
		frame.append(img);
		frame.append(widhidden);
		frame.addClass('pushbefore');
		push.prepend(frame);
		setTimeout(function(){frame.css('height', "200px");},100);
		//frame.addClass('pushafter');
		
	}
	
	webSocket.onmessage = function(event) {
		onMessage(event);
	}
	
	
</script>