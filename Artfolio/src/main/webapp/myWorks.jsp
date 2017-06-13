<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Space</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/modern-business.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<style type="text/css">
.img-box {
  overflow: hidden;
  width: 180px;
  height: 180px;
  margin-top: 12px;
  margin-bottom: 12px;
  position: relative;
  box-shadow: 0px 15px 50px -15px;
  cursor:pointer;
}
.img-box img {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
  width: 160%;
}

.btn-circle.btn-lg {
  width: 50px;
  height: 50px;
  padding: 10px 16px;
  font-size: 18px;
  line-height: 1.33;
  border-radius: 25px;
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
.editer {
	position:absolute;
	right:0;
}
</style>

</head>
<body>
<!-- Navigation -->
<jsp:include page="top/header.jsp"></jsp:include>
<div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">My folio
                    <small>my folio</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a>
                    </li>
                    <li class="active">我的作品</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
            <div class="col-md-2">
            	<div class="panel panel-default">
  					<div class="panel-body">
    					<div>
    						<img style="width:150px;" src="/img/designer-512.png">
    					</div>
  					</div>
				</div>

				<div class="panel panel-default">
				  <div class="panel-heading">
				    <h3 class="panel-title">導航</h3>
				  </div>
				  <div class="panel-body">
				  	<div class="dropdown">
					  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
					 	  排序
					    <span class="caret"></span>
					  </button>
					  <ul id="sortList" class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
					    <li class="sortbtn" role="presentation"><a role="menuitem" class="btn" tabindex="-1">依相簿</a></li>
					    <li role="presentation" class="divider"></li>
					    <li role="presentation" class="dropdown-header">依時間：</li>
					    <li class="sortbtn" role="presentation"><a role="menuitem" class="btn timeup" tabindex="-1">遞增</a></li>
					    <li class="sortbtn" role="presentation"><a role="menuitem" class="btn timedown" tabindex="-1">遞減</a></li>
					    <li role="presentation" class="divider"></li>
					    <li role="presentation" class="dropdown-header">依人氣：</li>
					    <li class="sortbtn" role="presentation"><a role="menuitem" class="btn likeup" tabindex="-1">遞增</a></li>
					    <li class="sortbtn" role="presentation"><a role="menuitem" class="btn likedown" tabindex="-1">遞減</a></li>
					  </ul>
					</div>
				  	<div style="margin-top:10px;">
				    	<a id="wupload" class="btn btn-primary">上傳</a>
				    	<a id="wedit" class="btn btn-default">編輯</a>
				    </div>
				  </div>
				</div>
            </div>
            
	<div id="photoContainer" class="col-md-10" style="overflow-y:auto; height:450px;">
         <!-- Projects Row -->
        <div class="row">
	        <div class="col-sm-12 col-md-3 padding-0">
	          <div class="img-box"><img src="http://bit.ly/2qYyyVS " alt=""/>
		          <div class="editer"></div>
	          </div>
	        </div>
	        <div class="col-sm-12 col-md-3 padding-0">
	          <div class="img-box"><img src="http://bit.ly/2qYyyVS " alt=""/>
	          	<div class="editer"></div>
	          </div>
	        </div>
	        <div class="col-sm-12 col-md-3 padding-0">
	          <div class="img-box"><img src="http://bit.ly/2qYyyVS " alt=""/>
	          	<div class="editer"></div>
	          </div>
	        </div>
	        <div class="col-sm-12 col-md-3 padding-0">
	          <div class="img-box"><img src="http://bit.ly/2qYyyVS " alt=""/>
	          	<div class="editer"></div>
	          </div>
	          <div><h3>ahah</h3></div>
	        </div>
        </div>
        <!-- /.row -->
        
	        <div class="col-sm-12 col-md-3 padding-0">
	          <div class="img-box"><img src="http://bit.ly/2qYyyVS " alt=""/>
		          <div class="editer"></div>
	          </div>
	        </div>
	        <div class="col-sm-12 col-md-3 padding-0">
	          <div class="img-box"><img src="http://bit.ly/2qYyyVS " alt=""/>
	          	<div class="editer"></div>
	          </div>
	        </div>
	        <div class="col-sm-12 col-md-3 padding-0">
	          <div class="img-box"><img src="http://bit.ly/2qYyyVS " alt=""/>
	          	<div class="editer"></div>
	          </div>
	        </div>
	        <div class="col-sm-12 col-md-3 padding-0">
	          <div class="img-box"><img src="http://bit.ly/2qYyyVS " alt=""/>
	          	<div class="editer"></div>
	          </div>
	        </div>

	        <div class="col-sm-12 col-md-3 padding-0">
	          <div class="img-box"><img src="http://bit.ly/2qYyyVS " alt=""/>
		          <div class="editer"></div>
	          </div>
	        </div>
	        <div class="col-sm-12 col-md-3 padding-0">
	          <div class="img-box"><img src="http://bit.ly/2qYyyVS " alt=""/>
	          	<div class="editer"></div>
	          </div>
	        </div>
	        <div class="col-sm-12 col-md-3 padding-0">
	          <div class="img-box"><img src="http://bit.ly/2qYyyVS " alt=""/>
	          	<div class="editer"></div>
	          </div>
	        </div>
	        <div class="col-sm-12 col-md-3 padding-0">
	          <div class="img-box"><img src="http://bit.ly/2qYyyVS " alt=""/>
	          	<div class="editer"></div>
	          	<div><h3>ahah</h3></div>
	          </div>
	          
	        </div>
        </div>
        <!-- /.row -->
	</div>
	
	
        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

</div>

<!-- /.container -->

<!-- JS -->
<script>
$(function(){
	var wedit = $('#wedit');
	var wupload = $('#wupload');
	var sortbtn = $('#sortList').children('li.sortbtn');
	var photoContainer = $('#photoContainer');
	
	listWork(1, "date", "descending");	
	//開啟編輯功能
	wedit.click(function(){
		var a1 = $('<a title="remove" class="btn btn-circle btn-danger glyphicon glyphicon-remove">');
		var a2 = $('<a title="edit" class="btn btn-circle btn-primary glyphicon glyphicon-pencil">');
		var editer = $('#photoContainer div.editer');
		if(wedit.text() == "編輯"){
			for(var i=0; i<editer.length; i++){
				editer.eq(i).empty();
				editer.eq(i).append(a1.clone());
				editer.eq(i).append(a2.clone());
			}
			wedit.text('取消');
		}else {
			for(var i=0; i<editer.length; i++){
				editer.eq(i).empty();
			}
			wedit.text('編輯');
		}
	});
	//刪除或編輯

	$('#photoContainer').on('click', 'div.editer a', function(){
		var btn = $(this);
		if(btn.attr('title') == "remove"){
			console.log("remove");
		}
		if(btn.attr('title') == "edit"){
			console.log("edit");
		}
	});
	
	//上傳
	wupload.click(function(){
		console.log("上傳");
	});
	
	sortbtn.click(function(){
		var sort = $(this).children('a');
		if(sort.hasClass('timeup')){
			listWork(1, "date", "ascending");	
		}
		if(sort.hasClass('timedown')){
			listWork(1, "date", "descending");	
		}
		if(sort.hasClass('likeup')){
			listWork(1, "like", "ascending");
		}
		if(sort.hasClass('likedown')){
			listWork(1, "like", "descending");
		}
	});
	
	function listWork(mid, orderby, order){
			photoContainer.empty();
		$.getJSON('searchByMid.controller', {mid:mid, orderby:orderby, order:order}, function(data){
			var row = $('<div class="row">');
			$.each(data, function(index, value){
				var col = $('<div class="col-sm-12 col-md-3 padding-0">');
				var imgbox = $('<div class="img-box">');
				var img = $('<img>');
				var edit = $('<div class="editer">');
				var photowid = $('<input name="wid" type="hidden">').val(value.wid);
				img.attr('src', value.picurl);
				imgbox.append(img);
				imgbox.append(edit);
				imgbox.append(photowid);
				col.append(imgbox);
				row.append(col);
			});
			photoContainer.append(row);
		});
	}
});
</script>
</body>
</html>