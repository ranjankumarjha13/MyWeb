<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 30-01-2019
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script>
    function getNodeDetails()
    {

     var x=document.getElementById("parentNode").childNodes;
     var y=document.getElementById("childNode1").childNodes;
       alert(x.length)
      alert(y.length)

    }
  </script>
    <title>Tree Structure Using Linked List</title>
</head>
<body>
<div >
  <div id="parentNode">

 <div id="childNode1">
      <h1></h1>
      <h2></h2>
      <h3></h3>
  </div>
    <div id="childNode2">
    </div>
    <div id="childNode3">
    </div>
  </div>
</div>
<button onclick="getNodeDetails()">Node Details</button>
</body>
</html>
