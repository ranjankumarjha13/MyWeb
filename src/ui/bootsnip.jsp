<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 07-01-2019
  Time: 13:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="focustags" uri="/tlds/fcomps" %>
<c:import url="bootstrapcumjavascriptfile.jsp"/>
<html><style>
  body{
    width: 100%;
    height: 100%;
  }
  .card{
    border: 1px solid;
    height: 500px;
      border-radius: 2em;
      box-shadow: 5px 5px 5px 5px grey;
  }
  .storeblock
  {
    /*  border: 1px solid;*/
      height: 200px;
      margin-top: 5px;
      border-radius: 2em;
  }
.topheader{
    border: 1px solid;
    border-radius: 2em;
    height: 40px;
    background-color: #29A0CC;
    margin: 5px;
}
    .innerstore
    {
        /*border: 1px solid;*/
        border-radius: 2em;
        height: 180px;
    }
</style>
<head>
    <title>Card Example Using BootSnip</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body background="https://img.freepik.com/free-vector/abstract-blue-wave-elegant-design-on-transparent-background_1055-4977.jpg?size=338&ext=jpg">

<div class="topheader">
 </div>
<div class="col-sm-3">
 </div>
 <form  method="post" action="mobile!getMobileDetails.do">
 <div class="col-sm-6 card">
     <div style="margin-top: 20px">
     <focustags:STabbedPane id="pan1">
         <focustags:SAddTab title="First">
          <div style="border-bottom: 1px solid;border-radius: 2em">
            <h3> Mobile Online Store Collection</h3>
          </div>
             <div class="storeblock col-sm-12">
                 <div class="col-sm-3 innersto">
                 <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReuqr6kDMAMkuPQqsW0UeTdSv81SnapY2YXVJOHzz-wK72WlHjYg" height="90%" width="100%">
                    <%-- <div style="color: red">
                         <a href="#" onclick="CLcard.callCardfirstmobile()">Get Details</a>
                     </div>--%>

                 </div>
                 <div class="col-sm-5 innerstore">
                     <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKie7I078QyW1eVWVbruEKZSjchD2VuELvsKuwQFyP5QENUJ12" height="100%" width="100%">
                     <div>
                        <%--<h4> <a href="#" onclick="CLcard.callCard()"><u>View Mobile Details</u></a></h4>--%>
                         <button>Get Mobile Details</button>
                     </div>
                 </div>
                 <div class="col-sm-4 innerstore">
                     <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMg5UjwNfNXVIIX-EehYsmVwjIzDozY_YmfONtGd3j76mMA79uhQ" height="100%" width="100%">
                    <%-- <div>
                         <a href="#" onclick="CLcard.callCard()">Get Details</a>
                     </div>--%>
                 </div>
             </div>
            <div class="storeblock col-sm-12 ">
             </div>
         </focustags:SAddTab>
         <focustags:SAddTab title="Second">
             Second
         </focustags:SAddTab>
     </focustags:STabbedPane>
     </div>
 </div>
 </form>

</body>
<script src="res/scripts/card.js"></script>
</html>
