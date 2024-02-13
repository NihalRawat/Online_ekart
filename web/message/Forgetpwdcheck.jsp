<%@page import="server.connection"%>
<%@page import="java.sql.*"%>
<%

String mobile=request.getParameter("mobile");
        String user=request.getParameter("username");
//        String user=req.getParameter("admin");
        
        try {
            
            Connection con=connection.getCon();
                       
            PreparedStatement ps=con.prepareStatement("select username,password from ekartuser where username=? and mobile=?");
            ps.setString(1,user);
            ps.setString(2,mobile);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
//             ps1.println("login admin");
                String pass=rs.getString("password");
                session.setAttribute("pwd", "Your password is :"+pass);
                response.sendRedirect("../Forgetpwd.jsp");
            }
            else{
                
                session.setAttribute("pwd", "mobile or username is incorrect");
                response.sendRedirect("../Forgetpwd.jsp");
            }
            
            
        } catch (SQLException ex) {
           out.println(ex);
        }
%>