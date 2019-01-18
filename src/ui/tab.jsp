<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 27-12-2018
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="FocusTags" uri="/tlds/fcomps"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>TabExample</title>
  <link href="res/global/styles/home.css" rel="stylesheet" type="text/css">
  <link href="res/global/styles/App.css" rel="stylesheet" type="text/css">
  <link href="res/global/styles/ActionBar.css" rel="stylesheet" type="text/css">
  <link href="res/global/styles/BoxView.css" rel="stylesheet" type="text/css">
  <link href="res/global/styles/Button.css" rel="stylesheet" type="text/css">
  <link href="res/global/styles/ButtonPane.css" rel="stylesheet" type="text/css">
  <link href="res/global/styles/Calendar.css" rel="stylesheet" type="text/css">
  <link href="res/global/styles/Dialog.css" rel="stylesheet" type="text/css">
  <link href="res/global/styles/DropdownList.css" rel="stylesheet" type="text/css">
  <link href="res/global/styles/Table.css" rel="stylesheet" type="text/css">
  <link href="res/global/styles/Tabpane.css" rel="stylesheet" type="text/css">
  <link href="res/global/styles/Time.css" rel="stylesheet" type="text/css">
  <link href="res/global/styles/tabmenu.css" rel="stylesheet" type="text/css">
  <link href="res/global/styles/Uploadbar.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div id="resRegDv" align="center">
</div>
<%--action="tab1!getTab1data.do"--%>
     <form id="myform">
       <div id="scombo"></div>
   <FocusTags:STaskPane id="Form" title="Form"  isMandatory="true"  width="100" isCollapsible="true" specific="style='background-color:pink' disabled='true'">
  <FocusTags:STableLayout >
    <FocusTags:STrLayout>
      <FocusTags:STdLayout><label>Name:</label></FocusTags:STdLayout>
      <FocusTags:STdLayout><FocusTags:STextField name="tab1FormDto.name" id="name"></FocusTags:STextField></FocusTags:STdLayout>
    </FocusTags:STrLayout>
    <FocusTags:STrLayout>
      <FocusTags:STdLayout><label>Age</label></FocusTags:STdLayout>
      <FocusTags:STdLayout><FocusTags:SNumericField name="tab1FormDto.age" id="age"></FocusTags:SNumericField></FocusTags:STdLayout>
    </FocusTags:STrLayout>
    <FocusTags:STrLayout>
      <FocusTags:STdLayout>Weight</FocusTags:STdLayout>
      <FocusTags:STdLayout><FocusTags:SFloatField name="tab1FormDto.weight" id="weight"></FocusTags:SFloatField></FocusTags:STdLayout>
    </FocusTags:STrLayout>
    <FocusTags:STrLayout>
      <FocusTags:STdLayout>City</FocusTags:STdLayout>
      <FocusTags:STdLayout>
        <FocusTags:SComboBox name="city" masterType="58" scrollerId="scombo" hiddenFieldName="tab1FormDto.city" formName="myform" id="combo">
          <FocusTags:SItem key="1">Hyderabad</FocusTags:SItem>
          <FocusTags:SItem key="2">Mumbai</FocusTags:SItem>
          <FocusTags:SItem key="3">kolkata</FocusTags:SItem>
          <FocusTags:SItem key="4">chennai</FocusTags:SItem>
          <FocusTags:SItem key="5">Bengaluru</FocusTags:SItem>
          <FocusTags:SItem key="6">Pune</FocusTags:SItem>
          <FocusTags:SItem key="7">varanashi</FocusTags:SItem>
          <FocusTags:SItem key="8">Delhi</FocusTags:SItem>
          <FocusTags:SItem key="9">Dehradun</FocusTags:SItem>
        </FocusTags:SComboBox>
      </FocusTags:STdLayout>
    </FocusTags:STrLayout>
  </FocusTags:STableLayout>
