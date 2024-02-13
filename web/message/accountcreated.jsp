<%
//        String createdd="";
//        if(session.getAttribute("created")!=null){
//        createdd=(String)session.getAttribute("created");
//    
%>
    
  <%
String createdd="";
if(pageContext.getAttribute("created",pageContext.SESSION_SCOPE)!=null){
createdd=(String)pageContext.getAttribute("created",pageContext.SESSION_SCOPE);

%>      
           <div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong><%=createdd%> ___<a href="Index.jsp" >LOGIN NOW </a></strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
        <%
            }

%>