<%@page import="server.connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page errorPage="ErrorHandle.jsp"%>
<%
String type=request.getParameter("type");
String descp=request.getParameter("descp");
 Connection con=connection.getCon();
PreparedStatement ps=con.prepareStatement("insert into ekartcategory values(?,?)");
ps.setString(1, type);
ps.setString(2, descp);
int k=ps.executeUpdate();
if(k>0)
{
%>
    <!-- JavaScript to show a pop-up after form submission -->
    <script>
        alert("Category added successfully! by Mr.NIHAL SINGH"); // You can customize this message
        // Redirect to the adminlogin.jsp page after showing the pop-up
        window.location.href = "adminlogin.jsp";
    </script>
<%
//response.sendRedirect("adminlogin.jsp");
}
%>

