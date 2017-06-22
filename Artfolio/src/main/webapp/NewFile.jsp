<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/Artfolio/ckeditor/ckeditor.js"></script>
<title>Insert title here</title>
</head>
<body>
<form>
            <textarea name="editor1" id="editor1" rows="10" cols="80">
            </textarea>
            <script>
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                         
                CKEDITOR.replace( 'editor1');
                
                
                
                
            </script>
        </form>

</body>
</html>