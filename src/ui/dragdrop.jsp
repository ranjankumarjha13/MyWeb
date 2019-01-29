<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 29-01-2019
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<style>
  .line{
    position: absolute;
    width: 1px;
    background: red;
  }
  .myDiv {
    position: absolute;
    z-index: 9;
    background-color: #f1f1f1;
    text-align: center;
    border: 1px solid #d3d3d3;
  }

  .mydivheader {
    padding: 5px;
    cursor: move;
    z-index: 10;
    background-color: #2196F3;
    color: #fff;
    width: 100px;
  }
  #containerDiv{
    height: 100%;
    width: 100%;
    border : 1px solid;
    overflow: hidden;
    position: absolute;
    background-color: black;
  }

</style>
<body onload="init()">
<div id="containerDiv">
  <div>
    <script>
      var mainDV = document.getElementById("containerDiv");
      var indexId = 0;
      var lineInfos = [];
      function init(){
        var myDiv = document.createElement("div");
        myDiv.setAttribute("class","myDiv");
        myDiv.setAttribute("id","node_"+indexId);
        myDiv.setAttribute("onmouseover","dragElement(this)");
        var mydivheader = document.createElement("div");
        mydivheader.setAttribute("class","mydivheader");
        mydivheader.innerHTML="Focus Softnet Pvt Ltd(Root)";
        var addBtn = document.createElement("BUTTON");
        addBtn.innerText = "Add Node";
        addBtn.setAttribute("onclick","createNode('node_"+indexId+"')");
        mydivheader.appendChild(addBtn);
        myDiv.appendChild(mydivheader);
        mainDV.appendChild(myDiv);
      }
      function createNode(parentNodeId){
        indexId = indexId + 1;
        var myDiv = document.createElement("div");
        myDiv.setAttribute("class","myDiv");
        myDiv.setAttribute("id","node_"+indexId);
        myDiv.setAttribute("onmouseover","dragElement(this)");
        var mydivheader = document.createElement("div");
        mydivheader.setAttribute("class","mydivheader");
        mydivheader.innerHTML="Focus Softnet";
        var addBtn = document.createElement("BUTTON");
        addBtn.innerText = "Add";
        addBtn.setAttribute("onclick","createNode('node_"+indexId+"')");
        mydivheader.appendChild(addBtn);
        var lineInfo = [parentNodeId,"node_"+indexId];
        lineInfos[lineInfos.length] = lineInfo;
        myDiv.appendChild(mydivheader);
        mainDV.appendChild(myDiv);
        adjustLine();
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
        var lines = document.getElementsByClassName("line");
        for(var i=0;i<lines.length;i++){
          var line = lines [i];
          mainDV.removeChild(line);
        }
        for(var i=0;i<lineInfos.length;i++){
          var lineInfo = lineInfos[i];
          var from = document.getElementById(lineInfo[0]);
          var to = document.getElementById(lineInfo[1]);
          var line = document.createElement("DIV");
          line.setAttribute("class","line");
          document.getElementById("containerDiv").appendChild(line);
          var fT = from.offsetTop  + from.offsetHeight/2;
          var tT = to.offsetTop    + to.offsetHeight/2;
          var fL = from.offsetLeft + from.offsetWidth/2;
          var tL = to.offsetLeft   + to.offsetWidth/2;
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
          line.style.top    = top+'px';
          line.style.left   = left+'px';
          line.style.height = H + 'px';
        }
      }
    </script>
    <h3 style="color: white"><u>Tree Node Example:</u></h3>
</body>
</html>

