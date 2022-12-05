<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 12/4/2022
  Time: 2:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../boostrap/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="../boostrap/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <style>
        a {
            text-decoration: none;
        }
    </style>
</head>
<body class="container-fluid" style="padding-left: 0;padding-right: 0;">
<a href="/cus?action=add" style="text-decoration: none">Add new</a>
<table class="table table-striped">
    <tr>
        <th>id</th>
        <th>type_id</th>
        <th>name</th>
        <th>dateOfBirth</th>
        <th>gender</th>
        <th>id_card</th>
        <th>number phone</th>
        <th>email</th>
        <th>address</th>
        <th>CRUD</th>
    </tr>
    <c:forEach items="${list}" var="customer">
        <tr>
            <td>${customer.id}</td>
            <td>
                <c:forEach items="${typeCus}" var="type">
                    <c:if test="${type.type_id==customer.type_id}">${type.name}</c:if>
                </c:forEach></td>
            <td>${customer.name}</td>
            <td>${customer.dateOfBirth}</td>
            <td>
                <c:choose>
                    <c:when test="${customer.gender==0}">Nữ</c:when>
                    <c:otherwise>Nam</c:otherwise>
                </c:choose>
            </td>
            <td>${customer.cmnd}</td>
            <td>${customer.sdt}</td>
            <td>${customer.email}</td>
            <td>${customer.address}</td>
            <td>
                <button><a href="/cus?action=update&id=${customer.id}">Update</a></button>
                <button><a href="/cus?action=delete&id=${customer.id}">Delete</a></button>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
