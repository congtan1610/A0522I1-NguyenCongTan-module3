<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: linht
  Date: 11/18/2022
  Time: 7:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Display List Book</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="../boostrap/bootstrap.min.css"  rel="stylesheet">
  <script src="../boostrap/bootstrap.bundle.min.js" ></script>
</head>
<body class="container">
<h1>List book</h1>
<table border="1" class="table table-striped">
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Author</th>
    <th>Category</th>
    <th>CRUD</th>
  </tr>
  <c:forEach items="${list}" var="book">
    <tr>
      <td>${book.id}</td>
      <td>${book.name}</td>
      <td>${book.author}</td>
      <td>${book.name}</td>
      <td>
        <a href="/book?action=update&id=${book.id}">Update</a>
      </td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
