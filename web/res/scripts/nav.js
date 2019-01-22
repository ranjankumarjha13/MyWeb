/**
 * Created by admin on 21-01-2019.
 */
var CLNav=new function()
{
    this.getSubmenuitems=function()
    {
        document.getElementById("view").style.display="";;
        document.getElementById("rightangle").style.display="none";
        document.getElementById("downangle").style.display="";

        /*if(objIcon.getAttribute("class")=="fa fa-chevron-circle-down")
            objIcon.setAttribute("class","fa fa-chevron-circle-right");
        else
            objIcon.setAttribute("class","fa fa-chevron-circle-down");*/

       /* if(objIcon.getAttribute("isDown")=="false") {
            objIcon.style.transform = "rotate(0deg)";
            objIcon.setAttribute("isDown","true");
        }
        else {
            objIcon.style.transform = "rotate(180deg)";
            objIcon.setAttribute("isDown","false");
        }*/
    }
    this.hidesubmenyitem=function()
    {
        document.getElementById("view").style.display="none";;
        document.getElementById("downangle").style.display="none";
        document.getElementById("rightangle").style.display="";
    }
    this.getdata=function(ioption)
    {
        /*callAJAX.sendRequestAJAX("GET","getview!getpage.do?option="+ioption,"viewpage")*/
        con.sendGetRequest("getview!getpage.do?option="+ioption,null,null,"CLNav.resHandler");
    }
    this.resHandler = function(res){
        document.getElementById("viewpage").innerHTML=res;
    }
};
