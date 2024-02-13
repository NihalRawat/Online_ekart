
<%@page errorPage="message/ErrorHandle.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
<form action="upload" method="post" enctype="multipart/form-data">
    <input type="file" name="file">
<input type="text" name="pid"/>
<input type="submit" value="submit">
<%
int a=10;
int b=0;
out.println(a/b);
%>
</form>
    </body>
</html>
