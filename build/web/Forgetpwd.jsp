
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot password Don't worry </title>
    
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="Style.css" />
  </head>
  <body>
      <%@include file="../Header.jsp"%>
    <div class="retrive" style="align-items: center;box-shadow: 0 0 10px black;border-radius: 10px; width: 40%; height:55%; position: absolute; left: 50%; top: 50%;transform: translate(-50%, -50%); text-align:center;margin-top:2em; padding-top:0px;">
        <form action="message/Forgetpwdcheck.jsp">
            <h3 style="color: red; font-weight:700; font-size: 35px;text-decoration: underline;">Forgoted Password Don't worry</h3>
            
            <input type="text" name="username" style="margin-top: 10px; font-size: 30px;" placeholder="Enter username" required/><br>
            <input type="number" style="margin-top: 10px; font-size: 30px;" name="mobile" placeholder="Enter mobile no" required/><br>
            <button style="margin-top: 10px; font-size: 35px; background-color: rgb(1, 1, 1);color: white; font-weight: 700;" type="submit">Submit</button>
             <button style="font-size: 25px; "><a href="Index.jsp"> Back to Login</a> </button>
        </form>
         <%
          String data="";
          if(session.getAttribute("pwd")!=null){
          data=(String)session.getAttribute("pwd");
          
          }
         session.removeAttribute("pwd");
      %>
      <h5 style="font-size: 35px; font-weight: 700; font-family: 'Times New Roman', Times, serif;"> <%=data%></h5> 
    </div>
    
      
    </body>
</html>
