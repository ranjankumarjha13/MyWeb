<%--
  Created by IntelliJ IDEA.
  User: Tapaas
  Date: 04-12-2018
  Time: 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="bootstrapcumjavascriptfile.jsp"/>
<html>
<style>
    .submenuitem{
        float: right;
        font-size: 17px;

    }
    .headeree{
        border: 1px solid;
        height: 70px;
        background-color: #0066FF;
        margin: 0;;
        color: white;;
    }
</style>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title></title>
</head>
<body>
<div class="headeree" style="font-family: bold">
   <span style="margin: 40px"><img src="https://angular.io/assets/images/logos/angular/logo-nav@2x.png" height="40px" style="margin-top: 10px"></span>

</div>
<div class="col-sm-2" style="background-color: wheat;height: 88%">
    <SPAN style="font-size: 15px;">GETTING STARTED</SPAN><br>
  <span style="font-size: 18px;
font-family: bold;color: #0066FF">TUTORIAL</span>
    <span style="float: right;font-size: 20px;font-family: bold;">
  <i class="fa fa-angle-right" onclick="CLNav.getSubmenuitems()"></i>
    </span>
    <div class="submenuitem" style="display: none" id="view">
        <span>1.</span>
        <span onclick="CLNav.getdata(1)">Introduction</span><br>
        <span>2.</span>
        <span onclick="CLNav.getdata(2)">The Apllication Shell</span>
    </div>
</div>
<div class="col-sm-9" id="viewpage">

</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="res/scripts/nav.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</html>
