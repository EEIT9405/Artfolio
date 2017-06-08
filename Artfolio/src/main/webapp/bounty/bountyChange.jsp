<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/Artfolio/js/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$(".datepicker").datepicker();
		$(".datepicker").datepicker("option", "dateFormat", "yy-mm-dd");
		$('input[name=startdate]').val('${change.b_startdate}');
		$('input[name=enddate]').val('${change.b_enddate}');
		$('input[name=announced]').val('${change.b_announced}');
	});

</script>

</head>
<body>
<h2>更新資料</h2>
<form  action="<c:url value="/bounty/personal.controller"/>" method="post" enctype="multipart/form-data">  
        <table>
			<tr>
				<td>主題:</td>
				<td><input type="text" name="topic" value="${change.b_title}" /><span>${err.topic}</span></td>
			</tr>
			<tr>
				<td>開始日期:</td>
				<td><input type="text" name="startdate" 
					class="datepicker" value=""  /><span>${err.start}</span></td>
			</tr>
			<tr>
				<td>截止日期:</td>
				<td><input type="text" name="enddate" 
					class="datepicker" value=""/><span>${err.end}</span></td>
			</tr>
			<tr>
				<td>公布得獎日期:</td>
				<td><input type="text" name="announced" 
					class="datepicker" value="" /><span>${err.anno}</span></td>
			</tr>
			<tr>
				<td>總獎金:</td>
				<td><input type="text" name="totalbonus" value="${change.b_bonus_total}" /><span>${err.totalbonus}</span></td>

			</tr>
			<tr>
				<td>最高獎金:</td>
				<td><input type="text" name="maxbonus" value="${change.b_bonus_max}" /><span>${err.maxbonus}</span></td>

			</tr>
			<tr>
				<td>主辦單位:</td>
				<td><input type="text" name="organizer" value="${change.b_organizer}" /><span>${err.organizer}</span></td>
			</tr>
			<tr>
				<td>活動詳情:</td>
				<td><textarea  rows="10" cols="60" name="content" id="content" >${change.b_content}</textarea><span>${err.content}</span></td>
			</tr>
			<tr>
				<td>參加辦法:</td>
				<td><textarea  rows="10" cols="60" name="particimethod" id="particimethod">${change.b_partimethod}</textarea><span>${err.aprti}</span></td>
			</tr>
			<tr>
				<td>活動圖片:</td>
				<td><input type="file" name="pic" class="upl" /><span>${err.attach}</span></td>
				<td><img height="100" width="100" src="/bountyImgs/${change.b_attach_pic.substring(change.b_attach_pic.lastIndexOf("/")+1)}"/></td>
				<td><img class="preview" style="max-width: 150px; max-height: 150px;"></td>
			</tr>
			<tr>
				<td>檔案:</td>
				<td><input type="file" name="file" /></td>
			</tr>			
		</table>
		<input type="submit" name="action"  value="Modify" />
	    <input type="reset" value="顯示原本訊息"/>
	    <input type="hidden" name="bid"  value="${change.b_id}" >	   
	    </form>
	    
	    
<script>
$(function (){
	 
    function format_float(num, pos)
    {
        var size = Math.pow(10, pos);
        return Math.round(num * size) / size;
    }
 
    function preview(input) {
 
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('.preview').attr('src', e.target.result);
                var KB = format_float(e.total / 1024, 2);
                $('.size').text("檔案大小：" + KB + " KB");
            }
 
            reader.readAsDataURL(input.files[0]);
        }
    }
 
    $("body").on("change", ".upl", function (){
        preview(this);
    })
    
})



</script>
</body>
</html>