<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 21-01-2019
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="bootstrapcumjavascriptfile.jsp"/>
<html>
<head>
    <title></title>
</head>
<body>
<c:set var="o" value="${requestScope.optiondata}"/>
<c:if test="${o ==1}">
    <div class="row" style="font-family: bold">
        <div class="col-sm-12" st>
            <h3><u>Getting started:-</u></h3>
        </div>
        <div class="col-sm-12">
            Welcome to Angular! Angular helps you build modern applications for the web, mobile, or desktop.
            This guide shows you how to build and run a simple Angular app. You'll use the Angular CLI tool to accelerate development, while adhering to the Style Guide recommendations that benefit every Angular project.
            This guide takes less than 30 minutes to complete. At the end of this guide—as part of final code review—there is a link to download a copy of the final application code. (If you don't execute the commands in this guide, you can still download the final application code.)
        </div>
        <div class="col-sm-12">
            <h3><u>Prerequisites:-</u></h3>
        </div>
        <div class="col-sm-12">
            Angular requires Node.js version 8.x or 10.x.
            To check your version, run node -v in a terminal/console window.
            To get Node.js, go to nodejs.org.
        </div>
        <div class="col-sm-12">
            <h3><u>npm package manager</u></h3>
        </div>
        <div class="col-sm-12">
            Angular, the Angular CLI, and Angular apps depend on features and functionality provided by libraries that are available as npm packages. To download and install npm packages, you must have an npm package manager.
            This Quick Start uses the npm client command line interface, which is installed with Node.js by default.
            To check that you have the npm client installed, run npm -v in a terminal/console window.
        </div>
        <div class="col-sm-12">
            <h3><u>Step 1: Install the Angular CLI</u></h3>
        </div>
        <div class="col-sm-12">
            You use the Angular CLI to create projects, generate application and library code, and perform a variety of ongoing development tasks such as testing, bundling, and deployment.
            Install the Angular CLI globally.
            To install the CLI using npm, open a terminal/console window and enter the following command:
        </div>
        <div class="col-sm-12" style="border: 1px solid;background-color: black;height: 80px;color: darkgreen">
            <h4 >npm install -g @angular/cli</h4 >
        </div>
        <div class="col-sm-12">
            <h3><u>Step 2: Create a workspace and initial application</u></h3>
        </div>
        <div class="col-lg-12">
            You develop apps in the context of an Angular workspace. A workspace contains the files for one or more projects. A project is the set of files that comprise an app, a library, or end-to-end (e2e) tests.
        </div>
        <div class="col-lg-12">
            To create a new workspace and initial app project:
        </div>
        <div class="col-lg-12" style="margin-left: 60px;">
            1 .Run the CLI command ng new and provide the name my-app, as shown here:
        </div>

    </div>
    </c:if>
<c:if test="${o ==2}">
   <div class="col-lg-12">
       <h3><u>The Application Shell</u></h3>
   </div>
    <div class="col-lg-12">
        You begin by creating an initial application using the Angular CLI. Throughout this tutorial, you’ll modify and extend that starter application to create the Tour of Heroes app.
    </div>
    <div class="col-lg-12">
        <h3><u>Create a new workspace and an initial application</u></h3>
    </div>
    <div class="col-lg-12">
        You develop apps in the context of an Angular workspace. A workspace contains the files for one or more projects. A project is the set of files that comprise an app, a library, or end-to-end (e2e) tests. For this tutorial, you will create a new workspace.
    </div>
</c:if>
<c:if test="${o==0}">
    <div class="col-lg-12" style="margin-left: 185px;">
        <img src="data:image/png;base64,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" height="65%" width="65%">
    </div>
    <div class="col-lg-12">
        <div class="col-lg-4"></div>
        <div class="col-lg-4" style="border: 1px solid;height: 60px;border-radius: 2em;background-color: #0066FF;;color: white">
            <div style="margin-top: 13px"><a style="color: white;font-family: bold;margin-left: 30%;font-size: 20px" onclick="CLNav.getdata(1)" >GET STARTED</a></div>
        </div>
        <div class="col-lg-4"></div>
    </div>
    <div class="col-lg-12">
        <p align="center" style="font-size: 25px;color: #0066FF ">
            Develop Across All Platforms</p>
    </div>
</c:if>
</body>
<script src="res/scripts/scripts/myscript/ajax.js"></script>
</html>
