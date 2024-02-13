<%@page import="server.connection" %>
<%@page import="java.sql.*"%>
<%@page errorPage="ErroHandle.jsp" %>
<%
 try {
            
            Connection con= server.connection.getCon();
            String name=request.getParameter("name");
        String pass=request.getParameter("password");
        String surname=request.getParameter("surname");
        String mobile=request.getParameter("number");
        String dob=request.getParameter("date");
        String gender=request.getParameter("gender");
            PreparedStatement ps=con.prepareStatement("insert into ekartuser values(?,?,?,?,?,?)");
            ps.setString(1,name);
            ps.setString(2, pass);
            ps.setString(3, surname);
            ps.setString(4, mobile);
            ps.setString(5, dob);
            ps.setString(6,gender);
            
            int k=ps.executeUpdate();
            if(k>0){
//                
                   pageContext.setAttribute("created","Account created successfully Mr/Mrs: "+ name,PageContext.SESSION_SCOPE);
//                   session.setAttribute("created", "Account created "+name);
             response.sendRedirect("usersingup.jsp");

//                    resp.sendRedirect("loggeduser.jsp");
            }
            else {
                out.println("not created");
            }
            
    }  
         catch (SQLException ex) {
//                 ex.printStackTrace(); 
                session.setAttribute("sql","Username already exists");
                response.sendRedirect("usersingup.jsp");
                
//            response.sendRedirect("usersingup.jsp");
        }
%>
