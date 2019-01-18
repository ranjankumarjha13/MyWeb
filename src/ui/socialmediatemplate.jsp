<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 14-12-2018
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="res/scripts/scripts/myscript/like.js"></script>
  <script src="res/scripts/scripts/myscript/ajax.js"></script>
</head>
<style>
</style>
<body>
<div style="background-color: #261ab3;padding-bottom: 75px">
<div class="col-sm-1" style="padding-top: 20px">
 <img src="https://mysearchofsummer.files.wordpress.com/2011/05/" height="30px" width="100px">
</div>
  <div class="col-sm-4">
    1
  </div>
  <div class="col-sm-2">
    <span style="color: white"><label>Email or phone</label></span><br>
    <span style="color: white"><label><input type="text" placeholder="Email"></label></span>
    <span style="color: white"><input type="checkbox" name="vehicle1" value="Bike"> keep me logged in</span>
  </div>
  <div class="col-sm-4">
    <span style="color: white"><label>Password</label></span><br>
    <span style="color: white"><label><input type="text" placeholder="Email"/></label></span>
    <span><a href="likeunlike!likeunlike.do" style="border: 1px solid;background-color: white">Login</a></span><br>
    <span style="color: white"> <a href="" style="color: white">forgetten your password? </a></span>
  </div>
</div>
<div style="margin-top: 20px">
   <div class="col-sm-6" style="height: 300px;padding: 30px">
     <img src="http://c.asstatic.com/images/1994221_635204212653063750-1.jpg" height="350px">
   </div>
<div class="col-sm-6"  style="height: 600px;padding: 5px">
    <div class="col-sm-12" style="height: 20px;padding-left: 25px">
      <h3 style="font-family: bold">Create an account</h3>
    </div>
  <div class="col-sm-12" style="height: 20px;margin-top: 20px;padding-left: 25px">
    <h3 style="font-family: bold;color: black">It's free and always will be free</h3>
  </div>
  <div class="col-sm-12" style="height: 40px;margin-top: 42px;padding: 10px">
          <div class="col-sm-5" style="height: 20px">
           <input type="text" class="form-control" placeholder="firstname">
          </div>
    <div class="col-sm-5" style="height: 20px;margin-left: 10px">
      <input type="text" class="form-control" placeholder="lastname">
    </div>
  </div>
  <div class="col-sm-12" style="padding-left: 25px;margin-top: 30px">
    <input type="text" class="form-control" placeholder="Email">
  </div>
  <div class="col-sm-12" style="padding-left: 25px;margin-top: 30px">
    <input type="text" class="form-control" placeholder="Re enter emil">
  </div>
  <div class="col-sm-12" style="padding-left: 25px;margin-top: 30px">
    <input type="password" class="form-control" placeholder="Password">
  </div>
  <div class="col-sm-4" style="padding-left: 25px;margin-top: 30px">
    <input type="password" class="form-control" placeholder="mm/dd/yyyy">
  </div>
  <div class="col-sm-12" style="padding-left: 25px;margin-top: 30px">
    <input type="radio" name="gender" value="male"> Male
    <input type="radio" name="gender" value="male"> Femaile
  </div>
  <div class="col-sm-12" style="margin-top: 30px">
    <button type="button" class="btn btn-success">Create an Account</button>
  </div>
</div>
</div>
</body>
</html>
