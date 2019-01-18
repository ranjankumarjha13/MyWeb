<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 04-01-2019
  Time: 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="bootstrapcumjavascriptfile.jsp"/>
<html>
<style>
  .maindiv{
  margin: 30px;
  }
  .modelclass{
    border: 1px solid;
      height: auto;
      border-radius: 1em;
      box-shadow: 5px 5px 5px 10px gray;
      width: 40%;
  }
  .haeder
  {
     /* border: 1px solid;*/
      height: auto;
  }
    .contentpart
    {
        margin-top: 10px;
       /* border: 1px solid;*/
        height: auto;
    }
    .footer
    {
        margin-top: 5px;
       /* border: 1px solid;*/
        height: auto;
        padding-bottom: 10px;
    }
    input:hover
    {
        background-color: #008AFF;
    }
</style>
<head>
    <script>
        function myfunction()
        {
           var x=document.getElementById("name").value;
            if(x==''|| x.length<5)
            {
                document.getElementById("nameeror").innerHTML="Name Should not be empty"
                document.getElementById("lastnameerror").innerHTML="Name Should not be empty"
                document.getElementById("emailerror").innerHTML="Name Should not be empty"
                document.getElementById("passerror").innerHTML="Name Should not be empty"
                document.getElementById("addresserror").innerHTML="Name Should not be empty"
                document.getElementById("ziperror").innerHTML="Name Should not be empty"


            }

        }
    </script>
    <title>Grid</title>
</head>
<body>
<%--onclick="ClTab.getcard()"--%>
<form action="card!getCard.do" method="post">
<div class="maindiv">
    <div class="col-sm-3">
    </div>
    <div class="col-sm-6 modelclass">
        <div class="haeder">
            <h3>
                ADD
            </h3>
        </div>
        <hr>
        <div class="contentpart">
     <div class="col-lg-12">
      <div class="col-sm-6">
                <label>Name:</label>
               <div>
                   <input type="text" class="form-control" id="name">
               </div>
                <div id="nameeror" style="color: red">

                </div>
           </div>
            <div class="col-sm-6">
                <label>Lastname:</label>
                <div>
                    <input type="text" class="form-control">
                </div>
                <div id="lastnameerror" style="color: red">

                </div>
            </div>
        </div>
            <div class="col-lg-12">
                <div class="col-sm-6">
                    <label>Name:</label>
                    <div>
                        <input type="text" class="form-control">
                    </div>
                    <div id="emailerror" style="color: red">

                    </div>
                </div>
                <div class="col-sm-6">
                    <label>Lastname:</label>
                    <div>
                        <input type="text" class="form-control">
                    </div>
                    <div id="passerror" style="color: red">

                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="col-sm-6">
                    <label>Name:</label>
                    <div>
                        <input type="text" class="form-control">
                    </div>
                    <div id="addresserror">
                    </div>
                </div>
                <div class="col-sm-6">
                    <label>Lastname:</label>
                    <div>
                        <input type="text" class="form-control">
                    </div>
                    <div id="ziperror">
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div class="footer">
            <button class="btn btn-primary" >Register</button>

        </div>
    </div>
    <div class="col-sm-3">
    </div>
</div>
</form>
</body>

</html>
