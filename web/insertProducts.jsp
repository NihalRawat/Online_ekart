<!--inserting the products info here-->
            <!--SEE UPLOAD SERVLERT PAGE NOT THIS ONE--> 
<%@page import="server.connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page errorPage="ErrorHandle.jsp"%>
<%
String pname=request.getParameter("pname");
String pid=request.getParameter("pid");
String ptype=request.getParameter("ptype");
String pdesc=request.getParameter("pdesc");
String pimg=request.getParameter("pimg");
Connection pcon=connection.getCon();
PreparedStatement ps=pcon.prepareStatement("Insert into ekartproducts values(?,?,?,?,?)");
ps.setString(1, pname);
ps.setString(2, pid);
ps.setString(3, ptype);
ps.setString(4, pdesc);
ps.setString(5, pimg);
int k=ps.executeUpdate();
if(k>0)
{
%>
<script>
//  alert("PRODUCTS DETAILS INSERTED SUCCESFULLY by NIHAL SINGH");
  window.location.href="adminlogin.jsp";
</script>
<%
}
%>