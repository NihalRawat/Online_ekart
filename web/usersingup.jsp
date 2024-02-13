<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Log-in Page</title>
    <link rel="stylesheet" href="Style/singup.css"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  </head>
  <body>
    <h1>Welcome to E-kart</h1>
    <%@include file="message/message.jsp"%>
<%        session.removeAttribute("sql");%>
<%@include file="message/accountcreated.jsp"%>
<% session.removeAttribute("created");%>
<!<!-- created attribute which was set up when account created in usersingup page -->
    <div class="cointainer">
        
      <h2>Create a new account <br /></h2>
      It's quick and easy <br />
      <hr>
<!--to input data of user--> 
          <form action="singupcheck.jsp">
      <table>
        <tr>
          <td>
            <input type="text" id="text" name="name" placeholder="First name" required/>
            <input type="text" id="text" name="surname" placeholder="surname" required/>
          </td>
        </tr>
        <tr>
          <td>
            <input
              type="number" id="text1"
              name="number"
              placeholder="Mobile number or email address" required
            />
          </td>
        </tr>
        <tr>
          <td>
            <input type="password" id="text1" name="password" placeholder="password" required/>
          </td>
        </tr>
        <tr>
            <td><label>Date of birth ?</label> <br><input type="date" name="date" required/> </td>       
        <tr>
          <td>
            <label for="Gender">Gender</label>
          </td>
        </tr>
        <tr>
          <td>
            <input type="radio" name="gender" value="Female"/>Female
            <input type="radio" name="gender" value="Male" />Male
            <input type="radio" name="gender" value="custom" />Custom
          </td>
        </tr>
      </table>
     <button type="submit" value="submit">submit Me</button>
      </form>
    </div>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  </body>
</html>
