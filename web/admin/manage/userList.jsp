<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>企业列表</title>
    <link href="../css/manageadmin.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="place"><span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">用户列表</a></li>
    </ul>
</div>
<div class="rightinfo">
    <div class="tools">
        <ul class="toolbar">
            <li class="click"><span><img src="../images/t01.png"/></span><a href="${pageContext.request.contextPath}/admin/manage/userAdd.jsp">添加</a></li>
            <li class="click"><span><img src="../images/t02.png"/></span><a href="${pageContext.request.contextPath}/admin/manage/userAdd.jsp">修改</a></li>
            <li><span><img src="../images/t03.png"/></span><a href="./userDelete.html">删除</a></li>
        </ul>
        <iframe src="${pageContext.request.contextPath}/admin/manage/userSearch.html" scrolling="no" frameborder="0" width="400" height="42"></iframe>
    </div>
    <table class="imgtable">
        <thead>
        <tr>
            <th><input name="" type="checkbox" value="" checked="checked"/></th>
            <th>用户登录名</th>
            <th>用户真实姓名</th>
            <th>用户Email</th>
            <th>用户角色</th>
            <th>用户状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <jsp:useBean id="userList" scope="request" type="java.util.List"/>
        <jstl:forEach items="${userList}" var="user">
            <tr height="50px">
                <td><input name="" type="checkbox" value=""/></td>
                <td>${user.userName} </td>
                <td>${user.userRealname} </td>
                <td>${user.userEmail} </td>
                <td>
                    <jstl:set var="role" value="${user.userRole}" />
                    <jstl:if test="${role == 3}">普通用户</jstl:if>
                    <jstl:if test="${role == 2}">企业管理员</jstl:if>
                    <jstl:if test="${role == 1}">系统管理员</jstl:if>
                </td>
                <td>${user.userState == 1 ? "启用" : "禁用"} </td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/manage/userEdit.jsp?id=${user.userId}" class="tablelink">修改</a> &nbsp;&nbsp;
                    <a href="UserManage?type=deleteUser&id=${user.userId}" class="tablelink">删除</a>
                </td>
            </tr>
        </jstl:forEach>

        </tbody>
    </table>
    <div class="pagin">
        <div class="message">共<i class="blue">${requestScope.get("totalPage")}</i>页，当前显示第&nbsp;<i class="blue">${requestScope.get("pageNum")}&nbsp;</i>页</div>
        <ul class="paginList">
            <li class="paginItem">
                <a href="UserManage?type=getUser&pageNum=1&role=${requestScope.get("role")}&selectName=${requestScope.get("selectName")}">首页</a>
            </li>
            <li class="paginItem">
                <a href="UserManage?type=getUser&pageNum=${requestScope.get("pageNum") - 1}&role=${requestScope.get("role")}&selectName=${requestScope.get("selectName")}">上一页<span class="pagepre"></span></a>
            </li>
            <li class="paginItem">
                <a href="UserManage?type=getUser&pageNum=${requestScope.get("pageNum") + 1}&role=${requestScope.get("role")}&selectName=${requestScope.get("selectName")}">下一页<span class="pagenxt"></span></a>
            </li>
            <li class="paginItem">
                <a href="UserManage?type=getUser&pageNum=${requestScope.get("totalPage")}&role=${requestScope.get("role")}&selectName=${requestScope.get("selectName")}">尾页</a>
            </li>
        </ul>
    </div>
</div>
</body>
</html>
