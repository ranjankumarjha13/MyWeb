<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10-01-2019
  Time: 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="bootstrapcumjavascriptfile.jsp"/>
<html>
<style>
  .first{
    border: 1px solid;
    height: 50px;
    /*border-radius: 2em;*/
    background-color: #555;
  }
  .second
  {
    /*border: 1px solid;*/
    height: auto;
    width: 100% !important;
    margin-top: 0px;
      overflow-y: scroll;
      overflow-x: auto;
   /* box-shadow: 10px 10px 10px grey;*/

  }
  .third
  {
    border: 1px solid;
    height: 50px;
    background-color: #555;
      position: fixed;
  }

   .footer {
       position: fixed;
       left: 0;
       bottom: 0;
       width: 100%;
       background-color: #555;
       color: white;
       text-align: center;
       height: 50px;
   }
</style>
<head>
  <script>
  </script>
    <title>BootStrap Example</title>
</head>
<body onload="ClTab.getStudentDetails();">
<div class="maindiv">
    <div class="col-sm-12 first">
    </div>
    <div class="col-sm-12 second"  id="viewData">
    </div>
    <div class="footer">
        <p>Footer</p>
    </div>
</div>
</body>
</html>
