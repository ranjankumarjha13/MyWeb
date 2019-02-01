
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
    top: 150px;
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
    <script>
      var lineInfos = [];
      var inital;
      var final;
      var mainDV = document.getElementById("containerDiv");
      var id=0;
      function calculateNumberofnodes()
      {
        document.getElementById("numberofnode").innerHTML=id+1;
      }
      function drawLine()
      {
        display();
        adjustLine(
                document.getElementById(inital),
                document.getElementById(final)
        );
      }
      function display() {
        var z = prompt("Enter initial Point...");
        var x=prompt("Enter Final Point....")
        if (z != null &&x !=null) {
          dis(z,x);
        }
      }
      function dis(arg,arg1) {
        inital=arg;
        final=arg1;
      }
      function createNode(parentNodeId)
      {
        ++id;
        var pid=document.getElementById(parentNodeId);
        var myDiv = document.createElement("div");
        myDiv.setAttribute("onclick","getNodeid(this)");
        myDiv.style.top=pid.offsetTop+"px";
        myDiv.style.left=pid.offsetLeft+300+"px";
        var ObjI=document.createElement("i");
        var ObjI=document.createElement("i");
        ObjI.setAttribute("class","fa fa-plus")
        ObjI.setAttribute("onclick","createNode("+id+")")
        var ObjI2=document.createElement("i");
        ObjI2.setAttribute("class","fa fa-cut");
        ObjI2.setAttribute("onclick","deleteNode("+id+")")
        ObjI2.style.marginLeft="15px";
        myDiv.setAttribute("class","myDiv");
        myDiv.setAttribute("onmouseover","dragElement(this)");
        myDiv.setAttribute("id",+id);
        myDiv.setAttribute("onmouseover","dragElement(this)");
        var mydivheader = document.createElement("div");
        mydivheader.setAttribute("class","mydivheader");
        mydivheader.innerHTML="Child Id"+":"+id;
        myDiv.appendChild(mydivheader);
        mainDV.appendChild(myDiv);
        myDiv.appendChild(ObjI);
        myDiv.appendChild(mydivheader);
        mainDV.appendChild(myDiv);
        myDiv.appendChild(ObjI);
        myDiv.appendChild(ObjI2);
        var arrow=document.createElement("DIV");
        arrow.setAttribute("id","arrow");
        var img = document.createElement("IMG");
        img.setAttribute("src","https://cdn2.iconfinder.com/data/icons/bold-ui/100/right-128.png");
        img.setAttribute("width", "50");
        img.setAttribute("height", "30");
        img.setAttribute("style","transform: rotate(267deg)");
        img.setAttribute("style","margin-left: -23px");
        arrow.appendChild(img);
        var line=document.createElement("Div");
        line.setAttribute("class","line");
        line.setAttribute("id","line_"+parentNodeId+"_"+id);
        line.setAttribute("onclick","getNodeid(this)")
        document.getElementById("containerDiv").appendChild(line);
        line.appendChild(arrow);
        var icircle=document.createElement("Div");
        icircle.setAttribute("id","icircle");
        var ic=document.createElement("i");
        ic.setAttribute("class","fa fa-info-circle");
        ic.setAttribute("onclick","getDetails(this)")
        icircle.appendChild(ic);
        line.appendChild(icircle);
        icircle.style.marginLeft="-6px";
        var lineinfo=[id,parentNodeId,line];
        lineInfos[lineInfos.length]=lineinfo
        adjustLine();
        calculateNumberofnodes();

      /*  var pid=document.getElementById(parentNodeId);
        var myDiv = document.createElement("div");
        myDiv.setAttribute("class","mydiv");
        myDiv.style.top=pid.offsetTop+"px";
        myDiv.style.left=pid.offsetLeft+200+"px";
        var ObjI=document.createElement("i");
        ObjI.setAttribute("class","fa fa-plus")
        ObjI.setAttribute("onclick","createNode("+id+")")
        var ObjI2=document.createElement("i");
        ObjI2.setAttribute("class","fa fa-trash");
        ObjI2.setAttribute("onclick","deleteNode("+id+")")
        ObjI2.style.marginLeft="15px";
        myDiv.setAttribute("class","myDiv");
        myDiv.setAttribute("onmouseover","dragElement(this)");
        myDiv.setAttribute("id",+id);
        var mydivheader = document.createElement("div");
        var content=document.createElement("input");
        content.setAttribute("id","myinput")
        mydivheader.appendChild(content);
        myDiv.appendChild(mydivheader);
        mainDV.appendChild(myDiv);
        myDiv.appendChild(ObjI);
        myDiv.appendChild(ObjI2);
        var arrow=document.createElement("DIV");
        arrow.setAttribute("id","arrow");
        var img = document.createElement("IMG");
        img.setAttribute("src","https://cdn1.iconfinder.com/data/icons/fs-icons-ubuntu-by-franksouza-/128/go-up.png");
        img.setAttribute("width", "21");
        img.setAttribute("height", "45");
        img.setAttribute("style","margin-left: -9px");
        arrow.appendChild(img);
        var line=document.createElement("Div");
        line.setAttribute("id","line");
        line.setAttribute("onclick","getNodeid(this)")
        document.getElementById("containerDiv").appendChild(line);
        line.appendChild(arrow);
        var icircle=document.createElement("Div");
        icircle.setAttribute("id","icircle");
        var ic=document.createElement("i");
        ic.setAttribute("class","fa fa-circle");
        ic.setAttribute("onclick","getDetails(this)")
        icircle.appendChild(ic);
        line.appendChild(icircle);
        icircle.style.marginLeft="-6px";
        var lineinfo=[id,parentNodeId,line];
        lineInfos[lineInfos.length]=lineinfo
        adjustLine();*/
      }
      function deleteNode(pid)
      {
        for(var i=0;i<lineInfos.length;i++)
        {
          var lineinfp=lineInfos[i];
          if(lineinfp[0]==pid)
          {
            var x=document.getElementById(pid).childNodes;
            mainDV.removeChild(document.getElementById(pid));
            mainDV.removeChild(lineinfp[2]);
            resetIndex(i);
          }
        }
      }
      function resetIndex(index)
      {
        while(index<lineInfos.length)
        {
          lineInfos[index]=lineInfos[index+1];
          index++;
        }
      }
     function getDetails(obj)
     {
       var parentObj = obj.parentNode;
       var parentObj = parentObj.parentNode;
       var lineId = parentObj.id;
       var arr = lineId.split("_");
       parentId = arr[1];
       childId = arr[2];
       alert("Parent Id is"+"="+"   "+""+parentId +""+"  "+"And Chld Id is"+"="+"   "+""+childId+"  ")
     }
      function init(element){
        var myDiv = document.createElement("div");
        myDiv.setAttribute("onclick","getNodeid(this)")
        var ObjI=document.createElement("i");
        ObjI.setAttribute("class","fa fa-plus")
        ObjI.setAttribute("onclick","createNode("+0+")")
        myDiv.setAttribute("class","myDiv");
        myDiv.setAttribute("id",+id);
        myDiv.setAttribute("onmouseover","dragElement(this)");
        var mydivheader = document.createElement("div");
        mydivheader.setAttribute("class","mydivheader");
        mydivheader.innerHTML="Root Id"+":"+id;
        myDiv.appendChild(mydivheader);
        mainDV.appendChild(myDiv);
        myDiv.appendChild(ObjI);
        calculateNumberofnodes();
      }
      function dragElement(elmnt) {
        var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
        if (elmnt) {
          /* if present, the header is where you move the DIV from:*/
          var dv = elmnt.childNodes;
          dv[0].onmousedown = dragMouseDown;
        } else {
          /* otherwise, move the DIV from anywhere inside the DIV:*/
          elmnt.onmousedown = dragMouseDown;
        }
        function dragMouseDown(e) {
          e = e || window.event;
          e.preventDefault();
          pos3 = e.clientX;
          pos4 = e.clientY;
          document.onmouseup = closeDragElement;
          document.onmousemove = elementDrag;
        }
        function elementDrag(e) {
          e = e || window.event;
          e.preventDefault();
          pos1 = pos3 - e.clientX;
          pos2 = pos4 - e.clientY;
          pos3 = e.clientX;
          pos4 = e.clientY;
          elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
          elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
          adjustLine();
        }
        function closeDragElement() {
          document.onmouseup = null;
          document.onmousemove = null;
        }
      }
      function adjustLine(){
        for(var i=0;i<lineInfos.length;i++){
          var lineInfo = lineInfos[i];
          var from = document.getElementById(lineInfo[0]);
          var to = document.getElementById(lineInfo[1]);
          var line = lineInfo[2];
          document.getElementById("containerDiv").appendChild(line);
          var fT = from.offsetTop  + from.offsetHeight/2;
         /*alert("From Top"+fT)*/
          var tT = to.offsetTop    + to.offsetHeight/2;
         /* alert("To Top"+tT)*/
          var fL = from.offsetLeft + from.offsetWidth/2;
          /*alert("From Left"+fL)*/
          var tL = to.offsetLeft   + to.offsetWidth/2;
         /* alert("To Left"+tL)*/
          var CA   = Math.abs(tT - fT);
          var CO   = Math.abs(tL - fL);
          var H    = Math.sqrt(CA*CA + CO*CO);
          var ANG  = 180 / Math.PI * Math.acos( CA/H );
          if(tT > fT){
            var top  = (tT-fT)/2 + fT;
          }else{
            var top  = (fT-tT)/2 + tT;
          }
          if(tL > fL){
            var left = (tL-fL)/2 + fL;
          }else{
            var left = (fL-tL)/2 + tL;
          }
          if(( fT < tT && fL < tL) || ( tT < fT && tL < fL) || (fT > tT && fL > 		tL) 		|| (tT > fT && tL > fL)){
            ANG *= -1;
          }
          top-= H/2;
          line.style["-webkit-transform"] = 'rotate('+ ANG +'deg)';
          line.style["-moz-transform"] = 'rotate('+ ANG +'deg)';
          line.style["-ms-transform"] = 'rotate('+ ANG +'deg)';
          line.style["-o-transform"] = 'rotate('+ ANG +'deg)';
          line.style["-transform"] = 'rotate('+ ANG +'180)';
         /* document.getElementById("gg").innerHTML=line.style.transform;*/
          line.style.top    = top+'px';
          line.style.left   = left+'px';
          line.style.height = H + 'px';
        }
      }
    </script>
    <h2  style="color: white"><u>Tree Node Example:</u></h2>
   <div  style="font-size: 20px;color: white;float: right;margin: 20px;">
     <span><u>Total Number of  Node is::</u></span>
     <span id="numberofnode"></span>
   </div>
</body>
</html>


