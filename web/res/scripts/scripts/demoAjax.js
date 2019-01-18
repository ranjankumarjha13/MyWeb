var demoAjax = new function(){
    this.clickButton=function(){

        con.sendPostRequest("demo!clickButton.do",null,null,"demoAjax.funHandler");
        //alert();
        //callAJAX.sendRequestAJAX("GET","demo!clickButton.do","resId");
    }
    this.funHandler = function(response){
        //alert(response);
        document.getElementById("resId").innerHTML=response;
    }
};