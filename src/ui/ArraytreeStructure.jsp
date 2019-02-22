<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 13-02-2019
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
  .HtreenodeDiv
  {
     position: absolute;
     border: 1px solid;
      height: 100px;
     width: 100px;
     text-align: center;
     background-color: white;
     z-index: 2000;
  }
  .htreeLine{
    position:absolute;
    width:1px;
    background-color:black;
    text-align: center;
    color: black;
  }
  .Haddtree
  {
    position: absolute;
    top: 68px;
    left: 16px;
  }
  .HdeleteTree{
    position: absolute;
    top: 68px;
  }
  .HdeleteTreecreatenode
  {
    position: absolute;
    top: 67px;
    left: 77px;
  }
  .objcircle{
    position: absolute;
    top: 50%;
    margin-left: -4px;;
  }
  #icircle
  {
    left: 3px;
  }
  #HtreeDiv
  {

    height: 600px;
    width: 650px;
    border: 1px solid;
  }
</style>
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Tree Structure</title>
  <script>
    var HtreenodeDiv
    var mainDiv=null;
    var lineInfos=[];
    var JSONOBjectLEngth;
    var arrayJSON=[
        {
        "name":"Tapas",
        "nodeID":"1",
        "parentID":"0",
        "XPosition":"100",
        "YPosition":"200"
      },
      {
        "name":"Ranjan",
        "nodeID":"2",
        "parentID":"1",
        "XPosition":"300",
        "YPosition":"200"
      },
      {
        "name":"Mayur",
        "nodeID":"3",
        "parentID":"1",
        "XPosition":"300",
        "YPosition":"400"
      },
      {
        "name":"Child1",
        "nodeID":"4",
        "parentID":"2",
        "XPosition":"500",
        "YPosition":"400"
      },
      {
        "name":"Child2",
        "nodeID":"5",
        "parentID":"2",
        "XPosition":"500",
        "YPosition":"200"
      }
    ];
  function init(objJson)
  {
     HtreenodeDiv=document.createElement("DIV");
    var ObjPlusicon=document.createElement("i");
    var objDeleteIcon=document.createElement("i");
    ObjPlusicon.setAttribute("class","fa fa-plus Haddtree");
    objDeleteIcon.setAttribute("class","fa fa-trash HdeleteTree");
    objDeleteIcon.setAttribute("onclick","deleteNode()");
    ObjPlusicon.setAttribute("onclick","createNode(this)");
    HtreenodeDiv.setAttribute("class","HtreenodeDiv");
    HtreenodeDiv.setAttribute("id",objJson.nodeID);
    HtreenodeDiv.setAttribute("onmouseover","dragElement(this)");
    HtreenodeDiv.setAttribute("parentId",objJson.parentID);
    HtreenodeDiv.setAttribute("ChildId",objJson.nodeID);
    HtreenodeDiv.innerHTML=objJson.name;
    HtreenodeDiv.appendChild(ObjPlusicon);
    HtreenodeDiv.appendChild(objDeleteIcon);
    var prevID=objJson.parentID;
    HtreenodeDiv.style.left=objJson.XPosition;
    HtreenodeDiv.style.top=objJson.YPosition;
    mainDiv.appendChild(HtreenodeDiv);
    if(objJson.parentID!=0)
    {
      var htreeLine = createLine();
      document.body.appendChild(htreeLine);
      var lineinfo=[objJson.parentID,objJson.nodeID,htreeLine];
      lineInfos[lineInfos.length]=lineinfo;
    }
  }
    function createNode(obj)
    {
      var nodename=window.prompt("Enter Node name","");
      JSONOBjectLEngth++;
      var pid=obj.parentNode;
      var HtreenodeDiv=document.createElement("DIV");
      HtreenodeDiv.setAttribute("id",JSONOBjectLEngth);
      HtreenodeDiv.setAttribute("parentId",pid.id);
      HtreenodeDiv.setAttribute("ChildId",JSONOBjectLEngth);
      HtreenodeDiv.style.top=pid.offsetTop+"px";
      HtreenodeDiv.style.left=pid.offsetLeft+220+"px";
      HtreenodeDiv.style.left=pid.offsetLeft+230+"px";
      var ObjPlusicon=document.createElement("i");
      var objDeleteIcon=document.createElement("i");
      ObjPlusicon.setAttribute("class","fa fa-plus Haddtree");
      objDeleteIcon.setAttribute("class","fa fa-trash HdeleteTreecreatenode");
      objDeleteIcon.setAttribute("onclick","deleteNode()");
      ObjPlusicon.setAttribute("onclick","createNode(this)");
      HtreenodeDiv.setAttribute("class","HtreenodeDiv");
      HtreenodeDiv.setAttribute("onmouseover","dragElement(this)");
      HtreenodeDiv.innerHTML=nodename;
      HtreenodeDiv.appendChild(ObjPlusicon);
      HtreenodeDiv.appendChild(objDeleteIcon);
      document.body.appendChild(HtreenodeDiv);
      var htreeLine = createLine();
      mainDiv.appendChild(htreeLine);
      var lineinfo=[pid.id,JSONOBjectLEngth,htreeLine];
      lineInfos[lineInfos.length]=lineinfo;
      adjustLine();
        HtreenodeDiv.style.left=(mainDiv.offsetWidth-HtreenodeDiv.offsetWidth)+"px";
        closeDragElement();

    }








    /*this.hasChildren= function (currentIDindex) {

     for(var i=currentIDindex;i<arrayJSON.length;i++)
     {
     var objjSon=arrayJSON[i];
     var nextParentId= objjSon.parentID;
     if(nextParentId==currentIDindex)
     {
     return true;
     }
     }
     return false;
     }

     this.flagCtl=false;
     this.deleteNode=function(currentIDindex)
     {
     if(this.flagCtl==false)
     this.flagCtl=this.hasChildren(currentIDindex);
     if(this.flagCtl){
     for(var i=currentIDindex;i<arrayJSON.length;i++)
     {
     var objjSon=arrayJSON[i];
     var nextParentId= objjSon.parentID;
     if(nextParentId==currentIDindex)
     {
     mainDiv.removeChild(document.getElementById("node_"+objjSon.nodeID));
     this.deleteNode(objjSon.nodeID);
     }
     }
     }
     else{
     mainDiv.removeChild(document.getElementById("node_"+currentIDindex));
     }
     }

    this.deleteNode=function(currentIDindex)
    {
      for(var i=currentIDindex;i<arrayJSON.length;i++)
      {
        var objjSon=arrayJSON[i];
        var nextParentId= objjSon.parentID;
        if(nextParentId==currentIDindex)
        {
          this.deleteNode(objjSon.nodeID);
        }

      }
      mainDiv.removeChild(document.getElementById("node_"+currentIDindex));
    }


    this.deleteLine=function(parent,child)
    {
      /!* parent=parent.split("_")[1];
       child=child.split("_")[1];*!/
      mainDiv.removeChild(document.getElementById("line_"+parent+"_"+child))
    }

*/










    function createLine()
    {
      htreeLine = document.createElement("DIV");
      var arrow=document.createElement("DIV");
      arrow.setAttribute("id","arrow");
      var img = document.createElement("IMG");
      img.setAttribute("src","https://cdn3.iconfinder.com/data/icons/google-material-design-icons/48/ic_play_arrow_48px-128.png");
      img.setAttribute("width", "30");
      img.setAttribute("height", "20");
      arrow.appendChild(img);
      htreeLine.appendChild(arrow);
      var icircle=document.createElement("Div");
      icircle.setAttribute("id","icircle");
      var ic=document.createElement("i");
      ic.setAttribute("class","fa fa-circle objcircle");
      ic.setAttribute("data-toggle","tooltip");
      ic.setAttribute("title","Get Node Details");
      ic.setAttribute("onclick","getDetails(this)");
      ic.setAttribute("style","font-size:10px");
      icircle.appendChild(ic);
      htreeLine.appendChild(icircle);
      htreeLine.setAttribute("class","htreeLine");
      return htreeLine;
    }
    function load()
    {
      mainDiv=document.getElementById("HtreeDiv");
      for(var i=0;i<arrayJSON.length;i++)
      {
        init(arrayJSON[i]);
      }
      adjustLine();
      JSONOBjectLEngth=arrayJSON.length;
    }
    function dragElement(elmnt)
    {
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
        var divLEft=elmnt.offsetLeft;
        var divtop=elmnt.offsetTop;
        var mw=mainDiv.offsetWidth;
        var nw=HtreenodeDiv.offsetWidth;
        var mh=mainDiv.offsetHeight;
        var nh=HtreenodeDiv.offsetHeight;
        if(divLEft<0)
        {
          elmnt.style.left="0px";
          closeDragElement();
        }
        if(divtop<0)
        {
          elmnt.style.top="0px";
          closeDragElement();
        }

        if(elmnt.offsetLeft>(mainDiv.offsetWidth-HtreenodeDiv.offsetWidth))
        {
          elmnt.style.left=(mainDiv.offsetWidth-HtreenodeDiv.offsetWidth)+"px";
          closeDragElement();
        }
        if(elmnt.offsetTop>(mainDiv.offsetHeight-HtreenodeDiv.offsetHeight))
        {
          elmnt.style.top=(mainDiv.offsetHeight-HtreenodeDiv.offsetHeight)+"px";
          closeDragElement();
        }
      }
      function closeDragElement() {
        document.onmouseup = null;
        document.onmousemove = null;
      }

    }
    function getDetails(obj)
    {
      var pnode=obj.parentNode;
      var x=pnode.parentNode;
      var y= x.parentNode;
    }
    function adjustLine(){
      var htreeLine,from,to;
      for(var i=0;i<lineInfos.length;i++){
        var lineInfo = lineInfos[i];
        from = document.getElementById(lineInfo[0]);
        to = document.getElementById(lineInfo[1]);
        htreeLine = lineInfo[2];
        document.body.appendChild(htreeLine);
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
          htreeLine.style["-webkit-transform"] = 'rotate('+ ANG +'deg)';
          htreeLine.style["-moz-transform"] = 'rotate('+ ANG +'deg)';
          htreeLine.style["-ms-transform"] = 'rotate('+ ANG +'deg)';
          htreeLine.style["-o-transform"] = 'rotate('+ ANG +'deg)';
          htreeLine.style["-transform"] = 'rotate('+ ANG +'180)';
          var toTop = parseInt(to.offsetTop);
          var toLeft = parseInt(to.offsetLeft);
          var fromTop = parseInt(from.offsetTop);
          var fromLeft = parseInt(from.offsetLeft);
          var childNodes1 = htreeLine.childNodes;
          var childNodes2 =childNodes1[0].childNodes;
          var imgObj = childNodes2[0];
          //document.getElementById("gg").innerHTML = "toTop"+"  "+toTop +"   "+ " fromTop "+fromTop +"toLeft"+"  "+ toLeft + "fromLeft"+fromLeft ;
          var height = htreeLine.style.height;
          var iHeight = parseInt(height.split("px")[0]);
          if((fromTop>fromLeft))
          {
            imgObj.style.margin = "4";
            imgObj.style.position = "absolute";
            imgObj.style.top = "50px";
            imgObj.style.left = "-13px";
            imgObj.style.transform = "rotate(625deg)";
          }
          if((fromTop<fromLeft))
          {
            imgObj.style.margin = "3";
            var iHeight = parseInt(height.split("px")[0]);
            imgObj.style.position = "absolute";
            imgObj.style.top = iHeight-100 +"px";
          }
          if((toTop > fromTop) && (toLeft > fromLeft)){
            imgObj.style.margin = "2";
            imgObj.style.transform = "rotate(630deg)";
            imgObj.style.position = "absolute";
            imgObj.style.top = "175px";
          }
          if(toTop>fromTop)
          {
            imgObj.style.margin = "1";
            imgObj.style.position = "absolute";
            imgObj.style.top = iHeight-90 +"px";
            imgObj.style.left = "-14px";
            imgObj.style.transform = "rotate(812deg)";
        }
         if(toTop<toLeft)
          {
            imgObj.style.margin = "0";
            imgObj.style.transform = "rotate(265deg)";
            imgObj.style.position = "absolute";
            imgObj.style.left = "-14px";
            imgObj.style.top = "53px";
          }
        if(toTop>fromTop && toLeft>fromLeft)
        {
          imgObj.style.transform = "rotate(453deg)";
          imgObj.style.top = iHeight-100 +"px";
          imgObj.style.left = "-14px";
          imgObj.style.position = "absolute";
        }
          if(toTop<fromTop && toLeft<fromLeft)
          {
            imgObj.style.transform = "rotate(995deg)";
            imgObj.style.left = "-16px";
            imgObj.style.top = iHeight-200 +"px";
            imgObj.style.position = "absolute";
          }
          htreeLine.style.top    = top+'px';
          htreeLine.style.left   = left+'px';
          htreeLine.style.height = H + 'px';
        }
      }
    }
  </script>
</head>
<body onload="load();">
<div  id="HtreeDiv">
  <h1 id="hh" align="center"></h1>
  <h1 id="gg" align="center"></h1>


</div>
</body>
</html>
