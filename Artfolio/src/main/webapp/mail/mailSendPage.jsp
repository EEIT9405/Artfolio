<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新郵件</title>
<style>
div#column1 {
	position: absolute;
	width: 380px;
	border: 1px solid #ccc;
	padding: 10px;
}
</style>
</head>
<body>
	<div id="column1">
		<form action="mail.controller" method="post"
			enctype="multipart/form-data">
			<table>
				<tbody>
					<tr>
						<h3>新郵件</h3>
					</tr>
					<tr>
						<td><span>收件者</span></td>
							<td><input type="text" id="recipientmail" name="recipientmail" size="40" value="${toEmail}"/></td> 
					</tr>
					<tr>
						<td><span>寄件者</span></td>
						<td><input type="text" id="Sender" name="Sender" size="40" value="${fromName} (${fromEmail})" disabled="disabled"/></td>
					</tr>
					<tr>
						<td><span>主旨</span></td>
						<td><input type="text" name="title" size="40" value="${title}"/></td>
					</tr>
					<tr>
						<td colspan="2"><textarea cols="49" rows="20" name="content"></textarea></td>
					</tr>
					<tr>
						<td><input type="hidden" name="mState"  value="${mState}"/></td>
						<td><input type="hidden" name="recipient"  value="${toId}"/></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" name="submit" value="傳送" /><input
							type="file" name="file" /></td>
					</tr>
				</tbody>
			</table>
		</form>
		<div>${err.alert}</div>
	</div>
	
	<script src="../js/jquery-3.2.1.min.js"></script>
	<script>
	</script>
	
	
</body>
</html>