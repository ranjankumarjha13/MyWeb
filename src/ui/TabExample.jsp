
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="FocusTags" uri="/tlds/fcomps"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="bootstrapcumjavascriptfile.jsp"/>
<html>
<style>
  .c
  {
    display: none;
  }
  .topheader{
    background-color: #000;
    border: 1px solid;
    border-radius: 2em;
    height: 40px;
  }
  .col-sm-6{
    margin-top: 10px;;
  }
  .card
  {
    border: 1px solid;
    border-radius: 1em;
    box-shadow: 5px 5px 5px 5px gray;
  }
  .topheader
  {
    border: 1px solid;
    border: 1em;
    height: 40px;
    margin-bottom: 15px;
  }
  .tablediv
  {
    margin: 15px;;
  }
  button:hover{
    background-color: #007A00;
  }
  input:hover
  {
     background-color: #C0FF97;
  }
  title:hover{
    background-color: #C0FF98;
  }
</style>
<head>
  <script>
    $(document).ready(function(){
      $('[data-toggle="tooltip"]').tooltip();
    });
  </script>
    <title>TabExample</title>
</head>
<body>
<div style="margin: 10px">
<div class="topheader">
</div>
<div class="col-sm-3">
</div>
<div class="col-sm-6 card">
  <div id="respmse" style="color: green;font-size: 20px" align="center">
  </div>
  <div style="margin: 15px;">
   <%-- action="tab!getFormData.do"--%>
  <form id="myform" >
    <FocusTags:STaskPane id="Form" title="Form"  isMandatory="true"  width="100" isCollapsible="true" specific="style='background-color:pink' disabled='true'">
     <div class="tablediv">
      <FocusTags:STableLayout >
        <FocusTags:STrLayout>
          <FocusTags:STdLayout><label>Name:</label></FocusTags:STdLayout>
          <FocusTags:STdLayout><FocusTags:STextField name="formDTO.name" id="name" ></FocusTags:STextField></FocusTags:STdLayout>
        </FocusTags:STrLayout>
        <FocusTags:STrLayout>
          <FocusTags:STdLayout><label>Age:</label></FocusTags:STdLayout>
          <FocusTags:STdLayout><FocusTags:SNumericField name="formDTO.age" id="age"></FocusTags:SNumericField></FocusTags:STdLayout>
        </FocusTags:STrLayout>
      </FocusTags:STableLayout>
     </div>
    </FocusTags:STaskPane>
    <FocusTags:STaskPane id="Form" title="Table"  isMandatory="true"  width="100" isCollapsible="true" specific="style='background-color:pink' disabled='true'">
      <div style="margin: 5px"><button onclick="ClTab.addTab()" type="button"  data-toggle="tooltip" data-placement="right" title="Please click me to Add new Tab!"> AddTab</button></div>
      <div id="responsediv" class="c"></div>
      <FocusTags:STabbedPane id="pan">
        <FocusTags:SAddTab title="First">
          <FocusTags:STable  id="stable0" border="1" isGenerateSNos="true" altRowColor="true"  specific="' cellpadding=5" width="100%"  rows="2" isEditable="true"
                             isDynamic="true" scroll="auto" >
            <FocusTags:SHeader indexedRowName="formDTO.tabDTOs[0].tableDTOs">
              <FocusTags:SColumn>
                <FocusTags:SName>Name</FocusTags:SName>
                <FocusTags:STextColumn name="name"/>
              </FocusTags:SColumn>
              <FocusTags:SColumn>
                <FocusTags:SName>Age</FocusTags:SName>
                <FocusTags:SNumericColumn name="age"/>
              </FocusTags:SColumn>
            </FocusTags:SHeader>
          </FocusTags:STable>
        </FocusTags:SAddTab>
      </FocusTags:STabbedPane>
    </FocusTags:STaskPane>
    <button onclick="ClTab.register()" data-toggle="tooltip" title="Please click me to Post Data!">Register</button>
  </form>
  </div>
</div>
<div class="col-sm-3">
</div>
</div>
</body>
</html>
