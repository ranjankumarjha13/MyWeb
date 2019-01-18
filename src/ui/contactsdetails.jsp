<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 08-01-2019
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="bootstrapcumjavascriptfile.jsp"/>
<html>
<style>
    .callnumberdiv
    {
        border: 1px solid   ;
        margin: 10px;
        height: 200px;
        background-color: green;
        overflow-y: auto;
        box-shadow: 5px 5px 10px pink;
    }

</style>
<head>
    <title></title>
</head>
<body>
<%--<div id="callnumberdiv" style="display: none" class="callnumberdiv">

</div>--%>
<span style="color: red;font-size: 20px;"><marquee>Contacts Details</marquee></span>
  <c:forEach var="x" items="${contact}">
        <div >
          <u>${x.name}</u>
           <%-- <span style="float: right;color: green"><a href="#" style="color: green"><u>Call</u></a></span>--%>
            <span style="float: right;color: green; font-size: 23px"><i class="fa fa-phone" aria-hidden="true" onclick="CLcard.callNumber()"></i>
          </span>
        </div>
     <div style="border-bottom: 1px solid">
      ${x.number}
    </div>
  </c:forEach>
</body>
</html>
