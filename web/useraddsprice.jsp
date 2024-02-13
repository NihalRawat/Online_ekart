<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="server.connection" %>
<%@page errorPage="../ErrorHandle.jsp" %>
<%
Connection con=server.connection.getCon();
String nickname=request.getParameter("nickname");
String st=request.getParameter("state");
String dis=request.getParameter("distict");
String pn=request.getParameter("pincode");
String hn=request.getParameter("houseno");
String lm=request.getParameter("lmark");
String totalp=request.getParameter("totalprice");

PreparedStatement ps=con.prepareStatement(" insert into ekartuseraddress (state,district,pincode,houseno,landmk,totalprice,nickname) values(?,?,?,?,?,?,?)");
ps.setString(1, st);
ps.setString(2, dis);
ps.setString(3, pn);
ps.setString(4, hn);
ps.setString(5, lm);
ps.setString(6, totalp);
ps.setString(7, nickname);
int k=ps.executeUpdate();
if(k>0){
%>
<script>
alert("order placed successfully");
window.location.href="loggeduser.jsp";
</script>
    

<%
}
%>