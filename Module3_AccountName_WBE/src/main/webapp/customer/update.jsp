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
<center>Update Customer</center>
<form action="/cus" method="post">
    <table border="solid 1px">
        <tr>
            <th>id</th>
            <td><input type="text" name="id" value="${cus.id}"></td>
        </tr>
        <tr>
            <th>customer type</th>
            <td>
                <select name="type_id">
                    <c:forEach items="${typeCus}" var="types">
                        <c:if test="${types.type_id==type}">
                            <option value="${types.type_id}">${types.name}</option>
                        </c:if>
                    </c:forEach>
                    <c:forEach items="${typeCus}" var="types">
                        <c:if test="${types.type_id!=type}">
                            <option value="${types.type_id}">${types.name}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <th>name</th>
            <td><input type="text" name="name" value="${cus.name}"></td>
        </tr>
        <tr>
            <th>date of birth</th>
            <td><input type="text" name="dateOfBirth" placeholder="yyyy-mm-dd" value="${cus.dateOfBirth}"></td>
        </tr>
        <tr>
            <th>gender</th>
            <td><input type="text" name="gender" placeholder="nam hoặc nữ" value="${gender}">
            </td>
        </tr>
        <tr>
            <th>id card</th>
            <td><input type="text" name="cmnd" value="${cus.cmnd}"></td>
        </tr>
        <tr>
            <th>number phone</th>
            <td><input type="text" name="sdt" value="${cus.sdt}"></td>
        </tr>
        <tr>
            <th>email</th>
            <td><input type="text" name="email" value="${cus.email}"></td>
        </tr>
        <tr>
            <th>address</th>
            <td><input type="text" name="address" value="${cus.address}"></td>
        </tr>
        <tr>
            <th><input type="submit" value="update" name="action"></th>
            <th><input type="submit" value="cancle" name="action"></th>
        </tr>
    </table>
</form>
</body>
</html>
