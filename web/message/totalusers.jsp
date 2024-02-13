<%@page import="java.sql.*"%>
<%@page import ="server.connection"%>

<%
try{
Connection con=server.connection.getCon();
PreparedStatement ps=con.prepareStatement("select count(username) as Tusers from ekartuser");
ResultSet rs=ps.executeQuery();
if(rs.next()){
String Tusers=rs.getString("Tusers");
//out.print(Tusers);
pageContext.setAttribute("Total", Tusers, pageContext.SESSION_SCOPE);
response.sendRedirect("../adminlogin.jsp");
}
else{
out.println("not foound");
}

}catch(Exception e){
out.println(e);
}

%>