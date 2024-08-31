<%@ page import="edu.ouc.stu.model.TbUsers" %>
<%@ page import="edu.ouc.stu.system.Tomcat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    TbUsers passport = (TbUsers) session.getAttribute("passport");
    if (passport != null && Tomcat.userManager.validate(passport) != null) {
        request.setAttribute("jobList", Tomcat.jobMapper.selectAllJobs());
    }
%>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>职位列表</title>
    <link href="../css/manageadmin.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="place"><span>位置：</span>
    <ul class="placeul">
        <li><a href="index.jsp">首页</a></li>
        <li>职位列表</li>
    </ul>
</div>
<div class="rightinfo">
    <div class="tools">
        <ul class="toolbar">
            <li class="click"><span><img src="../images/t01.png"/></span>
                <a href="jobAdd.html">添加</a></li>
        </ul>
        <iframe src="jobSearch.html" scrolling="no" frameborder="0" width="630" height="42"></iframe>
    </div>
    <table class="imgtable">
        <thead>
        <tr>
            <th>职位名称</th>
            <th>所属企业</th>
            <th>招聘数</th>
            <th>申请数</th>
            <th>结束日期</th>
            <th>招聘状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <jstl:forEach items="${jobList}" var="job">
            <tr height="50px">
                <td>${job.jobName}</td>
                <td>${job.companyId}</td>
                <td>${job.jobHiringnum}</td>
                <td>${job.jobApplicantnum}</td>
                <td>${job.jobEnddate}</td>
                <td>${job.jobState}</td>
                <td ><a href="#" class="tablelink">修改</a> &nbsp;&nbsp;
                    <a href="${pageContext.request.contextPath}/JobServlet?type=delete&id=${job.jobId}" class="tablelink"> 删除</a></td>
            </tr>
        </jstl:forEach>

        </tbody>
    </table>
    <div class="pagin">
        <div class="message">共<i class="blue">1256</i>页，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
        <ul class="paginList">
            <li class="paginItem"><a href="javascript:;">首页</a></li>
            <li class="paginItem"><a href="javascript:;">上一页<span class="pagepre"></span></a></li>
            <li class="paginItem"><a href="javascript:;">下一页<span class="pagenxt"></span></a></li>
            <li class="paginItem"><a href="javascript:;">尾页</a></li>
        </ul>
    </div>
</div>
</body>
</html>
