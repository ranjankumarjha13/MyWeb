
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!DOCTYPE html>
<%--<html>
<style>
  .animatedDiv{
    border: 1px solid black;
    height: 100px;
    width: 100px;
    border-radius: 1em;
    transition: 1s;
    margin: 20px;
  }
  #mainDiv
  {
    margin: 30px;
    width: 100%;
    height: 100%;;
    position: absolute;
  }
  .faclass
  {
  margin: 10%;
    cursor: pointer;
  }
</style>
<head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script>
    function init()
    {
      var x=document.createElement("DIV");
      var objI=document.createElement("i");
      objI.setAttribute("class","fa fa-plus");
      objI.setAttribute("onclick","createNode()");
      var ObjIdiv=document.createElement("DIV");
      ObjIdiv.setAttribute("class","faclass");
      ObjIdiv.appendChild(objI);
      x.setAttribute("class","animatedDiv");
      x.setAttribute("onmouseover","create(this)");
      x.appendChild(ObjIdiv);
      document.body.appendChild(x);
    }
    function createNode()
    {
      var x=document.createElement("DIV");
      var objI=document.createElement("i");
      objI.setAttribute("class","fa fa-plus");
      objI.setAttribute("onclick","createNode()");
      var ObjIdiv=document.createElement("DIV");
      ObjIdiv.setAttribute("class","faclass");
      ObjIdiv.appendChild(objI);
      x.setAttribute("class","animatedDiv");
      x.setAttribute("onmouseover","create(this)");
      x.appendChild(ObjIdiv);
      document.body.appendChild(x);
    }

  /*  $(document).ready(function(){
      $("button").click(function(){
        $("div").animate({left: '500px'});
      });
    });*/
  </script>
</head>
<body onload="init()">

<div id="mainDiv">

</div>

</body>
</html>--%>
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
    color: black;
  }
  .myDiv {
    position: absolute;
    z-index: 9;
    background-color: white;
    text-align: center;
    border: 1px solid black;
    top: 40%;
    left: 100px;
    width: 120px;
    height: 120px;
  }

  .deleteTreeNode{
    position: absolute;
    bottom: 15px;
    right: 20px;
  }
  .addtreenode{
    position: absolute;
    top: 90px;
    left: 18px;
  }
  /*.mydivheader {
    padding: 5px;
    cursor: move;
    z-index: 10;
    background-color: white;
    width: 114px;
    height: 108px;
    cursor: pointer;
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
    margin-top: 36%;;
    font-size: 20px;;
    color: #800800;
    font-family: bold;
  }
  .initcontent{
    margin-top: 31%;;
    font-size: 20px;;
    color: #800800;
    font-family: bold;
    color: #800800;
  }*/

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
  input
  {
    border: none;
    width: 80%;
    font-size: 15px;
    text-align: center;
    cursor: pointer;
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
  .mydivheader:hover .edi
  {
    display: block;
    font-size: 20px;
    color: #800800;
    opacity: 1;
  }
  .iconDiv
  {
    color: #800800;
    font-family: bold;
    font-size: 20px;;
  }
  .initicon{
    margin-top: -16px;
    margin-left: -37px;
  }
</style>
<body onload="load();">

<h2 style="height: 50px" id="ii"></h2>
<div id="containerDiv">
  <div class="line">
    <div id="arrow" >
    </div>
    <div id="icircle"></div>
  </div>
  <h2  style="color: black"><u>Tree Node Example:</u></h2>
</div>
</body>
<script src="res/scripts/tree.js"></script>
</html>


