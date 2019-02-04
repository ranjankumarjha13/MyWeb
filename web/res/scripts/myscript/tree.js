/**
 * Created by admin on 04-02-2019.
 */

var lineInfos = [];
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
    myDiv.style.left=pid.offsetLeft+220+"px";
    myDiv.style.left=pid.offsetLeft+230+"px";
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
        var deg = line.style.transform;
        deg = deg.substring(7,deg.length-4);
        deg = parseFloat(deg);
        var toTop = parseInt(to.offsetTop);
        var toLeft = parseInt(to.offsetLeft);
        var fromTop = parseInt(from.offsetTop);
        var fromLeft = parseInt(from.offsetLeft);
        var childNodes1 = line.childNodes;
        var childNodes2 =childNodes1[0].childNodes;
        var imgObj = childNodes2[0];
        if((toTop < fromTop) || ( toLeft  > fromLeft )){
            var height = line.style.height;
            var iHeight = parseInt(height.split("px")[0]);
            imgObj.style.transform = "rotate(450deg)";
            imgObj.style.position = "absolute";
            imgObj.style.top = (iHeight - 140) + "px";
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
