
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<style>
  .sidenav {
    height: 100%;
    width: 230px;
    position: fixed;
    z-index: 1;
    top: 0;
    left: -250px;
    background-color: black;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
  }

  .sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
    color: #2390E9;
  }

  .sidenav a:hover {
    color: #f1f1f1;
  }

  .sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
  }

  @media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
    .sidenav a {font-size: 18px;}
  }
  .maindiv{
   /* border: 1px solid green;*/
    height: 480px;
    padding: 10px;;
    margin: 20px;
  }
  .fisrtcard{
    border: 1px solid;;
    border-width: 2px;
    height: 450px;
    padding: 10px;;
    box-shadow: 5px 5px 10px gray;
    box-shadow: 5px 5px 10px pink;
   /* border-color: red;*/
  }
  .header
  {
  /*  border: 1px solid;*/
    height: 50px;
    border-color: green;
  }
  .content
  {
   /* border: 1px solid;*/
    height: 250px;
 /*   border-color: deeppink;*/
  }
  .footer
  {
   /* border: 1px solid;*/
    height: 50px;
    border-color: aqua;
    float: left;
  }

  .bottomdiv{
   /* border: 1px solid;*/
    height: 65px;
    padding: 10px;;
    margin: 20px;
    background-color: #008AFF;
    border-width: 5px;
    box-shadow: 5px 5px 10px green;
  }
  .topdiv{
   /* border: 1px solid;*/
    height: 65px;
    padding: 10px;;
    box-shadow: 5px 5px 10px green;

    background-color: #008AFF;
    border-width: 5px;
  ;
  }
.content table tr
{
  height: 37px;
}




</style>
<head>
  <script>
    function openNav() {
      document.getElementById("mySidenav").style.left = "0px";
    }

    function closeNav() {
      document.getElementById("mySidenav").style.left = "-250px";
    }

    function inputCheck(obj)
    {
      if(obj.value.length<=0)
      {
        obj.style.border="1px solid red";
        document.getElementById("error").innerHTML="Please fill the empty field!!!";


      }
      else
      {
        document.getElementById("error").innerHTML="";
       obj.style.border="1px solid green";
       /* document.getElementById("success").innerHTML="Thanky You have filled correctly.......";*/
      }
    }
    function myfunction()
    {
      var value=inputCheck(document.getElementById("name"));
      var value=inputCheck(document.getElementById("mobile"));
      var value=inputCheck(document.getElementById("email"));
      var value=inputCheck(document.getElementById("password"));
      var value=inputCheck(document.getElementById("zipcode"));
      var value=inputCheck(document.getElementById("textarea"));

    }
    function nameValidation()
    {
      var x=document.getElementById("name").value;
      if(x.length<10)
      {
        document.getElementById("namerror").innerHTML="invalid";
      }
      else
      {
        document.getElementById("namerror").innerHTML="";
      }
    }
    function textValidation()
    {
       var textarea=document.getElementById("textarea").value;
      if(textarea.length>50)
      {
        document.getElementById("texterror").innerHTML="should be less than 50";
      }

    }
  </script>
    <title></title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="topdiv">
  <%-- <div class="col-lg-1"></div><div class="col-lg-11"></div><center><h2 style="font-family: bold;">Welcome to CURD Application Using Card</h2></center>--%>
  <div class="col-lg-2">
    <img src="https://cdn.countryflags.com/thumbs/india/flag-round-250.png" height="55px" width="60px" class="img-responsive">
  </div>
    <div class="col-lg-8">
    <h2 style="font-family: bold;margin-left: 147px;">Welcome To CURD Application Using CARD</h2>
    </div>
