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
    <div class="row">
        <div class="col-sm-12">
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
            <h3>npm package manager</h3>
        </div>
        <div class="col-sm-12">
            Angular, the Angular CLI, and Angular apps depend on features and functionality provided by libraries that are available as npm packages. To download and install npm packages, you must have an npm package manager.

            This Quick Start uses the npm client command line interface, which is installed with Node.js by default.

            To check that you have the npm client installed, run npm -v in a terminal/console window.
        </div>
        <div class="col-sm-12">
            <h3>Step 1: Install the Angular CLI</h3>
        </div>
        <div class="col-sm-12">
            You use the Angular CLI to create projects, generate application and library code, and perform a variety of ongoing development tasks such as testing, bundling, and deployment.

            Install the Angular CLI globally.

            To install the CLI using npm, open a terminal/console window and enter the following command:
        </div>
        <div class="col-sm-12" style="border: 1px solid;background-color: black;height: 80px;color: white">
            <h4 align="center">npm install -g @angular/cli</h4>
        </div>
        <div class="col-sm-12">
            <h3>Step 2: Create a workspace and initial application</h3>
        </div>
        <div class="col-lg-12">
            You develop apps in the context of an Angular workspace. A workspace contains the files for one or more projects. A project is the set of files that comprise an app, a library, or end-to-end (e2e) tests.

            To create a new workspace and initial app project:

        </div>

    </div>
    </c:if>

<c:if test="${o ==2}">
   <div class="col-lg-12">
       <h3>The Application Shell</h3>

   </div>
    <div class="col-lg-12">
        You begin by creating an initial application using the Angular CLI. Throughout this tutorial, you’ll modify and extend that starter application to create the Tour of Heroes app.
    </div>
    <div class="col-lg-12">
        <h3>Create a new workspace and an initial application</h3>

    </div>
    <div class="col-lg-12">
        You develop apps in the context of an Angular workspace. A workspace contains the files for one or more projects. A project is the set of files that comprise an app, a library, or end-to-end (e2e) tests. For this tutorial, you will create a new workspace.
    </div>
</c:if>

</body>
<script src="res/scripts/scripts/myscript/ajax.js"></script>
</html>
