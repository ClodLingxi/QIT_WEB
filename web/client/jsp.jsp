<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>无标题文档</title>
    <link href="${pageContext.request.contextPath}/client/css/base.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="head">
    <div class="head_area">
        <div class="head_nav">
            <ul>
                <li><img src="${pageContext.request.contextPath}/client/images/nav_inc1.png"/><a href="${pageContext.request.contextPath}/client/index.jsp" target="_parent">首页</a></li>
                <li><img src="${pageContext.request.contextPath}/client/images/nav_inc2.png"/><a href="#">成功案例</a></li>
                <li><img src="${pageContext.request.contextPath}/client/images/nav_inc3.png"/><a href="#">关于锐聘</a></li>
            </ul>
        </div>
        <div class="head_logo"><img src="${pageContext.request.contextPath}/client/images/head_logo.png"/></div>
        <div class="head_user">
            <jstl:if test="${sessionScope.passport == null}">
                <a href="${pageContext.request.contextPath}/client/login.jsp" target="_parent"><span class="type1">登录</span></a>
                <a href="${pageContext.request.contextPath}/client/register.jsp" target="_parent"><span class="type2">注册</span></a>
            </jstl:if>
			<jstl:if test="${sessionScope.passport != null}">
                <a href="${pageContext.request.contextPath}/ResumeClient?type=queryResume" target="_parent">${sessionScope.passport.getUserName()}</a>
                <a href="${pageContext.request.contextPath}/UserServlet?type=exit&role=user" target="_parent">退出</a>
            </jstl:if>
        </div>
        <div class="clear"></div>
    </div>
</div>

<div class="top_main">
    <div class="top_logo"><img src="${pageContext.request.contextPath}/client/images/main_logo.png"/></div>
    <div class="top_instr">提供岗前培训的IT职位</div>
    <div class="top_tel"><img src="${pageContext.request.contextPath}/client/images/it-phone.png"/></div>
    <div class="clear"></div>
</div>

<div class="clear"></div>

</body>
</html>
