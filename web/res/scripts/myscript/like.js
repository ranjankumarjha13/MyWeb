/**
 * Created by admin on 13-12-2018.
 */
var CLlike=new function()
{
   this.myfunction=function(x)
   {
       var value=true;
       if(x.getAttribute("class")=="fa fa-thumbs-up") {

           x.setAttribute("class", "fa fa-thumbs-down");
           value = true;
       }
       else {
           x.setAttribute("class", "fa fa-thumbs-up");
           value = false;
       }

       callAJAX.sendRequestAJAX("GET","like!like.do?Status="+value);
   }
    this.validate=function()
    {
        alert("called")
    }
}