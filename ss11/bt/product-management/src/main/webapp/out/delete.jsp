<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 11/19/2022
  Time: 9:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete</title>
</head>
<body>
<h1>Delete </h1>
<form  method="post" action="/Product">
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
        <c:if test="${notifi!=' '}">
            <tr>
                <td colspan="2"><b>${notifi}</b></td>
            </tr>
        </c:if>
        <tr>
            <td><input type="submit" value="delete" name="action"></td>
            <td><input type="submit" value="cancle"></td>
        </tr>
    </table>
</form>
</body>
</html>
