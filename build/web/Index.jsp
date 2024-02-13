
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Shop at door</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="Style.css"/>
    </head>
    <body>
        <nav class="navbar navbar-light navbg navwi sticky-top">
            <div class="container-fluid">
                <img class="lo" src="Images/logo.png" alt="error" />

                <h1>Lets Find Your Choice</h1>
                <form class="d-flex" action="usersingup.jsp">
                    <button
                        class="btn btn-outline-success"
                        type="button"
                        onclick="scrolllogin()"
                        >
                        Login
                    </button>
                    <button class="btn btn-outline-success" type="submit">Signup</button>
                    <button class="btn btn-outline-success homee"><a href="Index.jsp">Home</a>
                        <ul class="home-list">
                            <li><a href="">Forgot password</a> </li>
                            <li>Shop now</li>
                            <li>Best collections</li>
                            <li>Only 999</li>
                        </ul>
                    </button>
                </form>
            </div>
        </nav>
        <div class="main">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <!--          <img src="/Images/mens.png" alt="error"/>-->Trending
                    </div>
                    <div class="col">Mens</div>
                    <div class="col">Womens</div>
                    <div class="col">Kids</div>
                    <div class="col">Old 1900</div>
                </div>
            </div>
            <div class="top" >
                <h3>Top Deals</h3>
                <img src="Images/topdeals.png" alt=""/>
            </div>
            <div class="container special">
                <h3>Special Deal</h3>
                <figure class="figure mt-2 mb-4">
                    <img src="Images/specialdeal.png" class="figure-img img-fluid rounded" alt="...">      
                </figure>
                <figure class="figure mt-2 mb-4">
                    <img src="Images/special-d.png" class="figure-img img-fluid rounded" alt="...">
                </figure>
                <figure class="figure mt-2 mb-4">
                    <img src="Images/special-d1.png" class="figure-img img-fluid rounded" alt="...">        
                </figure>

            </div>

            <div class="imgcontent" id="login">
                <div class="sec">
                    <img class="img11" src="Images/body.jpg" alt="error" />
                </div>
                <div class="wcontent" >
                    <form action="Logincheck.jsp">
                        <!-- <h3>Login Here</h3> -->
                        <select name="usertype" required="required">
                            <option value="">Select Login Type</option>
                            <option value="admin">Admin</option>
                            <option value="user">User</option>
                        </select><br>
                        <input type="text" name="username" placeholder="username" required="required"/><br />
                        <input type="password" name="password" placeholder="password" required="required"/><br />
                        <button type="submit">LOGIN</button>
                        <a href="Forgetpwd.jsp"><h2>Forgot Password ??</h2></a>

                        <%
                            String flag = "";
                            if (session.getAttribute("flag") != null) {
                                flag = (String) session.getAttribute("flag");
                            } else {

                            }
                            String logincheck = "";
                            if (session.getAttribute("login") != null) {
                                logincheck = (String) session.getAttribute("login");
                            }
                            String user = "";
                            if (session.getAttribute("fail") != null) {
                                user = (String) session.getAttribute("fail");

                            }
                            session.invalidate();
                        %>
                            <p style="font-size: 25px; color:red; background-color: wheat; font-weight: 900;  border: 2px solid black; width:100%"> <%=flag%> </p>
                        <!--used alert box for admin-->

                    </form>
                </div>
            </div>
        </div>
        <div class="footer">
            <!-- develped by nihal -->
            <div class="card text-white bg-dark mb-3" style="max-width: 18rem">
                <div class="card-header">About us</div>
                <div class="card-body">
                    <h5 class="card-title">Designation</h5>
                    <p class="card-text">Student</p>
                    <h5 class="card-title">Email us</h5>
                    <p class="card-text">nihalsinghrawatnsr24@gmail.com</p>
                </div>
            </div>
            <div class="card text-white bg-dark mb-3" style="max-width: 18rem">
                <div class="card-header">Customer support</div>
                <div class="card-body">
                    <h5 class="card-title">24 * 7</h5>
                    <p class="card-text">18001321</p>
                    <h5 class="card-title">Address</h5>
                    <p class="card-text">Gurugram</p>
                </div>
            </div>
            <div class="card text-white bg-dark mb-3" style="max-width: 18rem">
                <div class="card-header">Suggestions</div>
                <div class="card-body">
                    <h5 class="card-title">24 * 7</h5>
                    <p class="card-text">18001321</p>
                    <h5 class="card-title">Address</h5>
                    <p class="card-text">Gurugram</p>
                </div>
            </div>
        </div>
        <!--alert box to show that wrong password--> 
        <script>
    let loginmsg = "<%=logincheck%>";
    if (loginmsg !== null && loginmsg !== "") {
        alert("INCORRECT ID OR PASSOWRD BY ADMIN. PLEASE LOGIN AGAIN....");
    }
    let userlogin = "<%=user%>";
    if (userlogin !== null && userlogin !== "") {
        alert("INCORRECT ID OR PASSWORD BY USER.PLEASE LOGIN AGAIN");
    }


        </script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"
        ></script>
        <script src="app.js"></script>
    </body>
</html>
