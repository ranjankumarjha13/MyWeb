
var CLvalidate=new function()
{

    this.checkLoginValidation=function()
    {

        var username=document.getElementById("name").value;
        var password=document.getElementById("password").value;
        if(username.length<10||username=='')
        {
            alert("Please fill the correct details");
        }

        /* Validation.checkMandatory(document.getElementById("name"),"Name",0,false);
        Validation.checkMandatory(document.getElementById("password"),"Password",0,true);*/

    }
    this.checkRegistervalidation=function()
    {
        alert("Register")
       /* Validation.checkMandatory(document.getElementById("name"),"Name",0,false);
        Validation.checkMandatory(document.getElementById("mobile"),"Mobile",0,false);
        Validation.checkMandatory(document.getElementById("email"),"Email",0,false);
        Validation.checkMandatory(document.getElementById("password"),"Password",0,false);
        Validation.checkMandatory(document.getElementById("cpassword"),"ConfirmPassowrd",0  ,false);
        Validation.checkMandatory(document.getElementById("city"),"City",0,true);*/
    }
};