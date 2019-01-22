<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 11-01-2019
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="bootstrapcumjavascriptfile.jsp"/>
<html>
<style>
    th{
        font-size: 20px;;
    }
   .space
    {
    margin-top: 10px;
    }
    .modal-content
    {
        width: 77% !important;
    }


</style>
<head>
    <title></title>
</head>
<body>
<div class="col-sm-12">
    <div class="col-sm-9">
    </div>
</div>
<div class="container-fluid">
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Name</th>
            <th>Age</th>
            <th>Weight</th>
            <th>City</th>
            <th>DOB</th>
            <th style="color: red">Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${data}" var="v">
        <tr>
            <td>${v.name}</td>
            <td>${v.age}</td>
            <td> ${v.weight}</td>
            <td> ${v.city}</td>
            <td> ${v.dob}</td>
            <td> <span><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#myModal">ADD</button></span>

               <span><button type="button" class="btn btn-secondary btn-sm"   onclick="ClTab.deltestudnet('${v.name}')">DELETE</button></span>
            </td>
        </tr>
        </c:forEach>
        </tbody>

    </table>
</div>

<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
           <%-- <div id="viewresponse">

            </div>--%>
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">ADD STUDENT</h4>
            </div>
            <div class="modal-body">
                <form id="myform" method="post">
                    <div>
                   <label>Name:-</label>
                   <div>
                       <input type="text" name="sb.name" class="form-control">
                   </div>
                    </div>
                <div class="space">
                    <label>Age:-</label>
                    <div>
                        <input type="text" name="sb.age" class="form-control">
                    </div>
                </div>
                <div class="space">
                    <label>Weight:-</label>
                    <div>
                        <input type="text" name="sb.weight" class="form-control">
                    </div>
                </div>
                <div class="space">
                    <label>City:-</label>
                    <div>
                        <input type="text" name="sb.city" class="form-control">
                    </div>
                </div>
                <div class="space">
                    <label>Dob:-</label>
                    <div>
                        <input type="text" name="sb.dob" class="form-control ">
                    </div>
                </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="ClTab.addstudent()">ADD</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal" >Close</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