</FocusTags:STaskPane>
       <button onClick="CLtab.add()" type="button">Add Tab</button>
       <FocusTags:STaskPane id="Form" title="Table"  isMandatory="true"  width="100" isCollapsible="true" specific="style='background-color:pink' disabled='true'">
          <FocusTags:STabbedPane id="pan1">
            <FocusTags:SAddTab title="Table1" >
              <FocusTags:STable  id="stable1" border="1" isGenerateSNos="true"  specific="' cellpadding=5" width="100%"  rows="2" isEditable="true"
                                 isDynamic="true" scroll="auto" >
                <FocusTags:SHeader indexedRowName="tab1FormDto.tab1TableDtos">
                  <FocusTags:SColumn>
                    <FocusTags:SName>Name</FocusTags:SName>
                    <FocusTags:STextColumn name="name"  />
                  </FocusTags:SColumn>
                  <FocusTags:SColumn>
                    <FocusTags:SName>Age</FocusTags:SName>
                    <FocusTags:SNumericColumn name="age" id="age"/>
                  </FocusTags:SColumn>
                  <FocusTags:SColumn>
                    <FocusTags:SName>Weight</FocusTags:SName>
                    <FocusTags:SFloatColumn name="weight"/>
                  </FocusTags:SColumn>
                  <FocusTags:SColumn>
                    <FocusTags:SName>City</FocusTags:SName>
                    <FocusTags:SComboColumn name="tab1TableDtos.city" formName="myform" scrollerId="scombo" hiddenFieldName="city" masterType="58">
                      <FocusTags:SItem key="1">Hyderabad</FocusTags:SItem>
                      <FocusTags:SItem key="2">Mumbai</FocusTags:SItem>
                      <FocusTags:SItem key="3">kolkata</FocusTags:SItem>
                      <FocusTags:SItem key="4">chennai</FocusTags:SItem>
                      <FocusTags:SItem key="5">Bengaluru</FocusTags:SItem>
                      <FocusTags:SItem key="6">Pune</FocusTags:SItem>
                      <FocusTags:SItem key="7">varanashi</FocusTags:SItem>
                      <FocusTags:SItem key="8">Delhi</FocusTags:SItem>
                      <FocusTags:SItem key="9">Dehradun</FocusTags:SItem>
                    </FocusTags:SComboColumn>
                  </FocusTags:SColumn>
                </FocusTags:SHeader>
              </FocusTags:STable>
            </FocusTags:SAddTab>
            <FocusTags:SAddTab title="Table2">
              <div id="scombo"></div>
              <FocusTags:STable  id="stable1" border="1" isGenerateSNos="true"  specific="' cellpadding=5" width="100%"  rows="2" isEditable="true"
                                 isDynamic="true" scroll="auto" >
                <FocusTags:SHeader indexedRowName="tab1FormDto.tab2TableDtos">
                  <FocusTags:SColumn>
                    <FocusTags:SName>Name</FocusTags:SName>
                    <FocusTags:STextColumn name="name" id="name"/>
                  </FocusTags:SColumn>
                  <FocusTags:SColumn>
                    <FocusTags:SName>Age</FocusTags:SName>
                    <FocusTags:SNumericColumn name="age" id="age"/>
                  </FocusTags:SColumn>
                  <FocusTags:SColumn>
                    <FocusTags:SName>Weight</FocusTags:SName>
                    <FocusTags:SFloatColumn name="weight"/>
                  </FocusTags:SColumn>
                  <FocusTags:SColumn>
                    <FocusTags:SName>City</FocusTags:SName>
                    <FocusTags:SComboColumn name="tab2TableDtos.city" formName="myform" scrollerId="scombo"  hiddenFieldName="city" masterType="58">
                      <FocusTags:SItem key="1">Hyderabad</FocusTags:SItem>
                      <FocusTags:SItem key="2">Mumbai</FocusTags:SItem>
                      <FocusTags:SItem key="3">kolkata</FocusTags:SItem>
                      <FocusTags:SItem key="4">chennai</FocusTags:SItem>
                      <FocusTags:SItem key="5">Bengaluru</FocusTags:SItem>
                      <FocusTags:SItem key="6">Pune</FocusTags:SItem>
                      <FocusTags:SItem key="7">varanashi</FocusTags:SItem>
                      <FocusTags:SItem key="8">Delhi</FocusTags:SItem>
                      <FocusTags:SItem key="9">Dehradun</FocusTags:SItem>
                    </FocusTags:SComboColumn>
                  </FocusTags:SColumn>
                </FocusTags:SHeader>
              </FocusTags:STable>
            </FocusTags:SAddTab>
          </FocusTags:STabbedPane>
       </FocusTags:STaskPane>
      <button onclick="CLtab.registerData()" type="submit">Register</button>
     <%-- <button >Register</button>--%>
     </form>
</body>
<script src="res/scripts/myscript.js"></script>
<script src="res/scripts/tabpane.js"></script>
<script src="res/scripts/Taskpane.js"></script>
<script src="res/scripts/combobox.js"></script>
<script src="res/scripts/CrossBrowser.js"> </script>
<script src="res/scripts/constants.js" ></script>
<script src="res/scripts/tabmenu.js"> </script>
<script src="res/scripts/Taskpane.js"> </script>
<script src="res/scripts/tabpane.js"> </script>
<script src="res/scripts/validation.js"> </script>
<script src="res/scripts/tapasPractice.js"> </script>
<script src="res/scripts/ajax.js"> </script>
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
<script src="res/scripts/CommonScripts.js"></script>\
<script src="res/scripts/scripts/ajax.js"></script>
<FocusTags:SOnLoadScript></FocusTags:SOnLoadScript>
</html>
