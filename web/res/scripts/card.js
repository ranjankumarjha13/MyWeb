/**
 * Created by admin on 07-01-2019.
 */
var CLcard=new function()
{
    this.callCard=function()
    {

        callAJAX.sendRequestAJAX("POST","mobile!getMobileDetails.do","responsediv");

    }
    this.callCardfirstmobile=function()
    {
        document.getElementById("mobcontentdiv").style.display="";
        document.getElementById("contactDiv").style.display="none";
        document.getElementById("callnumberdiv").style.display="none";
    }
    this.secondmoble=function()
    {
        document.getElementById("mobcontentdiv").style.display="none";
        callAJAX.sendRequestAJAX("POST","contacts!getContacts.do","contactDiv");
        document.getElementById("contactDiv").style.display="";
    }
    this.callNumber=function()
    {
        callAJAX.sendRequestAJAX("POST","call!callNumber.do","callnumberdiv");
         document.getElementById("callnumberdiv").style.display="";
        document.getElementById("contactDiv").style.display="none";
       document.getElementById("mobcontentdiv2").style.display="";
        document.getElementById("mobcontentdiv").style.display="none";

    }
}