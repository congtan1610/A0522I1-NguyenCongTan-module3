<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 11/17/2022
  Time: 8:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Calculator</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form method="post" action="/cal" name="Calculator">
    <table>
        <tr>
            <td>First Operand:</td>
            <td><input type="text" name="fo"></td>
        </tr>
        <tr>
            <td>Operater:</td>
            <td><select name="o">
                <option>Addition</option>
                <option>Subtraction</option>
                <option>Multiplication</option>
                <option>Division</option>
            </select></td>
        </tr>
        <tr>
            <td>Second Operand:</td>
            <td><input type="text" name="so"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Calculator"></td>
        </tr>
    </table>
</form>
</body>
</html>
