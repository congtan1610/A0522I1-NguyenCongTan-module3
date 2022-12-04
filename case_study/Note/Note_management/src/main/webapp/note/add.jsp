<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 11/30/2022
  Time: 8:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Note</title>
</head>
<body>
<form action="/note" method="post">
   <table>
       <tr>
           <th>Title</th>
           <td><input type="text" name="title"></td>
       </tr>
       <tr>
           <th>Content</th>
           <td><input type="textarea" name="content"></td>
       </tr>
       <tr>
           <th><input type="submit" value="Cancle"></th>
           <th><input type="submit" value="add" name="action"></th>
       </tr>
   </table>
</form>
</body>
</html>
