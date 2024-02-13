<%
        String message="";
        if(session.getAttribute("sql")!=null){
        message=(String)session.getAttribute("sql");
    
%>
    
           <div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong><%=message%></strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
        <%
            }
//        session.removeAttribute("message");
//    session.invalidate();
%>