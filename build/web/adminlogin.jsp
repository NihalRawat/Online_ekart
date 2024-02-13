<%@page import="com.mysql.cj.jdbc.PreparedStatementWrapper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>
<%@page import="server.connection,java.sql.*" %>
<%@page errorPage="ErrorHandle.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel </title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">  
        <link rel="stylesheet" href="Style/adminlogin.css"/>
    </head>
    <body>

        <%@include file="Header.jsp"%>
        <%
            String adminname = "";
            if (session.getAttribute("admin") != null) {
                adminname = (String) session.getAttribute("admin");
//session.invalidate();
//if used then after refreshing the page the session will be removed so it will log out
            } else {
        %>
        <h1 style="margin: 3em; color: red;">PLEASE LOGIN FIRST TO ACCESS THIS PAGE !!!!!!!!!!!</h1>
        <%
                //                 out.println("--------PLEASE LOGIN FIRST TO ACCESS THIS PAGE ----- ");
                return;
            }
        %>

        <p style="text-align: left; font-size: 35px; color: black; font-weight: 600;"><%=adminname%></p>
        <br>

        <div class="cointainer px-4 mx-auto border bg-light " style="width: 70%">
            <div class="row mt-3 mx-auto">

                <div class="col-md-4 mt-1">
                    <div class="card hoverad" style="width: 15rem;">
                        <img src="Images/apps.png" class="card-img-top img-fluid rounded" alt="sorry">
                        <div class="card-body">
                            <h5 class="card-title">CLICK HERE TO ADD CATEGORIES </h5>

                            <a href="#" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#add-category">Add Categories</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mt-1">
                    <div class="card hoverad" style="width: 15rem;">
                        <img src="Images/product.png" class="card-img-top img-fluid rounded" alt="sorry">
                        <div class="card-body">
                            <h5 class="card-title">CLICK HERE TO ADD PRODUCTS </h5>

                            <a href="#" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#add-products">Add Products</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mt-1">
                    <div class="card hoverad" style="width: 15rem;">
                        <img src="Images/add-to-cart.png" class="card-img-top img-fluid rounded" alt="sorry">
                        <div class="card-body">
                            <h5 class="card-title">CLICK HERE TO DELETE ITEMS  </h5>

                            <a href="#" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#delete">DELETE Products</a>
                        </div>
                    </div>
                </div>
            </div>
<!--FETCHIING THE TOATL NO OF USERS DYNAMICALLY-->
<%
 String Tuser="";
if(pageContext.getAttribute("Total", PageContext.SESSION_SCOPE)!=null){
    Tuser=(String)pageContext.getAttribute("Total",PageContext.SESSION_SCOPE);
}

%>
            <!-- second row down wards -->
            <div class="row mt-4">
                <div class="col-md-4 mt-2 mx-auto ">
                    <div class="card hoverad" style="width: 20rem;">
                        <img src="Images/users.png" class="card-img-top img-fluid rounded" alt="sorry">
                        <div class="card-body">
                            <h5 class="card-title">TOTAL USERS REGISTED TILL NOW </h5>

                            <a href="" class="btn btn-warning"> <h2><%=Tuser%> </h2> </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mt-1 mx-auto">
                    <div class="card hoverad" style="width: 20rem;">
                        <img src="Images/tag.png" class="card-img-top img-fluid rounded" alt="sorry">
                        <div class="card-body">
                            <h5 class="card-title">ORDER HISTORY/TOTAL ORDERS   </h5>

                            <a href="#" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#orders">Check  </a>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!--modal one for add products--> 
        <div class="modal fade" id="add-products" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog  modal-lg">
                <div class="modal-content text-success">
<!--INSERT INTO PRODUCT DATA--> 
                  <form action="upload" method="post" enctype="multipart/form-data">

                        <div class="modal-header border bg-light">
                            <h5 class="modal-title" id="staticBackdropLabel">ADD PRODUCTS </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">

                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput" name="pname" placeholder="product name" required/>
                                <label for="floatingInput">Product Name</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput" name="pid" placeholder="product name" required/>
                                <label for="floatingInput">Product ID</label>
                            </div>
                            <select class="form-select text-success mb-2 mt-2" name="ptype" aria-label="Default select example" required/>
                            <option selected>Select Product Category</option>
                            <%
                                Connection con = server.connection.getCon();
                                Statement ps = con.createStatement();
                                ResultSet rs = ps.executeQuery("Select type from ekartcategory");
                                while (rs.next()) {
                                    String type = rs.getString("type");
                            %>
                            <option value="<%=type%>"><%=type%></option>
                            <%

                                }
                            %>
                            </select>
                            <div class="form-floating mt-3">                           
                                <textarea class="form-control" style="height: 90px;" name="pdesc" placeholder="Product Description" id="floatingTextarea" required/></textarea>
                                <label for="floatingTextarea">Product Description </label>                         
                            </div>
                            <div class="form-floating mt-3">
                                <input type="number" class="form-control" id="floatingInput" name="pprice" placeholder="product Price" required/>
                                <label for="floatingInput">product Price</label>
                            </div>
                        </div>
                        <div class="mb-3 mt-2">
                            <label for="formFile" class="form-label mx-4">Select/Upload file</label>
                            <input class="form-control" name="file" type="file" id="formFile">
                        </div> 
                        <div class="container text-center mb-2">
                            <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
                            <button type="submit" class="btn btn-info ">Save </button>
                        </div>
                    </form>
                </div>

            </div>
        </div>



        <!--closes here modal one--> 
