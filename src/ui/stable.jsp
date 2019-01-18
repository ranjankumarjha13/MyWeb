
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 01-01-2019
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="FocusTags" uri="/tlds/fcomps"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title></title>
</head>
<body>
<c:set var="index" value="${requestScope.index}"/>
<FocusTags:STable  id="stable${index}" border="1" isGenerateSNos="true"  specific="' cellpadding=5" width="100%"  rows="2" isEditable="true"
                   isDynamic="true" scroll="auto" >
  <FocusTags:SHeader indexedRowName="formDTO.tabDTOs[${index}].tableDTOs">
    <FocusTags:SColumn>
      <FocusTags:SName>Name</FocusTags:SName>
      <FocusTags:STextColumn name="name"  />
    </FocusTags:SColumn>
    <FocusTags:SColumn>
      <FocusTags:SName>Age</FocusTags:SName>
      <FocusTags:SNumericColumn name="age"/>
    </FocusTags:SColumn>
  </FocusTags:SHeader>
</FocusTags:STable>
</body>
</html>
