<%@ page import="com.lingxi.dataform.UserData" %>
<%@ page import="com.lingxi.dataform.Passport" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setAttribute("OnlineUsers", UserData.getOnlineList());
%>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>在线用户列表</title>
    <link href="../css/manageadmin.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="place"> <span>位置：</span>
    <ul class="placeul">
        <li><a href="index.jsp">首页</a></li>
        <li>在线用户列表</li>
    </ul>
</div>
<div class="rightinfo">
    <table class="imgtable">
        <thead>
        <tr>
            <th>ID</th>
            <th>用户登录名</th>
            <th>用户真实姓名</th>
            <th>用户角色</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <div>${pageContext.request.contextPath}</div>
        <jstl:forEach items="${OnlineUsers}" var="user">
            <tr height="50px">
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.realName}</td>
                <td>系统管理员</td>
                <td><a href="../UserManager?id=${user.id}" class="tablelink">强制下线</a></td>
            </tr>
        </jstl:forEach>

        </tbody>
    </table>
</div>
</body>
</html>
