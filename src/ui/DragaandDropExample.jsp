
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<header>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script type ="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/1.5.0/fabric.min.js"></script>
  <script type ="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</header>
<style>
   .icircle:hover{
     background-color: red;
   }
   #line:hover
   {

     background-color: wheat;
   }
   .fa-info-circle:hover
   {
     background-color: white ;;
     transition: width 5s;
   }
  .line{
    position:absolute;
    width:2px;
    background-color:wheat;
    text-align: center;

  }
  .myDiv {
    position: absolute;
    z-index: 9;
    background-color: #f1f1f1;
    text-align: center;
    border: 1px solid #d3d3d3;
    border-radius: 4em;;
  }
  .mydivheader {
    padding: 5px;
    cursor: move;
    z-index: 10;
    background-color: #2196F3;
    color: #fff;
    width: 110px;
    height: 90px;
    border: 1px solid #d3d3d3;
    border-radius: 4em;;
  }
  #containerDiv {
    height: 100%;
    width: 100%;
    border: 1px solid;
    overflow: scroll;
    position: absolute;
    cancel: '#myinput';
    background-color: #5A7A9B;
    overflow-y: auto;
    overflow-x: auto;
  }
  #arrow
  {
    position:absolute;
    top: 55px;
  }
  #icircle
  {
    position:absolute;
    top: 50%;
    color: white;
  }
  input
  {
    background-color: #2196F3;
  }
  img
  {
    transform: rotate(267deg);
  }
</style>
<body onload="init(this)">
<div id="containerDiv">
  <div class="line">
    <div id="arrow" ></div>
    <div id="icircle"></div>
  </div>
  <div>
    <h2  style="color: white"><u>Tree Node Example:</u></h2>
   <div style="font-size: 20px;color: white;float: right;margin: 20px;font-family: boldcalc">
     <span><u>Total Number of  Node is::</u></span>
     <span id="numberofnode"></span>
   </div>
    </div>
</body>
<script src="res/scripts/myscript/tree.js"></script>
</html>


