<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 11/30/2022
  Time: 8:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../boostrap/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="../boostrap/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <title>Document</title>
    <style>
        .header {
            height: 100px;
            width: 100%;
            border: solid 2px black;
        }

        .logo {
            width: 50px;
            height: 50px;
            border: solid 1px;
            margin: 0;
        }

        .link {
            height: 50px;
            width: 100%;
            border: solid 2px black;
        }

        .bo {
            height: 420px;
            width: 100%;
            border: solid 2px black;
        }

        .bo-left {
            margin-left: 0;
            height: 100%;
            width: 25%;
            border: solid 2px black;
            float: left;
        }

        .bo-right {
            height: 100%;
            width: 75%;
            border: solid 2px black;
            margin-left: 25%;
        }

        .footer {
            height: 70px;
            width: 100%;
            border: solid 2px black;
        }

        .child-left {
            height: 60px;
            margin: 0;
            width: 50px;
            padding: 20px;
            float: left;
        }

        .child-right {
            height: 60px;
            margin: 0;
            width: 100px;
            padding: 20px;
            float: right;

        }

        a {
            text-decoration: none;
            color: black;
            font-weight: bold;
        }

        a:hover {
            color: red;
        }

        .item {
            float: left;
            padding-left: 50px;
            padding-top: 10px;
        }

        input {
            border-radius: 10px;
            width: 200px;
        }

    </style>
</head>

<body class="container-fluid" style="padding-left: 0;padding-right: 0;">
<div class="header">
    <div class="child-left">
        <div class="logo"></div>
        <b>
            <center>logo</center>
        </b>
    </div>
    <div class="child-right">
        <b>Nguyen Van A</b>
    </div>
</div>
<div class="link">
    <div class="item" style="margin-left: 300px;"><a href="#">Home</a></div>
    <div class="item"><a href="#">Employee</a></div>
    <div class="item"><a href="/cus?action=list">Customer</a></div>
    <div class="item"><a href="#">Service</a></div>
    <div class="item"><a href="#">Contract</a></div>
    <div class="item"><input type="text" placeholder="search"></div>
</div>
<div class="bo">
    <div class="bo-left">
        <div>Item one</div>
        <div>Item two</div>
        <div>Item three</div>
    </div>
    <div class="bo-right">
        <center style="margin-top:200px"><b>body....</b></center>
    </div>
</div>
<div class="footer">
    <center style="margin-top:20px"><b>footer</b></center>
</div>
</body>
</html>
