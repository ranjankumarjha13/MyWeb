<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 07-01-2019
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="bootstrapcumjavascriptfile.jsp"/>
<html>
<style>
    .card
    {
        border: 1px solid;
        height: 300px;
        width: 200px;
        border-radius: 1em;
        margin: 10px;
        box-shadow: 5px 5px 10px grey;
    }
    .mobileheader
    {
        margin: 10px;
        height: auto;
    }
    .mobilecontent
    {
        margin: 10px;
        height: 200px;
        background-color: green;
        overflow-x: auto;
        overflow-y: auto;
        box-shadow: 5px 5px 10px pink;
    }
    .mobilefooter{
        height: 90px;
        margin: 10px;
    }
    .mobilecontent1
    {
        margin: 10px;
        height: 200px;
        background-color: wheat;
        overflow-x: auto;
        overflow-y: auto;
        box-shadow: 5px 5px 10px pink;
    }
    button:hover
    {
        background-color: #0066FF;
    }
    .mobcontentdiv2
    {
        margin: 10px;
        height: 200px;
        background-color:;

        box-shadow: 5px 5px 10px pink;
    }
</style>
<head>
    <title></title>
</head>
<body>
<div class="col-sm-4">
</div>

<c:forEach var="x" items="${mobiledetails}">
    <div class="col-sm-3">
    <div class="card">
        <div class="mobileheader">
            <div class="col-sm-4">
            </div>
              <div class="col-sm-4" style="border: 1px solid;border-radius: 2em;height: 12px">
              </div>
              <span>${x.mobilename}</span>
              <div class="col-sm-4">
              </div>
            <div>
            </div>
        </div>
        <div id="contactDiv" class="mobilecontent1" style="display: none">
        </div>
        <div id="callnumberdiv" class="mobcontentdiv2" style="display: none">

        </div>
        <div class="mobilecontent" style="border-bottom: 1px solid;margin-top: 0px" id="mobcontentdiv">
            <div style="color: white;border-bottom: 1px solid">
                <span style="font-size: 16px"><u>Manufacured in Year:</u><br></span>
                <span>
                        ${x.manufactureyear}
                </span>
            </div>
            <div style="color: white;border-bottom: 1px solid" >
                <span style="font-size: 16px"><u>IMEI Number:</u><br></span>
                <span>${x.mobileImei}</span>
            </div>
            <div style="color: white;border-bottom: 1px solid">

                <span style="font-size: 16px"><u>Mobile Model:</u><br></span>
                <span>${x.mobilemodel}</span>
            </div>
            <div style="color: white;border-bottom: 1px solid">
                <span style="font-size: 16px"><u>Description:</u><br></span>${x.mobileDescription}
            </div>
        </div>
        <div class="mobilefooter">
           <c:forEach var="butonaction" items="${x.mobileButtonActionDtos}">
               <button onclick="${butonaction.mobileaction}">${butonaction.buttonlabel}</button>
           </c:forEach>
        </div>
    </div>
</div>
</c:forEach>
<div class="col-sm-4">
</div>
</body>
<script src="res/scripts/card.js"></script>
</html>
