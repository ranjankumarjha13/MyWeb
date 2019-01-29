<!DOCTYPE html>
<html>
<style>
  #nodearea{
    position:absolute; top:20px; left:30px;
    /*border: 1px solid;*/
    width: 100%;
  }
  .nodeBox{
    background-color: yellow;
    height: 60px;
    width: 60px;
    float: left;
    margin: 40px;
    text-align: center;
    padding: 10px;
  }
  .inputstyle{
    width: 100%;
    border: none;
    background-color: yellow;
  }
</style>
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script type ="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/1.5.0/fabric.min.js"></script>
  <script type ="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <title>Node Example</title>
</head>
<body>
<div style="background-color: black;width:100%">
<div id="canvas-wrap">
  <canvas id="c" width="1400" height="600"style="border:1px solid #ccc">
  </canvas>
  <div id="nodearea">
    <button id="draw">Add Link</button>
    <button id="delete">Delete Link</button>
    <button onclick="init()">AddNode</button>
  </div>
</div>
</div>
<script type="text/javascript">
  function init()
  {
    var objDIV = document.createElement("DIV");
    objDIV.setAttribute("class","nodeBox");
    objDIV.innerText="Focus Softent Pvt Ltd";
    var  objI=document.createElement("i");
    var objplusDiv=document.createElement("DIV");
    objI.setAttribute("class","fa fa-plus");
    objI.setAttribute("onclick","crateNode()");
    objplusDiv.appendChild(objI)
    objDIV.appendChild(objplusDiv)
    document.getElementById('nodearea').appendChild(objDIV);
  }
  function editTitle(obj) {
    var objDIV = obj.parentNode;
    var value = obj.value;

    if (value.trim(value).length > 0) {
      objDIV.innerHTML = "";
      objDIV.innerText = value;
      var objI = document.createElement("i");
      var objplusDiv = document.createElement("DIV");
      objI.setAttribute("class", "fa fa-plus");
      objI.setAttribute("onclick", "crateNode()");
      objplusDiv.appendChild(objI)
      objDIV.appendChild(objplusDiv)
    }
  }
  function crateNode()
  {
    var objDIV = document.createElement("DIV");
    objDIV.setAttribute("class","nodeBox");
    var objInput=document.createElement("input");
    objInput.setAttribute("onblur","editTitle(this)");
    objInput.setAttribute("class","inputstyle")
    objDIV.appendChild(objInput)
    document.getElementById('nodearea').appendChild(objDIV);
  }
  var line, isDown,mode;
  var canvas = new fabric.Canvas('c');
  canvas.perPixelTargetFind = true;
  canvas.targetFindTolerance = 4;

  $("#select").click(function(){
    mode="select";
    canvas.selection=true;
    canvas.renderAll();
  });
  $("#draw").click(function(){


    mode="draw";
  });
  $("#delete").click(function(){


    deleteObjects();
  });

  // Adding objects to the canvas...

  canvas.on('mouse:down', function(o){
    isDown = true;
    var pointer = canvas.getPointer(o.e);
    var points = [ pointer.x, pointer.y, pointer.x, pointer.y ];

    if(mode=="draw"){
      line = new fabric.Line(points, {
        strokeWidth: 2,
        fill: 'red',
        stroke: 'red',
        originX: 'center',
        originY: 'center',

      });
      canvas.add(line);}
  });
  canvas.on('mouse:move', function(o){
    if (!isDown) return;
    var pointer = canvas.getPointer(o.e);

    if(mode=="draw"){
      line.set({ x2: pointer.x, y2: pointer.y });
      canvas.renderAll(); }
  });

  canvas.on('mouse:up', function(o){
    isDown = false;
    line.setCoords();
  });
function deleteNodes()
{}
  // select all objects
  function deleteObjects(){
    var activeObject = canvas.getActiveObject(),
            activeGroup = canvas.getActiveGroup();
    if (activeObject) {
      if (confirm('Are you sure?')) {
        canvas.remove(activeObject);
      }
    }
    else if (activeGroup) {
      if (confirm('Are you sure?')) {
        var objectsInGroup = activeGroup.getObjects();
        canvas.discardActiveGroup();
        objectsInGroup.forEach(function(object) {
          canvas.remove(object);
        });
      }
    }
  }
