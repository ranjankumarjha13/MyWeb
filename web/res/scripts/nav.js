/**
 * Created by admin on 21-01-2019.
 */
var CLNav=new function()
{
    this.getSubmenuitems=function()
    {
      document.getElementById("view").style.display="";;
    }
    this.getdata=function(ioption)
    {
        callAJAX.sendRequestAJAX("GET","getview!getpage.do?option="+ioption,"viewpage")
    }
};
