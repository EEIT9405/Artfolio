<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Artfolio活動徵稿--活動更新</title>

<!-- Bootstrap Core CSS -->
<link href="/Artfolio/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/Artfolio/css/modern-business.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/Artfolio/font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" type="text/css" media="screen"
	href="/Artfolio/css/bootstrap-datetimepicker.min.css">
<link href="/Artfolio/css/fileinput.min.css" rel="stylesheet">

<style type="text/css">
body {
	margin: 0;
	font-family: "微軟正黑體", Helvetica, Arial, sans-serif;
	font-size: 14px;
	line-height: 20px;
/* 	background-color: #ffffff; */
/* 	background-image: url('/Artfolio/webbackground/26.jpg'); */
/* 	-moz-background-size: cover; */
/* 	-webkit-background-size: cover; */
/* 	-o-background-size: cover; */
/* 	background-size: cover;	 */
}
.img-responsive {
	width: 300px;
}
.t1 {
	border-style: solid;
	border-width: 3px;
	border-radius: 10px;
}
.row{
	margin-top:10px;
	margin-left: 0px;
	margin-right: 0px;
	padding:0;
}

#header {
	padding-top:50px;
	margin:0;
    max-width:100%;
    max-height:auto;
/*     border-bottom:1px solid black */
}
.navbar {
	margin-bottom:0;
}
.breadcrumb {
margin-bottom:0;
background-color:#E6E6E6;
/* border-bottom:1px solid black; */
color:#F3F781;
font-weight:bolder;
text-align:center;
}
h2{
padding-top:60px;
}
.col-md-2{
	text-align:right;
	height:183px;
	padding:0;
	padding-right:30px;
}
.col-md-4{
	padding:0;
}
.col-md-6{
	padding:0;
	height:183px;
	padding-left:10px;
}
.div panel-heading{
	background-color:#F3F781
}
p{
	margin:0
}
</style>
</head>

