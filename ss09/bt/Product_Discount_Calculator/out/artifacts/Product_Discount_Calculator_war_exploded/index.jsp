<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 11/16/2022
  Time: 7:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Product Discount Calculator </title>
  </head>
  <body>
  <h1>Product Discount Calculator </h1>
  <form action="/display-discount" method="post">
    <table>
      <tr>
        <td>Product Description:</td>
        <td><input type="text" name="pd"></td>
      </tr>
      <tr>
        <td>List Price:</td>
        <td><input type="number" name="lp"></td>
      </tr>
      <tr>
        <td>Discount Percent:</td>
        <td><input type="number" name="dp"></td>
      </tr>
      <tr>
        <td colspan="2"><input  type="submit" value="Calculate Discount"></td>
      </tr>
    </table>
  </form>
  </body>
</html>
