<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 11/19/2022
  Time: 7:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detail</title>
</head>
<body>
<h1>Detail </h1>
<form  method="get" action="/Product">
    <table>
        <tr>
            <td>Id</td>
            <td><input type=" text" name="id" value="${id}"></td>
        </tr>
        <tr>
            <td>name</td>
            <td><input type=" text" name="name" value="${name}"></td>
        </tr>
        <tr>
            <td>Price</td>
            <td><input type=" text" name="price" value="${price}"></td>
        </tr>
        <tr>
            <td><input type="submit" value="back"></td>
        </tr>
    </table>
</form>
</body>
</html>
