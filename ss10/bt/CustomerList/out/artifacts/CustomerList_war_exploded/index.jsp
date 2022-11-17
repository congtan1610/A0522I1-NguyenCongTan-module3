<%@ page import="service.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 11/16/2022
  Time: 8:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>List Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
    <style>
      img{width: 30px;height: 30px;}
    </style>
  </head>
  <body class="container">
  <h1><center>Danh sách khách hàng</center></h1>
  <%
     List<Student> list;
    {
    list = new ArrayList<>();
    list.add(new Student("Mai Văn Hoàng", "1983-08-20", "Hà Nội", "https://bom.so/FzAJpP"));
    list.add(new Student("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "https://bom.so/FzAJpP"));
    list.add(new Student("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "https://bom.so/FzAJpP"));
    list.add(new Student("Trần Đăng Khoa", "1983-08-19", "Hà Tây", "https://bom.so/FzAJpP"));
    list.add(new Student("Nguyễn Đình Thi", "1983-08-18", "Hà Nội", "https://bom.so/FzAJpP"));

  }
  %>
  <table class="table">
    <thead>
    <tr>
      <th scope="col">Tên</th>
      <th scope="col">Ngày sinh</th>
      <th scope="col">Địa chỉ</th>
      <th scope="col">Ảnh</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="<%=list%>" var="s">
      <tr>
        <td>${s.name}</td>
        <td>${s.dateOfBirth}</td>
        <td>${s.address}</td>
        <td><img src="${s.img}"></td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
  </body>
</html>
