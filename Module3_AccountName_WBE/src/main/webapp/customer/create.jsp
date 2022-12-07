<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 12/2/2022
  Time: 8:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>Add New Customer</center>
<form action="/cus" method="post">
    <table border="solid 1px">
        <tr>
            <th>id</th>
            <td><input type="text" name="id" value="${id}"></td>
        </tr>
        <tr>
            <th>customer type</th>
            <td>
                <select name="type_id">
                    <c:forEach items="${typeCus}" var="type">
                        <option value="${type.type_id}">${type.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <th>name</th>
            <td><input type="text" name="name" value="${name}"></td>
        </tr>
        <tr>
            <th>date of birth</th>
            <td>
                <c:choose>
                    <c:when test="${d==false}"> <input type="text" name="dateOfBirth" placeholder="yyyy-mm-dd"
                                                       value="${dateOfBirth}" style="color: red"> </c:when>
                    <c:otherwise><input type="text" name="dateOfBirth" placeholder="yyyy-mm-dd"
                                        value="${dateOfBirth}"></c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <th>gender</th>
            <td><input type="text" name="gender" placeholder="nam hoặc nữ" value="${gender}"></td>
        </tr>
        <tr>
            <th>id card</th>
            <td>
                <c:choose>
                    <c:when test="${c==false}"> <input type="text" name="cmnd" value="${cmnd}"
                                                       style="color:red"></c:when>
                    <c:otherwise><input type="text" name="cmnd" value="${cmnd}"></c:otherwise>
                </c:choose></td>
        </tr>
        <tr>
            <th>number phone</th>
            <td>
                <c:choose>
                    <c:when test="${s==false}"> <input type="text" name="sdt" value="${sdt}" style="color:red"></c:when>
                    <c:otherwise><input type="text" name="sdt" value="${sdt}"></c:otherwise>
                </c:choose></td>
            </td>
        </tr>
        <tr>
            <th>email</th>
            <td>
                <c:choose>
                    <c:when test="${e==false}"> <input type="text" name="email" value="${email}"
                                                       style="color:red"></c:when>
                    <c:otherwise><input type="text" name="email" value="${email}"></c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <th>address</th>
            <td><input type="text" name="address" value="${address}"></td>
        </tr>
        <tr>
            <th><input type="submit" value="add" name="action"></th>
            <th><input type="submit" value="cancle" name="action"></th>
        </tr>
    </table>
</form>
</body>
</html>
