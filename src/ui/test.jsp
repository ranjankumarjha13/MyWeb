<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 31-12-2018
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="bootstrapcumjavascriptfile.jsp"/>
<html>
<style>
</style>
<head>
  <script>
      function createtextArea(){
        var textarea=document.createElement("textarea");
          textarea.setAttribute("width","100%");
          textarea.setAttribute("height","50%");
          document.getElementById("inputarea").appendChild(textarea);
      }
      function createbutton() {
          var button=document.createElement("button");
          button.setAttribute("type","submit");
          button.setAttribute("class","btn btn-primary")
          var t = document.createTextNode("Register");
          button.appendChild(t)
          document.getElementById("inputarea").appendChild(button);
      }
      function createInput()  {
          var label=document.createElement("label");
          var label2=document.createElement("label");
          var labelvalue = document.createTextNode("Name:-");
          var labelvalue2= document.createTextNode("Password:-");
          var ip=document.createElement("input");
          var ip2=document.createElement("input")
          ip2.setAttribute("class","form-control");
          ip2.setAttribute("type","password");
          ip2.setAttribute("placeholder","enter password")
          label.appendChild(labelvalue);
          label.style.color="seagreen"
          label2.appendChild(labelvalue2);
          label2.style.color="seagreen"
          ip.setAttribute("placeholder","enter name");
          ip.setAttribute("class","form-control")
          var node = document.createTextNode("This is new.");
          var x=document.createElement("div");
          var y=document.createElement("div");
          x.appendChild(y);
          document.getElementById("inputarea").appendChild(x);
          document.getElementById("inputarea").appendChild(label);
          document.getElementById("inputarea").appendChild(ip);
          document.getElementById("inputarea").appendChild(label2);
          document.getElementById("inputarea").appendChild(ip2);
      }
    function createInputBox(){
        var va=document.getElementById("inputarea");
        var table=document.createElement("table");
        table.setAttribute("border","2");
        table.setAttribute("width","100%")
        var node = document.createTextNode("This is new.");
        var node1 = document.createTextNode("This is second.");
        var tr1=document.createElement("tr");
        var tr2=document.createElement("tr");
        var td=document.createElement("td");
        var td1=document.createElement("td");
        var t = document.createTextNode("cell");
        td.appendChild(t);
        td.appendChild(node )
        td.appendChild(node1 )
        td1.appendChild(node )
        td1.appendChild(node1 )
        tr1.appendChild(td);
        tr2.appendChild(td1);
        table.appendChild(tr1);
        table.appendChild(tr2);
        document.getElementById("inputarea").appendChild(table);
    }
      function cretaeTExt() {
          var x = document.createElement("H1");
          var t = document.createTextNode("Welcome to My Homepage");
          x.appendChild(t);
          document.body.appendChild(x);
      }
  </script>
</head>
<body>
<button onclick="createInputBox()" class="btn btn-default">Create Table</button>
<button onclick="cretaeTExt()" class="btn btn-default">Text</button>
<button onclick="createInput()" class="btn btn-default">Createinput</button>
<button onclick="createbutton()" class="btn btn-default">CreateButton</button>
<button onclick="createtextArea()" class="btn btn-default">CreateTextArea</button>

<div class="col-sm-12">
  <div class="col-sm-4">
  </div>
  <div class="col-sm-4" id="inputarea" style="border: 1px solid;height: 90%;border-radius: 2em">
  </div>
  <div class="col-sm-4">
  </div>
</div>
</body>
</html>
