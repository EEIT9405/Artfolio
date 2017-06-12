<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<!-- Custom CSS -->
<!-- <link href="css/modern-business.css" rel="stylesheet"> -->

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<style type="text/css">
.img-responsive {
	width: 400px;
	height: 200px;
}

.t1 {
	border-style: solid;
	border-width: 3px;
	border-radius: 10px;
}
</style>

</head>
<body>
<!-- Navigation -->
<jsp:include page="top/header.jsp"></jsp:include>
<section class="container-fluid new-picture">
  <div class="row">
    <div class="col-sm-0 col-md-2"></div>
    <div class="col-sm-12 col-md-8">
     <div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Artfolio<small>My portfolio</small></h1>

				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li class="active">我的作品集</li>

				</ol>

			</div>
		</div>
		<!-- /.row -->

		<!-- Project One -->
		<div class="tabbable">
			<!-- Only required for left/right tabs -->
			<ul class="nav nav-tabs">
				<li class="active"><a href="#tab1" data-toggle="tab">個人資訊</a></li>
				<li><a href="#tab2" data-toggle="tab">我的作品集</a></li>
				<li><a href="#tab3" data-toggle="tab">喜歡的作品</a></li>
				<li><a href="#tab4" data-toggle="tab">追蹤的作者</a></li>
			</ul>
			
					
			<div class="tab-content">
			
			 <!-- 第一格 -->
				<div class="tab-pane active" id="tab1">
					<form class="well form-horizontal" action=" " method="post"
					id="contact_form">
		
					<fieldset>
					<legend>個人資訊</legend>
					<div class="row"></div>
					<div class="col-md-6">
					
					<div class="form-group">
					<label class="col-md-4 control-label">名稱：</label>
					<label class="col-md-2  control-label" style="">aaaaaa</label>	
					</div>
					
					<div class="form-group">
					<label class="col-md-4 control-label">密碼：</label>
					<label class="col-md-2  control-label" style="">aaaaaa</label>	
					</div>
					
					<div class="form-group">
					<label class="col-md-4 control-label">信箱：</label>
					<label class="col-md-2  control-label" style="">aaaaaa</label>	
					</div>
					
					<div class="form-group">
					<label class="col-md-4 control-label">性別：</label>
					<label class="col-md-2  control-label" style="">aaaaaa</label>	
					</div>
					
					</div>
					
					
					<div class="col-md-6">
					
					<div class="form-group">
					<a href="portfolio-item.html"> <img
							class="img-responsive img-hover"
							src="http://placehold.it/700x300" alt="">
						</a>
					</div>
					
					<div class="form-group">
							<label class="col-md-4 control-label">我有話要說：</label>
							<div class="col-md-10 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-pencil"></i></span>
									<textarea class="form-control" name="content"
										placeholder="content"></textarea>
								</div>
							</div>
						</div>
					
					
					</div>
					
					<div class="form-group">
							<label class="col-md-4 control-label"></label>
							<div class="col-md-2">
							<input type="submit" class="btn btn-default " name="submit"  value="儲存" />
							</div>
					
					</div>
					</fieldset>
					</form>
				</div>
				
				 <!-- 第二格 -->
				<div class="tab-pane " id="tab2">
					<div class="col-md-12" style="overflow-y:scroll;height:400px;">
					
				<!--     row1 -->
				<div class="row" >
				
					<div class="col-md-3">
					 <!--假資料 -->
						<a href="portfolio-item.html"> <img
							class="img-responsive img-hover"
							src="http://placehold.it/700x300" alt="">
						</a>
					</div>
					<div class="col-md-3">
					 <!--假資料 -->
						<a href="portfolio-item.html"> <img
							class="img-responsive img-hover"
							src="http://placehold.it/700x300" alt="">
						</a>
					</div>
					<div class="col-md-3">
					 <!--假資料 -->
						<a href="portfolio-item.html"> <img
							class="img-responsive img-hover"
							src="http://placehold.it/700x300" alt="">
						</a>
					</div>
			       <div class="col-md-3">
			        <!--假資料 -->
						<a href="portfolio-item.html"> <img
							class="img-responsive img-hover"
							src="http://placehold.it/700x300" alt="">
						</a>
					</div>
				
				</div>


				<hr>

				<!--               row2 -->
				<div class="row">
			    
			    
			        <div class="col-md-3">
                      <!--假資料 -->
						<a href="portfolio-item.html"> <img
							class="img-responsive img-hover"
							src="http://placehold.it/700x300" alt="">
						</a>
					</div>
					
					<div class="col-md-3">
					
		
					</div>
					
					<div class="col-md-3">
					
		
					</div>
					<div class="col-md-3">
					
		
					</div>
					
				</div>
				<hr>
				<!--    row3 -->
				<div class="row" >
					<div class="col-md-3">
					 <!--假資料 -->
						<a href="portfolio-item.html"> <img
							class="img-responsive img-hover"
							src="http://placehold.it/700x300" alt="">
						</a>
					</div>
					
					<div class="col-md-3">
					
		
					</div>
					<div class="col-md-3">
					
		
					</div>
					<div class="col-md-3">
					
		
					</div>
					</div>
			</div>
				</div>
          <!-- 第三格 -->
				<div class="tab-pane" id="tab3">
						<div class="col-md-12" style="overflow-y:scroll;height:400px;">
					
				<!--     row1 -->
				<div class="row" >
				
					<div class="col-md-3">
					 <!--假資料 -->
						<a href="portfolio-item.html"> <img
							class="img-responsive img-hover"
							src="http://placehold.it/700x300" alt="">
						</a>
					</div>
					<div class="col-md-3">
					 <!--假資料 -->
						<a href="portfolio-item.html"> <img
							class="img-responsive img-hover"
							src="http://placehold.it/700x300" alt="">
						</a>
					</div>
					<div class="col-md-3">
					 <!--假資料 -->
						<a href="portfolio-item.html"> <img
							class="img-responsive img-hover"
							src="http://placehold.it/700x300" alt="">
						</a>
					</div>
			       <div class="col-md-3">
			        <!--假資料 -->
						<a href="portfolio-item.html"> <img
							class="img-responsive img-hover"
							src="http://placehold.it/700x300" alt="">
						</a>
					</div>
				
				</div>


				<hr>

				<!--               row2 -->
				<div class="row">
			    
			    
			        <div class="col-md-3">
                      <!--假資料 -->
						<a href="portfolio-item.html"> <img
							class="img-responsive img-hover"
							src="http://placehold.it/700x300" alt="">
						</a>
					</div>
					
					<div class="col-md-3">
					
		
					</div>
					
					<div class="col-md-3">
					
		
					</div>
					<div class="col-md-3">
					
		
					</div>
					
				</div>
				<hr>
				<!--    row3 -->
				<div class="row" >
					<div class="col-md-3">
					 <!--假資料 -->
						<a href="portfolio-item.html"> <img
							class="img-responsive img-hover"
							src="http://placehold.it/700x300" alt="">
						</a>
					</div>
					
					<div class="col-md-3">
					
		
					</div>
					<div class="col-md-3">
					
		
					</div>
					<div class="col-md-3">
					
		
					</div>
					</div>
				</div>
				</div>
				 <!-- 第四格 -->
				<div class="tab-pane" id="tab4">
					<p>喜愛的作者</p>
				<div class="col-md-12" style="overflow-y:scroll;height:400px;">
					
				<!--     row1 -->
				<div class="row" >
				
					<div class="col-md-3">
					 <!--假資料 -->
						<a href="portfolio-item.html"> <img
							class="img-responsive img-hover"
							src="http://placehold.it/700x300" alt="">
						</a>
						<h3 align="center">作者名字</h3>
						
					</div>
					<div class="col-md-3">
					 <!--假資料 -->
						<a href="portfolio-item.html"> <img
							class="img-responsive img-hover"
							src="http://placehold.it/700x300" alt="">
						</a>
						<h3 align="center">作者名字</h3>
					</div>
					<div class="col-md-3">
					 <!--假資料 -->
						<a href="portfolio-item.html"> <img
							class="img-responsive img-hover"
							src="http://placehold.it/700x300" alt="">
						</a>
						<h3 align="center">作者名字</h3>
					</div>
			       <div class="col-md-3">
			        <!--假資料 -->
						<a href="portfolio-item.html"> <img
							class="img-responsive img-hover"
							src="http://placehold.it/700x300" alt="">
						</a>
						<h3 align="center">作者名字</h3>
					</div>
				
				</div>
				
				
				
				</div>
				
				
			</div>
		</div>
      <div class="col-sm-0 col-md-2"></div>
    </div>
  </div>
  </div>
</section>
	<!-- /.container -->
<jsp:include page="top/footer.jsp"></jsp:include>

<!-- JS -->

<script type="text/javascript">
	$(function() {
		$('#hidden-list').collapse('show')
	});
	$(function() {
		$('#hidden-list2').collapse('show')
	});
	$(function() {
		$('#hidden-list3').collapse('show')
	});
</script>
</body>
</html>