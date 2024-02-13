<!--CHECK THE UPLOAD SERVER PAGE NOT THIS--> 
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>upload page</title>
    </head>
    <body>   
                         
        <% 
            File f;
           String iim = "";
            int factsize = 1024*1024*100;
            String reqdata = request.getContentType();
           //out.println(reqdata);
            if(reqdata.indexOf("multipart/form-data")>=0)
            {
                DiskFileItemFactory diskitemfactory = new DiskFileItemFactory();
                diskitemfactory.setSizeThreshold(factsize);
                diskitemfactory.setRepository(new File("C:\\temp"));
                
                ServletFileUpload upload = new ServletFileUpload(diskitemfactory);
                upload.setSizeMax(factsize);
                
                List filepart = upload.parseRequest(request);
                Iterator itr = filepart.iterator();
                while(itr.hasNext())
                {
                  FileItem  fi = (FileItem) itr.next();
                  String filename = fi.getName();
                  f  = new File("E:/NetBeansFiles/OnlineEkart/web/uploadimages/",filename);
                  fi.write(f);
                 // out.println(fi.getName());
                  //out.println(f.getAbsolutePath());
                  
                  session.setAttribute("x", f.getAbsolutePath());
                    out.println("uploaded");
                  
                  //out.println(filename);
                  //img = filename;
                }
                
            }
            %>
            
          
           
            
           
            
    </body>
</html>
