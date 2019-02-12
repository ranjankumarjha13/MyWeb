/**
 * Created by admin on 05-02-2019.
 */
var lineInfos = [];
var inital;
var final;
var mainDV = document.getElementById("containerDiv");
var id=0;
var myDiv;
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
                        source : "node_1"
                    }/*,
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
                            }
                        ]
                    }*/]
            }
        ]
    }];
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
    init("Focus","node_0",null);
    var currChild = JsonData[0];
    getNodes(currChild);
}
function init(nodecontent,nodeid,nodePrentId) {
    //alert(nodecontent)
    myDiv = document.createElement("div");
    myDiv.setAttribute("parentId", nodePrentId);
    myDiv.setAttribute("curentId", nodeid);
    var objI1 = document.createElement("i");
    var objI2 = document.createElement("i");
    objI2.setAttribute("class", "fa fa-trash deleteTreeNode");
    objI2.setAttribute("title", "Click to Delete Node");
    objI2.setAttribute("onclick", "deleteNode(" + id + ")");
    objI1.setAttribute("title", "Click to Add Node");
    objI1.setAttribute("class", "fa fa-plus addTreeNode")
    objI1.setAttribute("onclick", "createNode('node_" + id + "')")
    myDiv.setAttribute("class", "myDiv");
    myDiv.setAttribute("id", nodeid);
    myDiv.setAttribute("onmouseover", "dragElement(this)");
    /*var mydivheader = document.createElement("div");
    var contentDiv = document.createElement("DIV");
    var iconDiv = document.createElement("DIV");
    iconDiv.setAttribute("class", "initicon");
    iconDiv.appendChild(ObjI);
    iconDiv.appendChild(objI2);
    contentDiv.setAttribute("class", "initcontent");
    contentDiv.innerHTML = nodecontent
    mydivheader.appendChild(contentDiv);
    contentDiv.appendChild(iconDiv);
    mydivheader.setAttribute("class", "mydivheader");
    myDiv.appendChild(mydivheader);*/
    myDiv.innerText = nodecontent;
    myDiv.appendChild(objI1);
    myDiv.appendChild(objI2);
    mainDV.appendChild(myDiv);
    adjustLine(nodePrentId,nodeid,true);
}
/*function createNode(pnode)
{
    /!*var myDiv = document.createElement("div");
    var input=document.createElement("input");
    input.setAttribute("placeholder","Add Data");
    input.setAttribute("type","text");
    var iconDiv=document.createElement("DIV");
    iconDiv.setAttribute("class","iconDiv");
    var ObjI=document.createElement("i");
    var ObjI=document.createElement("i");
    var iSpan1=document.createElement("SPAN");
    var ispan2=document.createElement("SPAN");
    ObjI.setAttribute("class","fa fa-plus ");
    ObjI.setAttribute("title","Click to Add Node");
    ObjI.style.margin="18%";
    ObjI.setAttribute("onclick","createNode("+id+")")
    var ObjI2=document.createElement("i");
    ObjI2.setAttribute("title","Click to  Delete Node");
    ObjI2.setAttribute("class","fa fa-trash");
    ObjI2.setAttribute("onclick","deleteNode("+id+")");
    ObjI2.style.margin="18%";
    myDiv.setAttribute("class","myDiv");
    myDiv.setAttribute("onmouseover","dragElement(this)");
    myDiv.setAttribute("id",+id);
    myDiv.setAttribute("onmouseover","dragElement(this)");
    var mydivheader = document.createElement("div");
    mydivheader.setAttribute("class","mydivheader");
    var contentDiv=document.createElement("DIV");
    contentDiv.setAttribute("class","content");
    myDiv.appendChild(mydivheader);
    mainDV.appendChild(myDiv);
    myDiv.appendChild(ObjI);
    myDiv.appendChild(mydivheader);
    iSpan1.appendChild(ObjI);
    ispan2.appendChild(ObjI2);
    iconDiv.appendChild(ispan2);
    iconDiv.appendChild(iSpan1);
    mydivheader.appendChild(input);
    mydivheader.appendChild(contentDiv);
    mydivheader.appendChild(iconDiv);
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
    icircle.style.marginLeft="-5px";*!/
}*/
function dragElement(elmnt) {
    var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
    if (elmnt) {
        /* if present, the header is where you move the DIV from:*/
        //var dv = elmnt.childNodes;
        //dv[0].onmousedown = dragMouseDown;
    //} else {
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

        document.getElementById("ii").innerText = (e.target).getAttribute("class");
        var curentId= (e.target).getAttribute("curentId");
        var parentId= (e.target).getAttribute("parentId");

        //adjustLine(parentId,curentId,false);

    }
    function closeDragElement() {
        document.onmouseup = null;
        document.onmousemove = null;
    }
}

function getLineObj(nodePrentId,nodeid){

    var line = document.getElementById("line_"+nodeid+"_"+nodePrentId);

}


function adjustLine(nodePrentId,nodeid,isCreateLine){

    //alert(nodePrentId+" " +nodeid);
    var line,from,to;

    /*line = document.createElement("DIV");
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
    var toTop = parseInt(to.offsetTop);
    var toLeft = parseInt(to.offsetLeft);
    var fromTop = parseInt(from.offsetTop);
    var fromLeft = parseInt(from.offsetLeft);
    var childNodes1 = line.childNodes;
    var childNodes2 =childNodes1[0].childNodes;
    var imgObj = childNodes2[0];
    //document.getElementById("gg").innerHTML = "toTop"+"  "+toTop + " fromTop "+fromTop +"toLeft"+ toLeft + "fromLeft"+fromLeft ;
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
            imgObj.style.top = iHeight-155 +"px";
        }
        if((fromTop>fromLeft))
        {
            var iHeight = parseInt(height.split("px")[0]);
            imgObj.style.position = "absolute";
            imgObj.style.top = iHeight-155 +"px";
        }
    }
    else{
        imgObj.style.transform = "rotate(270deg)";
        imgObj.style.position = "absolute";
        imgObj.style.top = "0px";
    }
    if(toTop>fromTop)
    {
        imgObj.style.top = "15px";
    }
    line.style.top    = top+'px';
    line.style.left   = left+'px';
    line.style.height = H + 'px';*/

}


/*function adjustLine(nodePrentId,nodeid,isCreateLine){

    var from,to,line;
    if(nodePrentId && nodeid){


        if(isCreateLine){

            //alert(from + " : "+to)
            line = document.createElement("DIV");
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
            document.getElementById("containerDiv").appendChild(line);
        }
        else{
            from = document.getElementById(nodeid);
            to = document.getElementById(nodePrentId);
            line = document.getElementById("line_"+nodeid+"_"+nodePrentId);
        }

        if(from && to){

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
            //document.getElementById("gg").innerHTML = "toTop"+"  "+toTop + " fromTop "+fromTop +"toLeft"+ toLeft + "fromLeft"+fromLeft ;
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
                    imgObj.style.top = iHeight-155 +"px";
                }
                if((fromTop>fromLeft))
                {
                    var iHeight = parseInt(height.split("px")[0]);
                    imgObj.style.position = "absolute";
                    imgObj.style.top = iHeight-155 +"px";
                }
            }
            else{
                imgObj.style.transform = "rotate(270deg)";
                imgObj.style.position = "absolute";
                imgObj.style.top = "0px";
            }
            if(toTop>fromTop)
            {
                imgObj.style.top = "15px";
            }
            line.style.top    = top+'px';
            line.style.left   = left+'px';
            line.style.height = H + 'px';

        }

    }


}*/
function deleteNode(pid)
{
  /*  console.log("Delete is called")
    alert(pid)
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




