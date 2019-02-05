/**
 * Created by admin on 05-02-2019.
 */
var lineInfos = [];
var inital;
var final;
var mainDV = document.getElementById("containerDiv");
var id=0;
var myObj = {
    "id":01,
    "Companyname":"Focus",
    "employee":[ "TL 1", "Tl2", "TL3" ],
    "Tl":["Ranjan","Ranjan","Tapas","Mayur","YYY","XXX","Abc","ZZZ"],
    "developer":["Developer1","Developer2","Developer3","Developer4"]
};
//This function will be called on loading the page and it will create default rooot.
function init(element){
    //creating div for deafult node.
    var myDiv = document.createElement("div");
    //creating div for icon which will apeare on hover
    var hovericon=document.createElement("DIV");
    //creating class for hovericon div to apply css and style
    hovericon.setAttribute("class","edit");
    //creating i element for + option to create next node and seting class to apply css
    var ObjI=document.createElement("i");
    ObjI.setAttribute("data-toggle","tooltip");
    ObjI.setAttribute("title","Add Node");
    ObjI.style.margin="55px";
    ObjI.setAttribute("class","fa fa-plus")
    ObjI.setAttribute("onclick","createNode("+0+")")
    myDiv.setAttribute("class","myDiv");
    myDiv.setAttribute("id",+id);
    myDiv.setAttribute("onmouseover","dragElement(this)");
    var mydivheader = document.createElement("div");
    mydivheader.innerHTML=myObj.Companyname;
    mydivheader.setAttribute("class","mydivheader");
    myDiv.appendChild(mydivheader);
    mainDV.appendChild(myDiv);
    hovericon.appendChild(ObjI);
    mydivheader.appendChild(hovericon);
}
//This function is responsible to  create noode.
function createNode(parentNodeId)
{
    //incrementing id variable to set into node id initialy in init() it is set to zero.
    ++id;
    var pid=document.getElementById(parentNodeId);
    //creating div for creating nw node
    var myDiv = document.createElement("div");
    //creating div for hover icon which will appear on hover
    var hovericon=document.createElement("DIV");
    hovericon.setAttribute("class","hovericon");
    hovericon.setAttribute("class","edit");
    myDiv.style.top=pid.offsetTop+"px";
    myDiv.style.left=pid.offsetLeft+220+"px";
    myDiv.style.left=pid.offsetLeft+230+"px";
    var ObjI=document.createElement("i");
    var ObjI=document.createElement("i");
    var iSpan1=document.createElement("SPAN");
    var ispan2=document.createElement("SPAN");
    ObjI.setAttribute("class","fa fa-plus ");
    ObjI.setAttribute("data-toggle","tooltip");
    ObjI.setAttribute("title","Add Node");
    ObjI.style.margin="18%";
    ObjI.setAttribute("onclick","createNode("+id+")")
    var ObjI2=document.createElement("i");
    ObjI2.setAttribute("data-toggle","tooltip");
    ObjI2.setAttribute("title","Delete Node");
    ObjI2.setAttribute("class","fa fa-trash rotate");
    ObjI2.setAttribute("onclick","deleteNode("+id+")");
    ObjI2.style.margin="20%";
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
    hovericon.appendChild(ispan2);
    hovericon.appendChild(iSpan1);
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
    document.getElementById("containerDiv").appendChild(line);
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
    var lineinfo=[id,parentNodeId,line];
    lineInfos[lineInfos.length]=lineinfo;
    //calling adjustLine() to draw line between two nodes based on id.
    adjustLine();
}

//This function will be called to drag particular node.
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
//This function is responsible to establish connection between nodes.it is called inside drag() and createNode().
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
//This function is responsible to delete particular node .
function deleteNode(pid)
{
    alert("Delete Function called");
    console.log("Delete is called")
  /*  alert(pid)
    for(var i=0;i<lineInfos.length;i++) {
        var lineinfp = lineInfos[i];
        if (lineinfp[0] == pid) {
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
//This function is responsible to get Details of the node.
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
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
});



