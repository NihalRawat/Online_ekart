<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.*,java.lang.String,java.lang.Object" %>
<%@page import="server.connection"%>
<%@page import="java.sql.*"%>
<%@page errorPage="ErrorHandle.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>
<body>
    <%@include file="Header.jsp"%>
 
        <%
        String name="";
        if(session.getAttribute("username")!=null){
            name=(String)session.getAttribute("username");
session.removeAttribute(name);
            }
else{
out.println("LOGGING TO ACCCESS THIS PAGE AND \nTO ACCESS THIS PAGE LOGIN AS USER");
return;
}            
            String createuser="";
            if(session.getAttribute("created")!=null){
            createuser=(String)session.getAttribute("created");
            }
            
        %>
 <button type="button" class="btn btn-dark float-end mt-3 mx-2" data-bs-toggle="modal" href="#cartmodel">CART</button>
  <b class="cartcount  float-end mt-4 " id="cartcount">0</b><!--numbering on cart to select the items-->
  
    <p style="text-align: center; font-size: 35px; font-weight: 600;"> Welcome user : <%=createuser%><%=name%></p>
      <!--PRODUCTS INFO CARDS STARTS HERE-->
 <div class="container border bg-light mx-auto">
        <div class="row mt-2 mx-auto">
<%
Connection con=server.connection.getCon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("Select * from ekartproducts");
while(rs.next()){
String pid=rs.getString("pid");
String pname=rs.getString("pname");
String ptype=rs.getString("ptype");
String pdesc=rs.getString("pdesc");
String pimg=rs.getString("pimg");//this will give only name form the database
String image="uploadimages/"+pimg;//this will provide the path and name of img
String pprice=rs.getString("pprice");
%>

            <div class="col mb-2">
               
                <div class="card mt-3 bg-info" style="width: 18rem;">
                    <img src="<%=image%>" class="card-img-top" alt="..error.">
                    <div class="card-body">

                      <h5 class="card-title" id="pname"><%=pname%></h5>
                      <p class="card-text" style="height: 70px; overflow-y:scroll ;"><%=pdesc%></p>
                    </div>
                    <ul class="list-group list-group-flush ">
                      <li class="list-group-item bg-warning" id="pid"><%=pid%></li>
                      <li class="list-group-item bg-warning" id="pcat"><%=ptype%></li>
                      
                    </ul>
                    <div class="d-flex flex-row bd-highlight mb-3">
                      <button type="button" onclick="run(this)" class="btn btn-success" style="width: 50%;">Add to Cart</button>
                      <button type="button"  class="btn btn-primary" id="price" style="width: 50%;"><%=pprice%></button>
                    </div>
<!--                    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addcart">Add to Cart</button>-->
                  </div>    
              </div>


<!--PRODUCTS CARDS END HERE-->       


<%
}


%>
</div>
</div>

        
<!-- modal for buy or add to cart -->

<!--modal starting here all things are done below-->



<!-- cart items start here -->
<div class="modal fade" id="cartmodel" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title fw-bold mx-auto" id="cartmodel">YOUR CART </h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">

        Items added by you are below::
        
         <ol id="cartcointainer" class="px-2 list-group list-group-numbered">
          <!-- cart items will come here  -->
         </ol>
      </div>

      <div class="modal-footer ">
        <!-- total price in cart -->
        <h3 class="btn btn-danger">Total price :<a id="totalprice" name="totalprice">0</a></h3>
        <button class="btn btn btn-primary" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal" data-bs-dismiss="modal">Proceed further</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel2">Contact Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
<!--data to input address of user--> 
<form action="useraddsprice.jsp">
      <div class="modal-body">
        <!-- entering contact details of customer  -->
        <div class="input-group mb-3">          
          <input type="text" class="form-control" name="nickname" placeholder="Nickname" aria-label="nickname" aria-describedby="basic-addon1" required/>
        </div>
        <div class="input-group mb-3">
<!--this will take the input of total price from this page to another page-->
            <input type="hidden" id="totalpriceInput" name="totalprice" value="">

          <input type="text" class="form-control" name="state" placeholder="Enter State" aria-label="Username" aria-describedby="basic-addon1" required/>
        </div>
        
        <div class="input-group mb-3">          
          <input type="text" class="form-control" name="distict" placeholder="Enter District" aria-label="Enter District" aria-describedby="basic-addon1" required/>
        </div>
        <div class="input-group mb-3">          
          <input type="number" class="form-control" name="pincode" placeholder="Enter pincode" aria-label="Enter pincode" aria-describedby="basic-addon1" required/>
        </div>
        <div class="input-group mb-3">          
          <input type="text" class="form-control" name="houseno" placeholder="Enter House no" aria-label="Enter House no" aria-describedby="basic-addon1" required/>
        </div>
        <div class="input-group mb-3">          
          <input type="text" class="form-control" name="lmark" placeholder="Nearest landmark " aria-label="Nearest landmark " aria-describedby="basic-addon1" required/>
        </div>

        <!-- ends here contact details -->
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#cartmodel" data-bs-toggle="modal" data-bs-dismiss="modal">Back to first</button>
            <button class="btn btn-success"  type="submit" onclick="submitform()">CONFIRM</button>
      </div>
</form>
<!--data to input user-->
    </div>
  </div>
</div>



<!-- cart ends heree -->

<!-- javascript code to addcart -->

<script>
  let x=0;
  let totalprice=0;
function run(btn){ 
  x++;
  
  
  document.getElementById("cartcount").innerHTML=x;
  //  document.getElementById("cartcointainer").innerHTML +="<li>" document.getElementById(pid).innerHTML"<input type='button' value='buy'> ";
    let card=btn.closest(".card");
    let productid=card.querySelector("#pid").innerHTML;
   let price=parseInt(card.querySelector("#price").innerHTML);

   let ptype=card.querySelector("#pcat").innerHTML;
   let pname=card.querySelector("#pname").innerHTML;
       document.getElementById("cartcointainer").innerHTML += "<li class='list-group-item'>ID::" + productid + "___NAME::" + pname + " ___CATEGORY::" + ptype + "__PRICE:: ₹" + price + "<input class='float-end btn btn-danger' type='button' value='Delete'></li>";

      // let cartp=price;
      totalprice+=price;
      document.getElementById("totalprice").innerHTML =totalprice;
    }

function submitform(){
    let price =document.getElementById("totalprice").innerText;
   document.getElementById("totalpriceInput").value=totalprice;
    document.getElementById("useraddsprice").submit();
}   
//alert for username
let username="<%=name%>";
if(username!==null && username!==""){
    alert("WELCOME USER "+username);
}

</script>
<!-- modal for add to cart ends here -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>

