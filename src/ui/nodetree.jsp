<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 13-02-2019
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<style>
  .line{
    position:absolute;
    width:1px;
    background-color:black;
    text-align: center;
    color: black;
  }
  .addNode{
    position: absolute;
    top: 86px;
    left: 19px;
  }
  .deleteNode
  {
    position: absolute;
    top: 87px;
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
    color: #800800;
  }

</style>
<head>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"/>
  <script>
    var lineInfos = [];
    var mainDV = null;
    var line;
    var JsonData = [
      {
        id:"id0",
        title: 'Focus',
        source : "",
        children: [
          {
            id:"node_1",
            title: 'Ranjan',
            source : "node_0",
            children: [
              {
                id:"node_2",
                title: 'Tapas',
                source : "node_1",
              },
              {
                id:"node_3",
                title: 'Mayur',
                source : "node_1",
                children: [
                  {
                    id:"node_4",
                    title: 'M A',
                    source : "node_3"
                  },
                  {
                    id:"node_5",
                    title:"M B",
                    source:"node_3"
                  },
                  {
                    id:"node_6",
                    title:"M C",
                    source:"node_3"
                  },
                  {
                    id:"node_7",
                    title:"M D",
                    source:"node_3"
                  },
                ]
              },
            ]
          }
        ]
      }];
    function init(nodecontent,nodeid,nodePrentId)
    {
      var myDiv = document.createElement("div");
      myDiv.setAttribute("parentId", nodePrentId);
      myDiv.setAttribute("curentId", nodeid);
      myDiv.setAttribute("id", nodeid);
      var ObjPlusicon=document.createElement("i");
      ObjPlusicon.setAttribute("title","Click to Add Node");
      myDiv.innerHTML=nodecontent;
      var ObjeDeleteIcon=document.createElement("i");
      ObjeDeleteIcon.setAttribute("class","fa fa-trash deleteNode")
      ObjPlusicon.setAttribute("class","fa fa-plus addNode")
      myDiv.setAttribute("class","myDiv");
      myDiv.setAttribute("onmouseover","dragElement(this)");
      myDiv.appendChild(ObjPlusicon);
      myDiv.appendChild(ObjeDeleteIcon);
      var line = document.createElement("DIV");
      line.setAttribute("id","line_"+nodeid+"_"+nodePrentId);
      var arrow=document.createElement("DIV");
      arrow.setAttribute("id","arrow");
      var img = document.createElement("IMG");
      img.setAttribute("src","https://cdn3.iconfinder.com/data/icons/google-material-design-icons/48/ic_play_arrow_48px-128.png");
      img.setAttribute("width", "50");
      img.setAttribute("height", "30");
      img.setAttribute("style","transform: rotate(267deg)");
      img.setAttribute("style","margin-left: -23px");
      arrow.appendChild(img);
      line.appendChild(arrow);
      var icircle=document.createElement("Div");
      icircle.setAttribute("id","icircle");
      var ic=document.createElement("i");
      ic.setAttribute("class","fa fa-circle");
      ic.setAttribute("data-toggle","tooltip");
      ic.setAttribute("title","Get Node Details");
      ic.setAttribute("onclick","getDetails(this)");
      icircle.appendChild(ic);
      line.appendChild(icircle);
      icircle.style.marginLeft="-5px";
      line.setAttribute("class","line");
      document.getElementById("dvTreecontainer").appendChild(line);
      mainDV.appendChild(myDiv);
      if(nodePrentId!=null&&nodeid!=null){
        var lineinfo=[nodePrentId,nodeid,line];
        lineInfos[lineInfos.length]=lineinfo;
      }
    }
    function adjustLine(){
      var line,from,to;
        for(var i=0;i<lineInfos.length;i++){
          var lineInfo = lineInfos[i];
          from = document.getElementById(lineInfo[0]);
          to = document.getElementById(lineInfo[1]);
          line = lineInfo[2];
          document.getElementById("dvTreecontainer").appendChild(line);
          if(from!=null &&to!=null)
          {
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
            var toTop = parseInt(to.offsetTop);
            var toLeft = parseInt(to.offsetLeft);
            var fromTop = parseInt(from.offsetTop);
            var fromLeft = parseInt(from.offsetLeft);
            var childNodes1 = line.childNodes;
            var childNodes2 =childNodes1[0].childNodes;
            var imgObj = childNodes2[0];
            document.getElementById("gg").innerHTML = "toTop"+"  "+toTop + " fromTop "+fromTop +"toLeft"+ toLeft + "fromLeft"+fromLeft ;
            if((toTop < fromTop) || ( toLeft  > fromLeft )){
              var height = line.style.height;
              var iHeight = parseInt(height.split("px")[0]);
              imgObj.style.transform = "rotate(450deg)";
              imgObj.style.position = "absolute";
              if((toTop > fromTop) && (toLeft > fromLeft)){
                imgObj.style.transform = "rotate(630deg)";
                imgObj.style.position = "absolute";
                imgObj.style.top = "0px";
              }
              if((fromTop<fromLeft))
              {
                var iHeight = parseInt(height.split("px")[0]);
                imgObj.style.position = "absolute";
                imgObj.style.top = iHeight-165 +"px";
              }
              if((fromTop>fromLeft))
              {
                var iHeight = parseInt(height.split("px")[0]);
                imgObj.style.position = "absolute";
                imgObj.style.top = "50px";
                imgObj.style.transform = "rotate(625deg)";
              }
            }
            else{
              imgObj.style.transform = "rotate(270deg)";
              imgObj.style.position = "absolute";
              imgObj.style.top = "0px";
            }
            if(toTop>fromTop)
            {
              imgObj.style.top = "20px";
            }
            line.style.top    = top+'px';
            line.style.left   = left+'px';
            line.style.height = H + 'px';
          }
          }
    }
    function getNodes(currChild){
      if(currChild.children){

        for(i=0; i <currChild.children.length; i++){
          var val = currChild.children[i];
          getNodes(currChild.children[i]);
          init(val.title,val.id,val.source);
        }
      }
    }
    function load()
    {
      mainDV = document.getElementById("dvTreecontainer");
      init("Focus","node_0",null);
      var currChild = JsonData[0];
      getNodes(currChild);
    }
    function dragElement(elmnt) {
      var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
      if (elmnt) {
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
  </script>
</head>
<body onload="load();">
<div id="dvTreecontainer" align="center">
  <div id="gg" style="height: 40px;"></div>
  <div class="line">
    <div id="treearrow" ></div>
    <div id="icircle"></div>
  </div>
</div>
</body>
</html>




