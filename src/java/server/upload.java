package server;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
//@WebServlet("/upload")
public class upload extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();

       String pname=request.getParameter("pname");
String pid=request.getParameter("pid");
String ptype=request.getParameter("ptype");
String pprice=request.getParameter("pprice");
String pdesc=request.getParameter("pdesc");
//String pimg=request.getParameter("file");
//file type
        Part p = request.getPart("file");
        String filename = p.getSubmittedFileName();
        String uploadPath = "E://NetBeansFiles//OnlineEkart//web//uploadimages/" + filename;
//        out.print(uploadPath);
//file closes
        try {
            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = p.getInputStream(); // Fix the typo here
            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch (Exception e) {
            // Handle exceptions appropriately
            e.printStackTrace();
        }
        try {
            Connection con = connection.getCon();
//insert data
PreparedStatement ps=con.prepareStatement("Insert into ekartproducts (pname,pid,ptype,pdesc,pimg,pprice) values(?,?,?,?,?,?)");
ps.setString(1, pname);
ps.setString(2, pid);
ps.setString(3, ptype);
ps.setString(4, pdesc);
ps.setString(5, filename);
ps.setString(6,  pprice);
int k=ps.executeUpdate();
HttpSession session=request.getSession();
if(k>0)
{    
session.setAttribute("insertedproducts", "PRODUCTS SUCCESFULLY UPLOADED TO SITE ");
response.sendRedirect("adminlogin.jsp");
//request.setAttribute("insertedproducts", "products uploaded succefully to site");
//out.println("inserted succesfully");
//<script>
//alert("PRODUCTS DETAILS INSERTED SUCCESFULLY");
//window.location.href="adminlogin.jsp";
//</script>
}
else{
session.setAttribute("insertedproducts", "Products not Uploaded");
response.sendRedirect("adminlogin.jsp");
}
//request.getRequestDispatcher("adminlogin.jsp").forward(request, response);
} catch (SQLException e) {
            out.println("Error: " + e.getMessage());
        }
    
}
}
