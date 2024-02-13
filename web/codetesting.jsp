<!--PRINTING THE INFO AND DATA--> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="server.connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Page Title</title>
</head>
<body>
    <%@include file="Header.jsp"%>

    

    <p style="text-align: center; font-size: 35px; font-weight: 600;"> Welcome user : </p>

    <%
        try {
            Connection con = server.connection.getCon();
if (con == null) {
                out.println("Failed to establish a database connection.");
            }else{           
 Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT pid,pimg FROM ekartproducts");

            while (rs.next()) {
                String userId = rs.getString("pid");
                String imageName = rs.getString("pimg");
                String img="uploadimages/" +imageName;
    %>
                <p>User ID: <%=userId%><br>
                    <img src="<%=img%>" alt="alt"/>
 Image Name: <%=imageName%></p>
    <%
            }
}
   }      catch (SQLException e) {
            out.println("Error: " + e.getMessage());
        }

    %>
</body>
</html>
