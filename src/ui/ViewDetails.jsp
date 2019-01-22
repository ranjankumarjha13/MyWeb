<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 05-12-2018
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="FocusTag" uri="/tlds/fcomps" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
  .searchcontainer{
    border: 1px solid #eaeaea;
    position: absolute;
    width: 100%;
    background-color: white;
    box-shadow: 5px 5px 15px #ccc;

  }
</style>
<div class="searchcontainer">
    <c:forEach items="${data}" var="v">
   <div STYLE="padding: 5px" >
       <span id="row-${v.name}">
           ${v.name}
           ${v.mobile}
           ${v.email}
           ${v.address}
           ${v.zipcode}
       </span>
       <a href="#" onclick="CLSearch.response('row-${v.name}')" data-toggle="modal" style="float: right" data-target="#myModal"><i class="fa fa-location-arrow"></i></a>
   </div>
    </c:forEach>
</div>
</body>
<script src="res/scripts/scripts/myscript/search.js"></script>
<script src="res/scripts/myscript/index.js"></script>
<script src="res/scripts/myscript/ajax.js"></script>
<script src="res/scripts/myscript/viewdetails.js"></script>
<script src="res/scripts/validate.js"> </script>
<script src="res/scripts/CallDetails.js" ></script>
<script src="res/scripts/app.js" ></script>
<script src="res/scripts/ActionBar.js"> </script>
<script src="res/scripts/button.js"> </script>
<script src="res/scripts/combobox.js"></script>
<script src="res/scripts/CrossBrowser.js"> </script>
<script src="res/scripts/calendar.js"> </script>
<script src="res/scripts/calendar-en.js"> </script>
<script src="res/scripts/calendar-setup.js"> </script>
<script src="res/scripts/connect.js" ></script>
<script src="res/scripts/constants.js" ></script>
<script src="res/scripts/dialog.js" ></script>
<script src="res/scripts/dialogbox.js" ></script>
<script src="res/scripts/table.js"> </script>
<script src="res/scripts/tabmenu.js"> </script>
<script src="res/scripts/Taskpane.js"> </script>
<script src="res/scripts/tabpane.js"> </script>
<script src="res/scripts/Message.js"> </script>
<script src="res/scripts/uploadbar.js"> </script>
<script src="res/scripts/utilities.js"> </script>
<script src="res/scripts/validation.js"> </script>
<script src="res/scripts/jquery-2.0.3.js"></script>
</html>
