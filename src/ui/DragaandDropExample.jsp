
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
  .line{
    position:absolute;
    width:1px;
    background-color:black;
    text-align: center;
  }
  .myDiv {
    position: absolute;
    z-index: 9;
    background-color: white;
    text-align: center;
    border-radius: 1em;;
    border: 1px solid black;
  }
  .mydivheader {
    padding: 5px;
    cursor: move;
    z-index: 10;
    background-color: white;
    color: #fff;
    width: 114px;
    height: 108px;
    border-radius: 1em;;
  }
  #containerDiv {
    height: 100%;
    width: 100%;
    border: 1px solid;
    overflow: scroll;
    position: absolute;
    overflow-y: auto;
    overflow-x: auto;
  }
  .content{
    margin-top: 35%;;
    font-size: 20px;;
    color: maroon;
    font-family: bold;
  }
  #arrow
  {
    position:absolute;
    top: 55px;
    left: -1px;
  }
  #icircle
  {
    position:absolute;
    top: 50%;
    color: black;
    cursor: pointer;
    font-size: 15px;;
  }
  .edit
  {
    display: none;
    text-align: center;
    cursor: pointer;
    opacity: 0;
    position: absolute;
    top: 1px;
    bottom: 0;
    left: 0;
    right: 0;
    width: 100%;
    height: 98%;
    opacity: 1;
    transition: 50ms;
    background-color: white;
    border-radius: 1em;;
  }
  .iconDiv{
    margin-top: 55%;;
  }
  .mydivheader:hover .edit
  {
    display: block;
    font-size: 20px;
    color: maroon;
    opacity: 1;
  }
</style>
<body onload="init(this)">
<div id="containerDiv">
  <div class="line">
    <div id="arrow" ></div>
    <div id="icircle"></div>
  </div>
  <h2  style="color: black"><u>Tree Node Example:</u></h2>
</div>
</body>
<script src="res/scripts/tree.js"></script>
</html>