</div>
        <div class="maindiv">
          <div align="center">
            <div class="cardcontroller">
              <div class="col-lg-2">
                <span style="font-size:30px;cursor:pointer;float: left" onclick="openNav()">&#9776;</span>
                <div id="mySidenav" class="sidenav">
                  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                  <a href="#">About</a>
                  <a href="#">Services</a>
                  <a href="#">Clients</a>
                  <a href="#">Contact</a>
                  <a href="#">View Details</a>
                  <a href="#">Add Details</a>
                  <a href="#">Facebook</a>
                  <a href="#">Google</a>
                  <a href="#">Admission Form</a>
                  <a href="#">Current Status</a>
                  <a href="#">New Arrival</a>
                </div>
              </div>

          <div class="col-lg-3 col-sm-12 col-md-12 fisrtcard">
            <div class="header">
              <div id="error1" style="color: red">

              </div>
              <div id="succes1" style="color: green">

              </div>
              <table>
                <tr><td><h3>Registration Details</h3></td></tr>
              </table>
            </div>

            <hr style="background: red;">

             <div class="content">
               <table>
                 <tr><td>Name:</td><td><input type="text" class="form-control"></td><td><span id="nameerror"></span></td></tr>
                 <tr><td>Mobile:</td><td><input type="text" class="form-control"></td></tr>
                 <tr><td>Email:</td><td><input type="text" class="form-control"></td></tr>
                 <tr><td>Password:</td><td><input type="text" class="form-control"></td></tr>
                 <tr><td>Zipcode:</td><td><input type="text" class="form-control"></td></tr>
                 <tr><td>Address:</td><td><textarea class="form-control"></textarea></td></tr>
               </table>

            </div>
            <hr>
            <div class="footer">
              <button type="button" class="btn btn-primary" ">Submit</button>
            </div>
          </div>
            </div>
          <div class="col-lg-3 col-sm-12 col-md-12 fisrtcard" style="margin-left: 20px">
            <div class="header">
              <div id="error2" style="color: red">

              </div>
              <div id="success2" style="color: green">

              </div>
              <table>
                <tr><td><h3>Registration Details</h3></td></tr>
              </table>
            </div>
            <hr>
            <div class="content">
              <table>
                <tr><td>Name:</td><td><input type="text" class="form-control"></td></tr>
                <tr><td>Mobile:</td><td><input type="text" class="form-control"></td></tr>
                <tr><td>Email:</td><td><input type="text" class="form-control"></td></tr>
                <tr><td>Password:</td><td><input type="text" class="form-control"></td></tr>
                <tr><td>Zipcode:</td><td><input type="text" class="form-control"></td></tr>
                <tr><td>Address:</td><td><textarea class="form-control"></textarea></td></tr>
              </table>
              <div id="errormsg">

              </div>

            </div>
            <hr>
            <div class="footer">
              <button type="button" class="btn btn-primary" >Submit</button>
            </div>
          </div>
          <div class="col-lg-3 col-sm-12 col-md-12 fisrtcard" style="margin-left: 20px">

            <div class="header">
              <div id="error" style="color: red">

              </div>
              <div id="success" style="color: green">

              </div>
           <table>
             <tr><td><h3 style="color: darkslategray">Registration Details</h3></td></tr>
           </table>
            </div>
            <hr>
            <div class="content">
             <table>

               <tr><td>Name*:</td><td><input type="text" class="form-control" id="name" onblur="nameValidation()"></td><td><span id="namerror" style="color: red;margin-left: 5px"></span></td></tr>
               <tr><td>Mobile*:</td><td><input type="text" class="form-control" id="mobile"></td></tr>
               <tr><td>Email*:</td><td><input type="text" class="form-control" id="email"></td></tr>
               <tr><td>Password*:</td><td><input type="text" class="form-control" id="password"></td></tr>
               <tr><td>Zipcode*:</td><td><input type="text" class="form-control" id="zipcode"></td></tr>
               <tr><td>Address*:</td><td><textarea class="form-control" id="textarea" onblur="textValidation()"></textarea></td><td><span id="texterror" style="color: darkred"></span></td></tr>
             </table>

            </div>
            <hr>
            <div class="footer">
              <button type="button" class="btn btn-primary" onclick="myfunction()">Submit</button>
            </div>
          </div>
          </div>

        </div>
<div class="bottomdiv">
  <div class="col-lg-3">


  </div>
  <center>
  <div class="col-lg-4 col-sm-4 col-md-4">
    <span style="font-family: bold;margin-left: 40px">
      All Right Reserved@Copyright2018
    </span>
     <span>
     <a href="https://www.google.com/" style="color: red;margin-right: 50px"><u>Google</u></a>
    </span>
    <span>
      <a href="https://www.google.com/search?client=firefox-b-ab&q=twitter" style="color: red"><u>Twitter</u></a>
    </span>
  </div>
  <div class="col-lg-5">

  </div>
  </center>
</div>

</body>
</html>
