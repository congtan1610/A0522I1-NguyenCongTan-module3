<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 11/17/2022
  Time: 8:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result</title>
</head>
<body>
<h1>Result:</h1>
<b>${fo}
    <c:choose>
        <c:when test="${o=='Addition'}"><b>+</b></c:when>
        <c:when test="${o=='Subtraction'}"><b>-</b></c:when>
        <c:when test="${o=='Multiplication'}"><b>*</b></c:when>
        <c:when test="${o=='Division'}"><b>/</b></c:when>
    </c:choose>
${so}=${result}</b>
</body>
</html>
