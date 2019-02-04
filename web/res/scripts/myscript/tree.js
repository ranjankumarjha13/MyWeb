/**
 * Created by admin on 04-02-2019.
 */

var lineInfos = [];
var mainDV = document.getElementById("containerDiv");
var id=0;

//This method is called at the time of loadind.
function init(element){
    //this div is crated at the time of loading
    var myDiv = document.createElement("div");

    //creating i icon for adding new node here there is no need to put delete icon since root node cant be deleted
    var ObjI=document.createElement("i");

    //adding class to i element
    ObjI.setAttribute("class","fa fa-plus");

    //setting click event to add new node
    ObjI.setAttribute("onclick","createNode("+0+")");

    //setting class to myDiv to apply css style
    myDiv.setAttribute("class","myDiv");

    //setting id to myDiv
    myDiv.setAttribute("id",+id);
    //adding drag event onmouseover
    myDiv.setAttribute("onmouseover","dragElement(this)");

    //creating headerdiv inside myDiv
    var mydivheader = document.createElement("div");
    mydivheader.setAttribute("class","mydivheader");
    mydivheader.innerHTML="Root Id"+":"+id;
    myDiv.appendChild(mydivheader);
    mainDV.appendChild(myDiv);
    myDiv.appendChild(ObjI);
    //Calculating number of nodes at the time of loading;
    calculateNumberofnodes();
}

//This method is called to create new Node.
function createNode(parentNodeId)
{
    ++id;
    var pid=document.getElementById(parentNodeId);
    //it will create new DIV for creating node
    var myDiv = document.createElement("div");

    //i have set style to new node to appear just beside of root node
    myDiv.style.top=pid.offsetTop+"px";
    myDiv.style.left=pid.offsetLeft+220+"px";
    myDiv.style.left=pid.offsetLeft+230+"px";

    //here i created one onclick + to create new node.
    var ObjI=document.createElement("i");

    //setting class for icon
    ObjI.setAttribute("class","fa fa-plus");

    //setting onclick event for creating new node
    ObjI.setAttribute("onclick","createNode("+id+")");

    //This is for creating another i icon for deleting particular node
    var ObjI2=document.createElement("i");

    //setting class for icon
    ObjI2.setAttribute("class","fa fa-cut");
    //here i created one onclick  to delete particular node.
    ObjI2.setAttribute("onclick","deleteNode("+id+")");

    //setting margin between + icon and delete icon
    ObjI2.style.marginLeft="15px";

    //setting class in mYDiv Object for drag event and adding drag event onmouseover with creating id;
    myDiv.setAttribute("class","myDiv");
    myDiv.setAttribute("onmouseover","dragElement(this)");
    myDiv.setAttribute("id",+id);
    myDiv.setAttribute("onmouseover","dragElement(this)");

    //creating another div as myHeader inside myDiv;
    var mydivheader = document.createElement("div");

    //setting class
    mydivheader.setAttribute("class","mydivheader");

    //printing node name on it with particular id
    mydivheader.innerHTML="Child Id"+":"+id;
    //appending myhaeder inise myDiv
    myDiv.appendChild(mydivheader);

    //appending myDiv inside mainDiv;
    mainDV.appendChild(myDiv);
    myDiv.appendChild(ObjI);
    myDiv.appendChild(mydivheader);
    mainDV.appendChild(myDiv);
    myDiv.appendChild(ObjI);
    myDiv.appendChild(ObjI2);

    //creating one div which will be for arrow image for direction on node
    var arrow=document.createElement("DIV");
    //setting id to div
    arrow.setAttribute("id","arrow");

    //creating image attribute and seeting height width etc..
    var img = document.createElement("IMG");
    img.setAttribute("src","https://cdn2.iconfinder.com/data/icons/bold-ui/100/right-128.png");
    img.setAttribute("width", "50");
    img.setAttribute("height", "30");
    img.setAttribute("style","transform: rotate(267deg)");
    img.setAttribute("style","margin-left: -23px");

    //appending img inside arrow
    arrow.appendChild(img);

    //creating line object
    var line=document.createElement("Div");

    //setting class
    line.setAttribute("class","line");

    //setting id
    line.setAttribute("id","line_"+parentNodeId+"_"+id);
    document.getElementById("containerDiv").appendChild(line);

    //since arrrow will appear on line so appending inside line
    line.appendChild(arrow);


    //creating div for circle icon to get details of node
    var icircle=document.createElement("Div");

    //setting id
    icircle.setAttribute("id","icircle");

    //creating i and setting class and onclick event for getting details.
    var ic=document.createElement("i");
    ic.setAttribute("class","fa fa-info-circle");
    ic.setAttribute("onclick","getDetails(this)")
    icircle.appendChild(ic);
    line.appendChild(icircle);
    icircle.style.marginLeft="-6px";

    //putting id as 1st ,parentnodeid as 2nd and lineobject as 3rd in the lineinfos array
    var lineinfo=[id,parentNodeId,line];
    lineInfos[lineInfos.length]=lineinfo
    //callingg adjustLine() method to connect line between node
    adjustLine();
    //calculateNumberofnodes() method is  for calculating number od nodes.
    calculateNumberofnodes();
}

//This method is called connect two node which is called inside createNode(parentNodeId),dragElement(elmnt).
function adjustLine(){
    for(var i=0;i<lineInfos.length;i++){
        var lineInfo = lineInfos[i];
        var from = document.getElementById(lineInfo[0]);
        var to = document.getElementById(lineInfo[1]);
        var line = lineInfo[2];

        //appending line into mainDiv to connect line.
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

//THis method is called to calculate number of nodes which is called inside init() and createNode().
function calculateNumberofnodes()
{
    document.getElementById("numberofnode").innerHTML=id+1;
}

//This method is called to delete particular node.
function deleteNode(pid)
{
    alert("Delete Function alled")
   /* for(var i=0;i<lineInfos.length;i++)
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

//This method is called to get details of node it is clicked action which is put on line.
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



//This method is for drag event.
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

