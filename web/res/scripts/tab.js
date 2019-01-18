/**
 * Created by admin on 01-01-2019.
 */
var ClTab=new function()
{
    var i=0;
    this.addTab=function()
    {
        i++;
        callAJAX.sendRequestAJAX("POST","tab2!getStable.do?index="+i,"responsediv");
        var content=document.getElementById("responsediv").innerHTML;
        tabbedPane.addTab("pan","Table"+i,content);
        return i;
    }
    this.register=function()
    {
        var isvalid=true;
        isvalid=Validation.checkMandatory(document.getElementById('name'),"Name",0,false);
        isvalid=Validation.checkMandatory(document.getElementById('age'),"Age",1,true);
        if(isvalid)
        {
            var submitQuery=con.formData2QueryString(document.forms["myform"]);
            alert(submitQuery);
            callAJAX.sendRequestAJAX("POST","tab!getFormData.do?"+submitQuery,"respmse");
        }
    /*    action="tab!getFormData.do"*/
        /* var submitData = con.formData2QueryString(document.forms["myform"])*/
        /*var submitQuery=con.formData2QueryString(document.forms["myform"]);
         alert(submitQuery);
         callAJAX.sendRequestAJAX("POST","tab!getFormData.do","respmse");*/
        else{
            alert("Something went wrong Please fill the form")
        }
    }
    this.getcard=function()
    {
        alert("called")
        callAJAX.sendRequestAJAX("POST","card!getCard.do");
    }
    this.getStudentDetails=function()
    {
        callAJAX.sendRequestAJAX("GET","get!getStudentDetails.do","viewData")
    }
    this.addstudent=function()
    {
        var submitQuery=con.formData2QueryString(document.forms["myform"]);
        /*alert(submitQuery);*/
        callAJAX.sendRequestAJAX("POST","send!addStudentdetails.do?"+submitQuery,"viewresponse")
        this.getStudentDetails();
        document.getElementById("view").style.display="";
    }
    this.deltestudnet=function(name)
    {
        alert(name)
        callAJAX.sendRequestAJAX("POST","delete!deletestudentDetails.do?name="+name,"dvEditView");
        this.getStudentDetails();
    }
}
