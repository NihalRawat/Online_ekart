<%@page import="java.sql.*"%>
<%@page import="server.connection"%>
<%@page errorPage="ErrorHandle.jsp"%>
<%
Connection con=server.connection.getCon();
String productid=request.getParameter("productid");
PreparedStatement ps=con.prepareStatement("delete from ekartproducts where pid=?");
ps.setString(1, productid);
int k=ps.executeUpdate();
if(k>0){
%>    
<script>
alert("PRODUCT DELETE FROM SITE SUCCESFULLY");
window.location.href="adminlogin.jsp";
</script>
<%
}
else{
%>
<script>
alert("INVALID PRODUCT ID ");
window.location.href="adminlogin.jsp";
</script>
<%
}
%>
