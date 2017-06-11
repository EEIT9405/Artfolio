<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>UploadIndex</title>
<style type="text/css">
#dropDIV {
	text-align: right; width = 300;
	height: 200px;
	margin: auto;
	border: dashed 2px gray;
}

#displayDIV {
	text-align: right; width = 300;
	height: 200px;
	margin: auto;
	border: dashed 2px gray;
}

/* 讓圖片自動適應div大小 */
#div img {
	max-width: 400x;
	myimg: expression(onload = function(){   
this.style.width=(this.offsetWidth> 400)?"400px":"auto"
}
);
}
</style>

<script type="text/javascript">

</script>
</head>
<body>
	<table>
		<tr>
			<td>
				<table align=left width=500>
					<tr>
						<td>單個檔案上傳</td>
						<td><form action="/Artfolio/Upload/saveupload.controller" method="post"
								enctype="multipart/form-data">
								<input type="file" name="file" /> <input type="submit"
									value="Submit" />
							</form></td>
					</tr>
				</table>
			</td>
			<td rowspan="2" width=400 align=left valign="top">
				<div id="displayDIV">
					<c:choose>
						<c:when test="${not empty fileUrl}">
							<img alt="" src="${fileUrl }" />					
						</c:when>	
						<c:otherwise>													
							<img alt="" src="${param.picurl }" />
						</c:otherwise>
					</c:choose>
				</div>
			</td>
		</tr>
		<tr>
			<td><form action="<c:url value="/Upload/tbwork.controller" />"
					method="post">
					<table border=1 align=left width=400>
						<tr>
							<td colspan="4">* 號為必填欄位</td>
						</tr>

						<tr style="display: none;">
							<td width=40>*</td>
							<td>圖片流水號：</td>
							<td><input name="wid" value="${wid}"></td>
						</tr>
						<tr>
							<td width=40>*</td>
							<td>作品名稱：</td>
							<td><input type="text" name="wtitle" value="${param.wtitle}"></td>
						</tr>
						<tr>
							<td width=40></td>
							<td>作品描述：</td>
							<td><input type="text" name="winfo" value="${param.winfo}"></td>
						</tr>
						<tr>
							<td width=40></td>
							<td>新增作品冊：</td>
							<td>null</td>
						</tr>
						<tr>
							<td width=40></td>
							<td>選擇現有作品冊</td>
							<td><input type="text" name="aid" id="aid" onkeyup="doBlur();"></td>
						</tr>
						<tr>
							<td width=40></td>
							<td>留言開關</td>
							<td>
								<c:choose>
									<c:when test="${param.iswmsg}">
										<input id="iswmsg1" type="radio" name="iswmsg" value="true"	checked="checked" />開啟
										<input id="iswmsg2" type="radio" name="iswmsg" value="false" />關閉
									</c:when>
									<c:when test="${param.iswmsg ne true && not empty wid}" >
										<input id="iswmsg1" type="radio" name="iswmsg" value="true" />開啟
										<input id="iswmsg2" type="radio" name="iswmsg" value="false" checked="checked" />關閉
									</c:when>
									<c:otherwise>
										<input id="iswmsg1" type="radio" name="iswmsg" value="true" checked="checked" />開啟
										<input id="iswmsg2" type="radio" name="iswmsg" value="false" />關閉
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td width=40></td>
							<td>評分開關</td>
							<td>
								<c:choose>
									<c:when test="${param.iswmsg}">
										<input id="isscore1" type="radio" name="isscore" value="true"	checked="checked" />開啟
										<input id="isscore2" type="radio" name="isscore" value="false" />關閉
									</c:when>
									<c:when test="${param.isscore ne true && not empty wid}" >
										<input id="isscore1" type="radio" name="isscore" value="true" />開啟
										<input id="isscore2" type="radio" name="isscore" value="false" checked="checked" />關閉
									</c:when>
									<c:otherwise>
										<input id="isscore1" type="radio" name="isscore" value="true" checked="checked" />開啟
										<input id="isscore2" type="radio" name="isscore" value="false" />關閉
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td width=40></td>
							<td>評分項目1</td>
							<td><input type="text" name="score_1"
								value="${param.score_1}"></td>
						</tr>
						<tr>
							<td width=40></td>
							<td>評分項目2</td>
							<td><input type="text" name="score_2"
								value="${param.score_2}"></td>
						</tr>
						<tr>
							<td width=40></td>
							<td>評分項目3</td>
							<td><input type="text" name="score_3"
								value="${param.score_3}"></td>
						</tr>
						<tr>
							<td width=40></td>
							<td>評分項目4</td>
							<td><input type="text" name="score_4"
								value="${param.score_4}"></td>
						</tr>
						<tr>
							<td width=40></td>
							<td>評分項目5</td>
							<td><input type="text" name="score_5"
								value="${param.score_5}"></td>
						</tr>
						<tr>
							<td width=40></td>
							<td>是否公開顯示此圖片</td>
							<td>
								<c:choose>
									<c:when test="${Displaywend}">
										<input id="wend1" type="radio" name="wend" value="true"	checked="checked" />開啟
										<input id="wend2" type="radio" name="wend" value="false" />關閉
									</c:when>
									<c:when test="${Displaywend ne true && not empty wid}" >
										<input id="wend1" type="radio" name="wend" value="true" />開啟
										<input id="wend2" type="radio" name="wend" value="false" checked="checked" />關閉
									</c:when>
									<c:otherwise>
										<input id="wend1" type="radio" name="wend" value="true" checked="checked" />開啟
										<input id="wend2" type="radio" name="wend" value="false" />關閉
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr style="display: none;">
							<td width=40></td>
							<td>圖片URL</td>
							<td><input name="picurl" value="${fileUrl}"></td>
						</tr>
						<tr>
							<td colspan="3">
								<input type="submit" name="tbaction" value="上傳">
								<input type="submit" name="tbaction" value="取消上傳">
								<input type="button" value="清除" onclick="clearForm()">
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>

	<h3>
		<span class="error">${errors.action}</span>
	</h3>
	<script type="text/javascript">
	
	var contextPath = "${pageContext.request.contextPath}";
	var request = null;
	
	function sendGetRequest(id, path) {
		request = new XMLHttpRequest();
		request.onreadystatechange=callback;
		request.open("GET", path+"?action="+action+"&aid="+aid+"&dummy="+new Date().getTime());
		request.send(null);
	}
	
	function doBlur() {
		var aid = document.getElementById("aid").value;
	 	sendGetRequest(aid, contextPath+"/Upload/AjaxTest");
	}
	
	var action = "textJson";
	function callback() {
		if(request.readyState==4) {
			if(request.status==200) {
				processText(request.responseText);
// 				processXML(request.responseXML);
// 				processJSON(request.responseText);
				
// 				document.getElementById("aid").value;
			} else {
				alert("Error:"+request.status);
			}
		}
	}

	/* 自己寫HttpRequest */
	/*  	function showData(value){   */
	/* 	xmlH */
	/* 		$.ajax({ */
	/* 		    url : "/js/AjaxTest?name="+value, */
	/* 		    type : "POST", */
	/* 		    async : false, */
	/* 		    success : function(data) { */
	/* 		//Do something with the data here */
	/* 		    } */
	/* 		}); */
	/*  		}  */

	</script>
</body>
</html>