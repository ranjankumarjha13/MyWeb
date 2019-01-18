<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 04-01-2019
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html>
<style>
  .card
  {
    width: 100%;
    border: 1px solid;
    border-radius: 2em;
    height: auto;
    box-shadow: 5px 5px 5px 5px gray;
    margin: 20px;;
  }
  .haeder
  {
    height: 20px;
  }
  .content
  {
    margin-top: 10px;
    height: 100px;
  }
  .footer
  {
    margin-top: 10px;
    height: 20px;
  }
  .fullcard
  {
    border: 1px solid;
   margin: 20px ;
    height: 1100px;
    border-radius: 2em;
  }
</style>
<head>
    <title></title>
</head>
<body>
<div class="row fullcard">
<div class="col-sm-12">
  <h3 style="color: #007A00">Total Card :${fn:length(listofcard)}</h3>
  <c:forEach var="h" items="${listofcard}">
    <div class="col-sm-3">
    <div class="card">
      <div style="margin: 20px;">
      <div class="haeder" style="border-bottom: 1px solid black;color: #008AFF">
          ${h.title}
      </div>
      <div class="content" style="border-bottom: 1px solid black">
          ${h.content}
      </div>
      <div class="footer">
        <c:set var="cardActionDTO" value="${h.cardActionDTO}"/>
        <c:forEach var="x" items="${cardDTO.cardActionDTO}">
        <button type="button" onclick="${x.action}" class="${h.buttnclass}">${x.label}</button>
        </c:forEach>
      </div>
      </div>
    </div>
    </div>
  </c:forEach>
</div>
</div>
</body>
</html>