<!--ordered data modal by user-->
<!--111 modal to see orders by uses-->
<!-- Button trigger modal -->


<!-- Modal -->

<div class="modal fade" id="orders" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="orderslabel">ORDERED ITEMS BY USERS  </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>


  
      <div class="modal-body">
        
        <table class="table table-striped">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Name</th>
              <th scope="col">State</th>
              <th scope="col">Distict</th>
              <th scope="col">Pincode</th>
              <th scope="col">House No</th>
              <th scope="col">Land mark </th>
              <th scope="col">Price</th>
            </tr>
          </thead>
          
<%
int count=1;
    Connection conorder=server.connection.getCon();
    PreparedStatement porder=conorder.prepareStatement("select * from ekartuseraddress");
    ResultSet rso=porder.executeQuery();
    while(rso.next()){
    String st=rso.getString("state");
    String dt=rso.getString("district");
    String pin=rso.getString("pincode");
    String hs=rso.getString("houseno");
    String lm=rso.getString("landmk");
    String tp=rso.getString("totalprice");
    String nickname=rso.getString("nickname");

%>
            <tbody>
            <tr>
              <th scope="row"><%=count%></th>
              <td><%=nickname%></td>
              <td><%=st%></td>
              <td><%=dt%></td>
              <td><%=pin%></td>
              <td><%=hs%></td>
              <td><%=lm%></td>
              <td><%=tp%></td>
            </tr>
            
<%
count++;
}

%>
</tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Print</button>
      </div>
    </div>
  </div>
</div>
<!-- ends here -->

<!--ordered data end here-->

<!--modal to delete the category or edit-->

<!-- Modal -->
<div class="modal fade" id="delete" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="deletelabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deletelabel">DELETE PRODUCTS </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <form action="deleteproducts.jsp">
      <div class="modal-body">
       <!-- items to delete  -->
        <div class="input-group flex-nowrap">          
          <input type="text" class="form-control" name="productid" placeholder="Product Id" aria-label="Username" aria-describedby="addon-wrapping">
        </div>
      </div>
      <div class="modal-footer d-flex  justify-content-between">
        <button type="button" class="btn btn-success">Search</button>
        <button type="submit" class="btn btn-danger">Delete Product</button>
      </div>
</form>
    </div>
  </div>
</div>


<!-- ends here for delete  -->
<!--modal ends here to delete the category-->

        <!--modal to add categories starts here-->
        <div class="modal fade" id="add-category" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content text-success">
                    <div class="modal-header border bg-light">
                        <h5 class="modal-title" id="staticBackdropLabel">ADD CATEGORY </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
<!--form to insert category-->
                        <form action="insertCategory.jsp">
                        <div class="form-floating mb-3">
                            
                                <input type="text" class="form-control" id="floatingInput" name="type" placeholder="product name" required/>
                                <label for="floatingInput">CATEGORY TYPE </label>

                                <div class="form-floating mt-3">
                                    <textarea class="form-control" style="height: 90px;" name="descp" placeholder="Leave a comment here" id="floatingTextarea" required/></textarea>
                                    <label for="floatingTextare`a">CATEGORY Description </label>
                                </div>


                        </div>
                        <div class="container text-center mb-2">
                            <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
                            <button type="submit" class="btn btn-info ">Save </button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>  

            <!--modal ends here categories--> 

<!--msg coming from upload servlet-->
<%
//session value coming from upload servlet page
String iproducts="";
if(session.getAttribute("insertedproducts")!=null){
iproducts=(String)session.getAttribute("insertedproducts");
session.removeAttribute("insertedproducts");
}
%>
<script>
    // Check if the message is present in the response content
    var successMessage = "<%=iproducts%>";

    // Display the message in a pop-up only if a product is inserted
    if (successMessage !== null && successMessage !== "") {
        alert(successMessage);
         <% session.removeAttribute("insertedproducts"); %>
    }
//    let adminname="";
//    if(adminname!==null && adminname!==""){
//    alert(adminname);
//    
//    }
</script>


            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>  
    </body>
</html>