</script>
</body>
</html>
<%--<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script type ="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/1.5.0/fabric.min.js"></script>
  <script type ="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script type ="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script type ="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/1.5.0/fabric.min.js"></script>
  <script type ="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script>
    function myFunction() {
      var c = document.getElementById("myCanvas");
      var ctx = c.getContext("2d");
      ctx.fillStyle = "#FF0000";
      ctx.font = "20px Georgia";
    }
    function init()
    {
      var objDIV = document.createElement("DIV");
      objDIV.setAttribute("class","nodeBox");
      objDIV.innerText="Focus Softent Pvt Ltd";
      var  objI=document.createElement("i");
      var objplusDiv=document.createElement("DIV");
      objI.setAttribute("class","fa fa-plus");
      objI.setAttribute("onclick","crateNode()");
      objplusDiv.appendChild(objI)
      objDIV.appendChild(objplusDiv)
      document.getElementById('nodearea').appendChild(objDIV);
    }
    function crateNode()
    {
      var objDIV = document.createElement("DIV");
      objDIV.setAttribute("class","nodeBox");
      var objInput=document.createElement("input");
      objInput.setAttribute("onblur","editTitle(this)");
      objInput.setAttribute("class","inputstyle")
      objDIV.appendChild(objInput)
      document.getElementById('nodearea').appendChild(objDIV);
    }
    function editTitle(obj) {
      var objDIV = obj.parentNode;
      var value = obj.value;

      if (value.trim(value).length > 0) {
        objDIV.innerHTML = "";
        objDIV.innerText = value;
        var objI = document.createElement("i");
        var objplusDiv = document.createElement("DIV");
        objI.setAttribute("class", "fa fa-plus");
        objI.setAttribute("onclick", "crateNode()");
        objplusDiv.appendChild(objI)
        objDIV.appendChild(objplusDiv)
      }
    }
    var line, isDown,mode;

    var canvas = new fabric.Canvas('myCanvas');

    $("#select").click(function(){
      mode="select";
      canvas.selection=true;
      canvas.perPixelTargetFind = true;
      canvas.targetFindTolerance = 4;
      canvas.renderAll();
    });
    $("#draw").click(function(){


      mode="draw";
    });
    $("#delete").click(function(){


      deleteObjects();
    });

    // Adding objects to the canvas...


    canvas.on('mouse:down', function(o){
      isDown = true;
      var pointer = canvas.getPointer(o.e);
      var points = [ pointer.x, pointer.y, pointer.x, pointer.y ];

      if(mode=="draw"){
        line = new fabric.Line(points, {
          strokeWidth: 5,
          fill: 'red',
          stroke: 'red',
          originX: 'center',
          originY: 'center',

        });
        canvas.add(line);}
    });

    canvas.on('mouse:move', function(o){
      if (!isDown) return;
      var pointer = canvas.getPointer(o.e);

      if(mode=="draw"){
        line.set({ x2: pointer.x, y2: pointer.y });
        canvas.renderAll(); }
    });

    canvas.on('mouse:up', function(o){
      isDown = false;
    });


    // select all objects
    function deleteObjects(){
      var activeObject = canvas.getActiveObject(),
              activeGroup = canvas.getActiveGroup();
      if (activeObject) {
        if (confirm('Are you sure?')) {
          canvas.remove(activeObject);
        }
      }
      else if (activeGroup) {
        if (confirm('Are you sure?')) {
          var objectsInGroup = activeGroup.getObjects();
          canvas.discardActiveGroup();
          objectsInGroup.forEach(function(object) {
            canvas.rem
          });
        }
      }
    }

</script>
</head>
<style>
  #canvas-wrap {
    position:relative;
  }
  #nodearea{
    position:absolute; top:20px; left:30px;
    border: 1px solid;
    width: auto;

  }
   .nodeBox{
    background-color: yellow;
    height: 100px;
    width: 100px;
    float: left;
    margin: 40px;
    text-align: center;
    padding: 10px;
  }
  .inputstyle{
    width: 100%;
    border: none;
  }
</style>
<body onload="init();">
<div id="canvas-wrap">
<canvas id="myCanvas" width="600" height="600"style="border:1px solid #ccc">
 </canvas>
  <div id="nodearea">
    <button id="select">Selection mode</button>
    <button id="draw">Drawing mode</button>
    <button id="delete">Delete selected object(s)</button><br />
  </div>
</div>

</body>
</html>--%>
<%--

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
  .canvas{
   /* border: 1px solid;*/
    background-color:black ;
    height: 500px;
    overflow-y: auto;
  }
  .nodeBox{
    background-color: yellow;
    height: 100px;
    width: 100px;
    float: left;
    margin: 40px;
    text-align: center;
    padding: 10px;
  }
  .inputstyle{
    width: 100%;
    border: none;
  }


</style>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script type ="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/1.5.0/fabric.min.js"></script>
  <script type ="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script>

    function init()
    {
      var objDIV = document.createElement("DIV");
      objDIV.setAttribute("class","nodeBox");
      objDIV.innerText="Focus Softent Pvt Ltd";
      var  objI=document.createElement("i");
      var objplusDiv=document.createElement("DIV");
      objI.setAttribute("class","fa fa-plus");
      objI.setAttribute("onclick","crateNode()");
      objplusDiv.appendChild(objI)
      objDIV.appendChild(objplusDiv)
      document.getElementById('nodearea').appendChild(objDIV);
    }

    function crateNode()
    {
      var objDIV = document.createElement("DIV");
      objDIV.setAttribute("class","nodeBox");
      var objInput=document.createElement("input");
      objInput.setAttribute("onblur","editTitle(this)");
      objInput.setAttribute("class","inputstyle")
      objDIV.appendChild(objInput)
      document.getElementById('nodearea').appendChild(objDIV);
    }
    function editTitle(obj)
    {
      var objDIV = obj.parentNode;
      var value=obj.value;

      if(value.trim(value).length>0)
      {
        objDIV.innerHTML="";
        objDIV.innerText=value;
        var  objI=document.createElement("i");
        var objplusDiv=document.createElement("DIV");
        objI.setAttribute("class","fa fa-plus");
        objI.setAttribute("onclick","crateNode()");
        objplusDiv.appendChild(objI)
        objDIV.appendChild(objplusDiv)
      }
    }
  </script>
</head>
<body onload="init();">
  <div class="col-sm-12">
    <div class="col-sm-2">
    </div>
    <div class="col-sm-8 canvas" id="nodearea">

    </div>
    <div class="col-sm-2">
    </div>
  </div>

</body>
</html>
--%>
