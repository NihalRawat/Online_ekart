<%@page isErrorPage="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>OOps sorry !!!! </title>
    </head>
    <body>
        <%@include file="Header.jsp"%>
        
            
        <p style="text-align: center; font-size: 35px; color: black; font-weight: 600;">
            
            SORRY SOMETHING WENT WRONG Please try again ---
            <%=exception%>

        </p>
    </body>
</html>