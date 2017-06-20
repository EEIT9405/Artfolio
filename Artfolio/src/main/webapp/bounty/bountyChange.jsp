<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Artfolioæ´»å‹•å¾µç¨¿--æ´»å‹•æ›´æ–°</title>

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
	font-family: "å¾®è»Ÿæ­£é»‘é«”", Helvetica, Arial, sans-serif;
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
					href="<c:url value="/bounty/bountyDisplay.jsp"/>">æ‰€æœ‰æ´»å‹•</a></li>
				<li class="active"><a
					href="<c:url value="/bounty/bountyTrackPage.jsp"/>">æ´»å‹•è¿½è¹¤</a></li>
				<li class="active"><a
					href="<c:url value="/bounty/bountyPersonal.jsp"/>">æ´»å‹•ç®¡ç†</a></li>
				<li class="active"><a
					href="<c:url value="/bounty/bountyUpload.jsp"/>">èˆ‰è¾¦æ´»å‹•</a></li>
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
							<label class="col-md-4 control-label">ä¸»é¡Œ</label>
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
							<label class="col-md-4 control-label">æ¨™ç±¤</label>
							<div class="col-md-4 inputGroupContainer">
								<ul class="list-inline">
									<li class="list"><input type="checkbox"
									value="è¨­è¨ˆ" name="tag">è¨­è¨ˆ</li>
									<li class="list"><input type="checkbox"
									value="æ”å½±" name="tag">æ”å½±  </li>
									<li class="list"><input type="checkbox"
									value="ä¼åŠƒ" name="tag">ä¼åŠƒ </li>
									<li class="list"><input type="checkbox"
									value="å¯¦ç¿’ç”Ÿå¾µæ±‚" name="tag">å¯¦ç¿’ç”Ÿå¾µæ±‚ </li>
									<li class="list"><input type="checkbox"
									value="å…¶ä»–" name="tag">å…¶ä»– </li>
								</ul>
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-tags"></i></span> <input id="tag" name="tag"
										placeholder="tag" class="form-control" type="text"> <span
										class="input-group-btn"><button id="button" class="btn btn-default"
											type="button">æ–°å¢</button> </span>
								</div>	
									<div id="newTag"></div>
									<div id="tagInfo"></div>							
							</div>
						</div>														
						
						<!-- text 3 -->
						<div class="form-group">
							<label class="col-md-4 control-label">é–‹å§‹æ—¥æœŸ</label>
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
							<label class="col-md-4 control-label">æˆªæ­¢æ—¥æœŸ</label>
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
							<label class="col-md-4 control-label">å…¬å¸ƒå¾—çæ—¥æœŸ</label>
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
							<label class="col-md-4 control-label">ç¸½çé‡‘</label>
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
							<label class="col-md-4 control-label">æœ€é«˜çé‡‘</label>
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
							<label class="col-md-4 control-label">ä¸»è¾¦å–®ä½</label>
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
							<label class="col-md-4 control-label">æ´»å‹•è©³æƒ…</label>
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
							<label class="col-md-4 control-label">åƒåŠ è¾¦æ³•</label>
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
							<label class="col-md-4 control-label">æ´»å‹•åœ–ç‰‡</label>
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
							<label class="col-md-4 control-label">æª”æ¡ˆ</label>
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
							<input id="submit" type="submit" class="btn btn-warning " name="action"  value="ä¿®æ”¹" />
							<input type="reset" class="btn btn-warning " value="å¾©åŸ"/>
							</div>
							<div class="col-md-4">
							<input type="button" class="btn btn-info" value="é‡ç½®" />
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
					<p align="center">æ­¡è¿ä¾†åˆ°Artfolio</p>
				</div>
			</div>
		</footer>
	
	</div>

	<!-- /.container -->
	<!-- jQuery -->
	<script src="../js/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="../js/bootstrap.min•vp&DgVàù¢dÊÁ¬}sÚ©ŞìWrßdµ`vWXk34ê­>Zåmµçí¤®ß	Ï¾ò;|W±‰Fóàx­q¨„bñböªsqİöïZMûöuƒYÒpzÖ6êp1&d<¿%Ü¾Ym‡×ûš°<é~ùµR—m-9øLÓĞk1?.N*ÿù¿/és‡1À0¯€9˜Sã\Yyøä9ıôu×>buüæõßa–i{pzoZ&âøOÔ“{lFnKbú/¾ke‘1:WæqÌğrÉ/Ä€êMëp7Fø©§kbğNn™Áëô¯âÆœ
/yøèó¡#v$puiïİ×0E\"ñuQ¾)¹8rUŒv!Ì’¹>º¿uJ·-¨$f}!®!-IÑ!æ,TJ~'a]PŒ$9»Ãù‚$YZÌAY`oRedPÍ€u¶ì-L¶(jNî¸)qón‹ÒDâ4­ 1hjâJëùÄ=lzl£N(MÎJ®		xac.!,gï&ø%:	ãğcK'H©Ï„yD7bx$±í±õ0é§ë9øèoo ğç-Í ¢ıxq—¥qZ!x>œ™ÊÍfŒ\p`N.™ôüi:P~—=Qˆ¤}“ñ—r™·qi`=B$àläY`£CJÿ2¶B2Ä¥^/éi#±VB¶è%æNCeLg÷ˆXSòapí§¸_yE…êïfË®İ*”7m,{ÅŸœõpn÷Æ8¢j&9Ä+Ü/êü¸İßLÊtm„	ışbAzKÔT 0c#¿‡-I¢ÉhÉXñ¨s÷hNRóÅIgæ&àU;+~¯ÊŸ¶Ô);Qo9a·‡´ {Dqr´nvããhö°69æEènG¸*-7Ã¯Ã#}ßúëlCÄÎ½V¬Øu\õêqô^®¯oT![‰ä:Æk
	ì*?0{n@çÇâèé>‰N s÷ˆ®^ÉÚĞbNí'¶zzê(›ê¢)j @5gJEu+0¯gç‡ÛF(äÌˆJ+gIyL—S|¦x%}o'§k,P\í·‰häIÅA†@(mQ‰‰¡%Œ!BSx\ |lKF UbnI>êA%2z´AJÁ~m¡<²7â	u­¾EÌ®Eœ97–
¯-MMfs äd5f`ên²a_qReòf[':/}õüwæå5y	;-a‹µÈ$oÁ*wø)ápNÌ¬7|‡ƒ$‰£Æ^oáÕ»G"x“ÿ	°%bıaài îP®Ë6‚>‰(ƒfó|û½fO}-$:tò`C„—*!
(U
€ÊéÜHN#~_b}gÅ4c&[p¾É,+§Úpm˜Eü$”eİQJ9®š?äKxÈ—GBó¹µã®.¦c*†¢#İà^x§ÏØtÉ¬÷`ßµ2øî 1>QÕ&9êe}k‡jnY$…g]¸ìŠÑûA&˜bÿ@Y{"kY‹@+4¦¼?áRa\ÜU×mí´]sqd]¼3ú÷e²8v6pk:¦dÑdôÛ:wFbÛc=dg1µC!Q ?öæó{9cjg ®I¿ğ:Î³	¥/0 æNÃiµÌ¾jø=<Å<}Ìü]é#t6%e¨#–)e„q¯¶†oSÿ9V`-wvš:™ÿGÔG-~¤ 1®9D9­lfğûD—"Zr,%)?GCÊİÆdU@]/k{ENI!ñŞ;	á®ÿµ
ñ*XêsL)o51Ó—UAúv} g £Kpâ±‰)f.ç	IT*€â	U:g& Im`¯œ,{%ràã‘Œ`A^¢ÑˆxD`i÷!®=w£dË·i:™Oï1Rî--¥¤²·˜q½7i;K,-J½m¤,Gk¢^’¾}Şı+½pöÒå@3”h¾ù£1My»1šI$Uk' äk Cí÷o°=’'„Ÿ¥óD­-mÃhñºêé7lO@åÉ5Vbt@„9,õè
DÅÔqêhiõÑönŒojxœÏRE¿VÌ,1r.,ótªî*	»Ô%ÂÙÖ
›]Æ£VÌ$YmFÅéZktÅvÛc33^M	ªÅÙÃéÒæàâøpIÎóüGv?À÷m#ä/§Šl›‰“C¨†ñ2Cn¯Wœš¶(?(kúèô«§Œè÷°¢}ö]mnfY¸ªo¶3T<‡‹8šê	ì!;ìÊı}ní[E.8ö´jáä\³ºëfp'v¨ÚYu#Q	ò*%(ošîbãwÎµ©¶BD ıAç)®Tée
dbµ5pN¯Ü²~;¡¢*vLC°#39g¯(yf;7}gØÈIÃ›‘ot­	®ºê+rŒV4Fí]¶ª(dAÏéqĞíæ(%Pœ%c½oI_Š<e( E[¯ZDñoÑ¨%¸3@-¡¸Mâ||¡¼â[¥6Œ"NoG¢	éiş=ínE$s„[@
ç`dehqq³c_EnğÆMÿg&n>pô|°£Eu˜mkg2)0«%#4aU|o~çsÎ§)?0…Ë2Ug¯¿‡ÇBëU2Ö"r£æK,l?Íıáº0ö¢lI¾¸)¬ñfÌÀúñeæµáJÄo´áe%krôc®*jI@¾I'oÅ”s{' à 6öa*é%Œÿ{oãT5^=D›,k#‹‰j[eÈ¨é¤§ºt—ji!<	/Ga('²#.b $(â:)7à»´¯™!i|±*]JÜ%zˆz)oqñN‡ÁtQ~)#~-tab~