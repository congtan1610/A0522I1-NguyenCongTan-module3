<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 11/18/2022
  Time: 9:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
    <style>
        button {
            border-radius: 5px;
            border: none;
            background-color: aqua;
        }

        a {
            text-decoration: none;
            color: black;
        }

        a:hover {
            color: white;
        }

        button:hover {
            background-color: blue;
        }

        th {
            width: 200px;
        }
    </style>
</head>
<body class="container">
<h1>
    <center>Product List</center>
</h1>
<input type="hidden" name="action">
<form action="/Product" method="get">
    <table>
        <tr>
            <td><input style="all:revert" type="submit" value="create" name="action"></td>
            <td><input style="all:revert" type="submit" value="All"></td>
            <td width="750px"></td>
            <td>
                <input style="all:revert" type="text" name="nameProduct" placeholder="Enter product name">
                <input style="all:revert" type="submit" value="search" name="action">
            </td>
        </tr>
    </table>
</form>
<table class="table table-striped">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>price</th>
        <th></th>
    </tr>
    <c:if test="${list.isEmpty()}">
        <tr>
            <td colspan="4"><b>Not found</b></td>
        </tr>
    </c:if>
    <c:forEach items="${list}" var="p">
        <tr>
            <td>${p.id} </td>
            <td>${p.name} </td>
            <td>${p.price} </td>
            <td>
                <button><a href="/Product?action=detail&id=${p.id}">Detail</a></button>
                <button><a href="/Product?action=update&id=${p.id}">Update</a></button>
                <button><a href="/Product?action=delete&id=${p.id}">Delete</a></button>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
