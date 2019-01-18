/**
 * Created by admin on 12-12-2018.
 */
var CLSearch=new function()
{
    this.searchContent=function(obj)
    {
        var value=obj.value;
        if(value.length>0)
      callAJAX.sendRequestAJAX("GET","viewData!viewDetails.do?searchValue="+value,"viewdiv");
    /*  con.sendGetRequest("viewData!viewDetails.do?searchValue="+value,null,null,"CLSearch.response()");*/


        else
        {
            document.getElementById("viewdiv").innerHTML="";
        }
    }
     this.response=function(id)
    {
        var value=document.getElementById(id).innerHTML;
        document.getElementById("v").innerHTML=value;

    }
};