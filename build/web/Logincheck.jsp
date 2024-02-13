<%@page import="server.connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%--<%@page import="Server.jsp"%>--%>
<%

    String usertype = request.getParameter("usertype");
    String name = request.getParameter("username");
    String pass = request.getParameter("password");
try {
    if ("admin".equals(usertype)) {
        try {
            Connection con = server.connection.getCon();
            PreparedStatement ps = con.prepareStatement("select username from ekartadmin where username=? and password=?");
           
 ps.setString(1, name);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                session.setAttribute("admin", "Welcome admin :" +name);
                response.sendRedirect("message/totalusers.jsp");
//if directly send to adminlogin page then no of users will never be visible
//                response.sendRedirect("adminlogin.jsp");
//                out.println("login");
            } else {
                session.setAttribute("login", "incorrect id or password");
                response.sendRedirect("Index.jsp");
            }
        } catch ( SQLException ex) {
            out.println(ex);
        }
    } else if (usertype.equals("user") && name != null && !name.isEmpty() && pass != null && !pass.isEmpty()) {
        try {
            Connection con = server.connection.getCon();
            PreparedStatement ps = con.prepareStatement("select username from ekartuser where username=? and password=?");
            ps.setString(1, name);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                session.setAttribute("username", name);
                response.sendRedirect("loggeduser.jsp");
            } else {
//                out.println("failed con");
                session.setAttribute("fail", "user id or password incorrect");
                response.sendRedirect("Index.jsp");
            }
        } catch (SQLException ex) {
            out.println(ex);
        }
    } else {
        session.setAttribute("flag", "Please select the user type");
        response.sendRedirect("Index.jsp");
    }
} catch (Exception ex) {
    out.println(ex);
}
%>
