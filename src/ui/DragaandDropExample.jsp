
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
  .line{
    position:absolute;
    width:1px;
    background-color:black
  ;
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
    height: 109px;
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

      var myObj = {
        "id":id,
        "Companyname":"Focus",
        "employee":[ "TL 1", "Tl2", "TL3" ],
        "Tl":["Ranjan","Tapas","Massom","Mayur","Sumit","Ranjan","Yogesh","Manish"]
      };
      function calculateNumberofnodes()
      {
        document.getElementById("numberofnode").innerHTML=id+1;
      }
      function createNode(parentNodeId)
      {
        ++id;
        var pid=document.getElementById(parentNodeId);
        var myDiv = document.createElement("div");
        var hovericon=document.createElement("DIV");
        hovericon.setAttribute("class","hovericon");
        hovericon.setAttribute("class","edit");
        myDiv.setAttribute("onclick","getNodeid(this)");
        myDiv.style.top=pid.offsetTop+"px";
        myDiv.style.left=pid.offsetLeft+220+"px";
        myDiv.style.left=pid.offsetLeft+230+"px";
        var ObjI=document.createElement("i");
        var ObjI=document.createElement("i");
        var iSpan1=document.createElement("SPAN");
        var ispan2=document.createElement("SPAN");
        ObjI.setAttribute("class","fa fa-plus");
        ObjI.style.margin="19%";
        ObjI.setAttribute("onclick","createNode("+id+")")
        var ObjI2=document.createElement("i");
        ObjI2.setAttribute("class","fa fa-trash");
        ObjI2.setAttribute("onclick","deleteNode("+id+")")
        ObjI2.style.margin="19%";
        myDiv.setAttribute("class","myDiv");
        myDiv.setAttribute("onmouseover","dragElement(this)");
        myDiv.setAttribute("id",+id);
        myDiv.setAttribute("onmouseover","dragElement(this)");
        var mydivheader = document.createElement("div");
        mydivheader.setAttribute("class","mydivheader");
        mydivheader.innerHTML=myObj.Tl[id];;
        myDiv.appendChild(mydivheader);
        mainDV.appendChild(myDiv);
        myDiv.appendChild(ObjI);
        myDiv.appendChild(mydivheader);
        mainDV.appendChild(myDiv);
        iSpan1.appendChild(ObjI);
        ispan2.appendChild(ObjI2);
        hovericon.appendChild(iSpan1);
        hovericon.appendChild(ispan2);
        /*hovericon.appendChild(ObjI);
        hovericon.appendChild(ObjI2);*/
        mydivheader.appendChild(hovericon);
        var arrow=document.createElement("DIV");
        arrow.setAttribute("id","arrow");
        var img = document.createElement("IMG");
        img.setAttribute("src","https://cdn3.iconfinder.com/data/icons/google-material-design-icons/48/ic_play_arrow_48px-128.png");
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
        ic.setAttribute("class","fa fa-circle");
        ic.setAttribute("onclick","getDetails(this)")
        icircle.appendChild(ic);
        line.appendChild(icircle);
        icircle.style.marginLeft="-6px";
        var lineinfo=[id,parentNodeId,line];
        lineInfos[lineInfos.length]=lineinfo
        adjustLine();
        calculateNumberofnodes();
      }
      function deleteNode(pid)
      {
        alert("Delete Function Called")
        /*for(var i=0;i<lineInfos.length;i++)
        {
          var lineinfp=lineInfos[i];
          if(lineinfp[0]==pid)
          {
            var x=document.getElementById(pid).childNodes;
            mainDV.removeChild(document.getElementById(pid));
            mainDV.removeChild(lineinfp[2]);
            resetIndex(i);
          }
        }*/
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
        var hovericon=document.createElement("DIV");
        hovericon.setAttribute("class","edit");
        myDiv.setAttribute("onclick","getNodeid(this)")
        var ObjI=document.createElement("i");
        ObjI.style.margin="45px";
        ObjI.setAttribute("class","fa fa-plus")
        ObjI.setAttribute("onclick","createNode("+0+")")
        myDiv.setAttribute("class","myDiv");
        myDiv.setAttribute("id",+id);
        myDiv.setAttribute("onmouseover","dragElement(this)");
        var mydivheader = document.createElement("div");
        mydivheader.innerHTML=myObj.Companyname;
        mydivheader.setAttribute("class","mydivheader");
      /*  mydivheader.innerHTML="Root Id"+":"+id;*/
        myDiv.appendChild(mydivheader);
        mainDV.appendChild(myDiv);
        /*myDiv.appendChild(ObjI);*/
        hovericon.appendChild(ObjI);
        mydivheader.appendChild(hovericon);
        calculateNumberofnodes();
        createNode(parentNodeId);
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
//          document.getElementById("gg").innerHTML=line.style.transform;
          var deg = line.style.transform;
          deg = deg.substring(7,deg.length-4);
          deg = parseFloat(deg);
//          if(deg )
//          document.getElementById("gg").innerHTML=deg + " : "+to.offsetTop + " : "+from.offsetTop;
          var toTop = parseInt(to.offsetTop);
          var toLeft = parseInt(to.offsetLeft);
          var fromTop = parseInt(from.offsetTop);
          var fromLeft = parseInt(from.offsetLeft);

          var childNodes1 = line.childNodes;
          var childNodes2 =childNodes1[0].childNodes;
          var imgObj = childNodes2[0];
          /* document.getElementById("gg").innerHTML = toTop + " : "+fromTop +" = "+ toLeft + " : "+fromLeft ;*/
          if((toTop < fromTop) || ( toLeft  > fromLeft )){

            var height = line.style.height;
            var iHeight = parseInt(height.split("px")[0]);
            imgObj.style.transform = "rotate(450deg)";
            imgObj.style.position = "absolute";
            imgObj.style.top = (iHeight - 145) + "px";
            if((toTop > fromTop) && (toLeft > fromLeft)){
              imgObj.style.transform = "rotate(630deg)";
              imgObj.style.position = "absolute";
              imgObj.style.top = "0px";
            }
          }
          else{
            imgObj.style.transform = "rotate(270deg)";
            imgObj.style.position = "absolute";
            imgObj.style.top = "0px";

          }
          line.style.top    = top+'px';
          line.style.left   = left+'px';
          line.style.height = H + 'px';
        }
      }
    </script>
    <h2  style="color: white"><u>Tree Node Example:</u></h2>
    <div style="font-size: 20px;color: white;float: right;margin: 20px;font-family: boldcalc">
      <span><u>Total Number of  Node is::</u></span>
      <span id="numberofnode"></span>
    </div>
</body>
</html>