<body background="/Artfolio/webbackground/vintage-leaves.png">
		<jsp:include page="../top/header.jsp"></jsp:include>
		<header  style="margin-top:10px;">
				<div class="row"></div>
			<ol class="breadcrumb">
				<li class="active"><a
					href="<c:url value="/bounty/bountyDisplay.jsp"/>">所有活動</a></li>
				<li class="active"><a
					href="<c:url value="/bounty/bountyTrackPage.jsp"/>">活動追蹤</a></li>
				<li class="active"><a
					href="<c:url value="/bounty/bountyPersonal.jsp"/>">活動管理</a></li>
				<li class="active"><a
					href="<c:url value="/bounty/bountyUpload.jsp"/>">舉辦活動</a></li>
			</ol>
		
		</header>

	<!-- /.container -->
	<!-- Page Content -->
	<div class="container">
		
		<!-- Content Row -->
		<div class="row">
			<div class="col-lg-12" >
				<form class="well form-horizontal" action="personal.controller" method="POST" enctype="multipart/form-data" 
					id="contact_form">
					<fieldset>
						<!-- text 1 -->
						<div class="form-group">
							<label class="col-md-4 control-label">主題</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-screenshot"></i></span> <input
										name="topic" placeholder="topic" value="${change.b_title}" class="form-control"
										type="text">
								</div>
								<div>${err.topic}</div>
							</div>
						</div>
						<!-- text 2 -->
						<div class="form-group">
							<label class="col-md-4 control-label">標籤</label>
							<div class="col-md-4 inputGroupContainer">
								<ul class="list-inline">
									<li class="list"><input type="checkbox"
									value="設計" name="tag">設計</li>
									<li class="list"><input type="checkbox"
									value="攝影" name="tag">攝影  </li>
									<li class="list"><input type="checkbox"
									value="企劃" name="tag">企劃 </li>
									<li class="list"><input type="checkbox"
									value="實習生徵求" name="tag">實習生徵求 </li>
									<li class="list"><input type="checkbox"
									value="其他" name="tag">其他 </li>
								</ul>
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-tags"></i></span> <input id="tag" name="tag"
										placeholder="tag" class="form-control" type="text"> <span
										class="input-group-btn"><button id="button" class="btn btn-default"
											type="button">新增</button> </span>
								</div>	
									<div id="newTag"></div>
									<div id="tagInfo"></div>							
							</div>
						</div>														
						
						<!-- text 3 -->
						<div class="form-group">
							<label class="col-md-4 control-label">開始日期</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-time"></i></span> <input name="startdate"
										placeholder="startdate" class="form-control" id="datetimepicker" value="${change.b_startdate}"
										type="text">
								</div>
								<div>${err.start}</div>
							</div>
						</div>
						<!-- text 4 -->
						<div class="form-group">
							<label class="col-md-4 control-label">截止日期</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-time"></i></span> <input name="enddate"
										placeholder="enddate" class="form-control" id="datetimepicker1" value="${change.b_enddate}"
										type="text">
								</div>
								<div>${err.end}</div>
							</div>
						</div>
						<!-- text 5 -->
						<div class="form-group">
							<label class="col-md-4 control-label">公布得獎日期</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-time"></i></span> <input name="announced"
										placeholder="date" class="form-control" id="datetimepicker2" value="${change.b_announced}"
										type="text">
								</div>
								<div>${err.anno}</div>
							</div>
						</div>
						<!-- text 6 -->
						<div class="form-group">
							<label class="col-md-4 control-label">總獎金</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-usd"></i></span> <input name="totalbonus" value="${change.b_bonus_total}"
										placeholder="totalbonus" class="form-control" type="text">
								</div>
								<div>${err.totalbonus}</div>
							</div>
						</div>								
						<!-- text 7 -->
						<div class="form-group">
							<label class="col-md-4 control-label">最高獎金</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-usd"></i></span> <input name="maxbonus" value="${change.b_bonus_max}"
										placeholder="maxbonus" class="form-control" type="text">
								</div>
								<div>${err.maxbonus}</div>
							</div>
						</div>
						<!-- text 8 -->
						<div class="form-group">
							<label class="col-md-4 control-label">主辦單位</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input name="organizer" value="${change.b_organizer}"
										placeholder="organizer" class="form-control" type="text">
								</div>
								<div>${err.organizer}</div>
							</div>
						</div>
						<!-- textarea 1 -->
						<div class="form-group">
							<label class="col-md-4 control-label">活動詳情</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-pencil"></i></span>
									<textarea class="form-control" name="content" id="content"
										 rows="10" placeholder="content">${change.b_content}</textarea>
								</div>
								<div>${err.content}</div>
							</div>
						</div>

						<!-- textarea 2 -->
						<div class="form-group">
							<label class="col-md-4 control-label">參加辦法</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-pencil"></i></span>
									<textarea class="form-control" name="particimethod" id="particimethod"
										rows="10" placeholder="particimethod">${change.b_partimethod}</textarea>
								</div>
								<div>${err.aprti}</div>
							</div>
						</div>
						<!-- file 1  -->
						<div class="form-group">
							<label class="col-md-4 control-label">活動圖片</label>
							<div class="col-md-4 inputGroupContainer">
							
							<div class="file-preview-frame krajee-default  kv-preview-thumb"
								id="imgori" data-fileindex="0" data-template="image" style="display:inline">
								<div class="kv-file-content">
									<img
										src="/bountyImgs/${change.b_attach_pic.substring(change.b_attach_pic.lastIndexOf("/")+1)}" class="file-preview-image kv-preview-data rotate-1"
										title="" alt=""
										style="width: auto; height: 160px;">
								</div>
								<div class="file-thumbnail-footer">
									<div class="file-footer-caption" title="">
										${change.b_title}<br>
									</div>
									<div class="file-upload-indicator" title="Not uploaded yet">
										<i class="glyphicon glyphicon-hand-down text-warning"></i>
									</div>
									<div class="file-actions">
										<div class="file-footer-buttons">
											<button type="button"
												class="kv-file-zoom btn btn-xs btn-default"
												title="View Details">
												<i class="glyphicon glyphicon-zoom-in"></i>
											</button>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
									<input type="hidden" name="oriurl" value="C:/Artfolio/BountyImgs/${change.b_attach_pic.substring(change.b_attach_pic.lastIndexOf("/")+1)}"/>						
							
							
							
							
							
							
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-picture"></i></span> <input id="pic"
										name="pic" type="file" class="file" multiple data-show-upload="false">
								</div>
								<div>${err.attach}</div>
							</div>
						</div>
						<!-- file 2  -->
						<div class="form-group">
							<label class="col-md-4 control-label">檔案</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-folder-open"></i></span> <input
										id="file" name="file" type="file" class="file">
								</div>
								<div></div>
							</div>
						</div>

						<!-- submit   -->
						<div class="form-group">
							<label class="col-md-4 control-label"></label>
							<div class="col-md-2">
							<input id="submit" type="submit" class="btn btn-warning " name="action"  value="修改" />
							<input type="reset" class="btn btn-warning " value="復原"/>
							</div>
							<div class="col-md-4">
							<input type="button" class="btn btn-info" value="重置" />
							</div>
						</div>
						<div>${err.error}</div>
						<input type="hidden" name="bid"  value="${change.b_id}" >	
					</fieldset>
				</form>

			

			</div>
		</div>
		<!-- /.row -->
		<hr>

		<!-- Footer -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<p align="center">歡迎來到Artfolio</p>
				</div>
			</div>
		</footer>
	
	</div>

	<!-- /.container -->
	<!-- jQuery -->
	<script src="../js/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="../js/bootstrap.min�vp&DgV���d���}sک��Wr�d�`vWXk3�4�>Z�m������	���;|W��F��x�q��b�b��sq���ZM��u�Y�pz�6�p1&d<�%ܾYm�����<�~��R�m-9�L��k1?.N*���/�s�1�0��9�S�\Yy��9��u�>bu����a�i{pzoZ&��Oԓ{lFnKb�/�ke�1:W�q��r�/Ā�M�p7F���kb�Nn��������
�/y���#v$pui���0E\"�uQ�)�8rU�v!̒�>���uJ�-�$f}!�!-I�!�,TJ~'a]P�$9�Î��$YZ��AY`oRedP��u��-L�(jN�)q�n��D�4��1hj�J���=lzl�N(M�J�	�	xac.!,g�&�%:	��c�K'H�τyD7bx$���0��9��oo ��-͎���xq��qZ!x>����f�\p`N.���i:P~�=Q��}��r��qi`=B$�l�Y`�CJ�2�B�2��^/�i�#�VB��%�NCeLg��XS�ap�_yE���f����*�7m,{ş��pn��8�j&9�+�/�����L�tm�	��bAzK�T 0c#��-I��h�X�s�hNR��Ig�&�U;+~�ʎ���);Qo9a��� {Dqr�nv��h��69�E�nG�*-7ï�#�}���lC���V��u\��q�^��oT![��:�k
	�*?0{n@�����>�N s���^���bN�'�zz�(��)j @5gJEu+0�g��F(���J+gIyL���S|�x%}o'�k,P\���h�IōA�@(mQ����%�!BSx\ |lK�F UbnI>�A%2z�AJ�~m�<�7�	u��E��E�97�
�-MMfs �d5f`�n�a_qRe�f[':/}��w��5y	;-a���$o�*w�)�pN̬7|��$���^o�ջG"x��	�%b�a�i �P��6�>�(�f�|��fO}-$�:t�`�C��*!
(U
����HN#~�_b}g�4c&[p��,+��pm�E�$�eݍQJ9��?�KxȗGB���.�c*���#��^x���tɬ�`ߵ2�� 1>Q�&9�e}k�jnY$�g]��ѝ�A&�b�@Y{"k�Y�@+4��?�Ra\�U�m�]sqd]�3��e�8v6pk:�d�d��:wFb�c=dg1�C!Q ?���{9cjg �I��:γ	�/0��N�i�̾j�=<�<}��]�#t6%e�#�)e�q���oS�9�V�`-w�v�:��G�G-~� 1�9D�9�lf��D�"Zr,%)?GC���dU@]/k{ENI!��;	���
�*X�sL)o51ӗUA�v} g �Kpⱉ)f.�	IT*��	U:g& Im`��,{%r�㑌`A^�шxD`i�!��=w�d˷i:�O�1R�--�����q�7i;K,-J�m�,Gk�^��}��+�p���@3�h���1My�1�I$Uk'��k�C��o�=�'����D�-m�h���7lO@��5Vbt@�9,��
D��q�hi���n�ojx��RE�V�,1r.,�t��*	��%���
�]ƣV�$YmF��Zkt�v�c33^M	����������pI���Gv?��m#�/��l���C���2Cn�W���(?(k����������}�]mnfY��o�3T<��8����	�!;���}n�[E.8��j��\���fp'v��Yu#Q	�*%(o��b�wε��BD� �A�)�T�e
db�5pN�ܲ~;��*vLC�#39g�(yf;�7}g��I�Û�ot�	���+r�V4F�]��(dA��q���(%P�%c�oI_�<e( E[�ZD�oѨ%�3@-��M�||���[�6�"NoG��	�i�=�nE$s�[@
�`dehqq�c_En��M�g&n>p�|��Eu�mkg2)0�%#4aU|o~�sΧ)?0��2Ug����B�U2�"r��K,l?���0��lI��)��f����e��J�o��e%kr�c�*jI@�I'oŔs{' � 6�a*�%��{o�T5^=D�,k#��j[e��餧�t�ji!<	/Ga('�#.b $(�:)7໴��!i|�*]J�%z�z)oq�N��tQ~)#~-tab~