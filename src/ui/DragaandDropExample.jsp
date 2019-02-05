
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
    background-color: #f1f1f1;
    text-align: center;
    border: 1px solid #d3d3d3;
    border-radius: 4em;;
  }
  .mydivheader {
    padding: 5px;
    cursor: move;
    z-index: 10;
    background-color: #FFAFA7;
    color: #fff;
    width: 114px;
    height: 114px;
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
    transition: .1s ease;
    position: absolute;
    top: 1px;
    bottom: 0;
    left: 0;
    right: 0;
    height: 100%;
    width: 100%;
    opacity: 0;
    transition: 50ms;
    background-color: #FFAFA7;
    border-radius: 4em;;
    transform: rotate(89deg);
  }
  .mydivheader:hover .edit
  {
    display: block;
    font-size: 20px;
    color: white;
    opacity: 1;
  }
  .hovericon{
    border: 1px solid black;
  }
  .rotate{
    transform: rotate(271deg);
  }
</style>
<body onload="init(this)">
<div id="containerDiv">
  <div class="line">
    <div id="arrow" ></div>
    <div id="icircle"></div>
  </div>
  <h2  style="color: white"><u>Tree Node Example:</u></h2>
</div>
</body>
<script src="res/scripts/tree.js"></script>
</html>


