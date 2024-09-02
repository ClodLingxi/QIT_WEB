<%@ page import="edu.ouc.stu.model.TbUsers" %>
<%@ page import="edu.ouc.stu.system.Tomcat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    TbUsers passport = (TbUsers) session.getAttribute("passport");
    if (passport != null && Tomcat.userManager.validate(passport) != null) {
        request.setAttribute("companyList", Tomcat.companyMapper.selectAllCompany());
    }
%>

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
        <li><a href="#">企业列表</a></li>
    </ul>
</div>
<div class="rightinfo">
    <div class="tools">
        <ul class="toolbar">
            <li class="click"><span><img src="../images/t01.png"/></span><a href="companyAdd.jsp">添加</a></li>
            <li><span><img src="../images/t03.png"/></span><a href="#">删除</a></li>
        </ul>
    </div>
    <table class="imgtable">
        <thead>
        <tr>
            <th><input name="" type="checkbox" value="" checked="checked"/></th>
            <th>企业名称</th>
            <th>企业所在地</th>
            <th>企业规模</th>
            <th>企业性质</th>
            <th>招聘状态</th>
            <th>显示排序</th>
            <th>浏览数</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <jstl:forEach items="${companyList}" var="company">
            <tr height="50px">
                <td ><input name="" type="checkbox" value="" /></td>
                <td>${company.companyName}</td>
                <td>${company.companyArea}</td>
                <td>${company.companySize}</td>
                <td>${company.companyType}</td>
                <td>${company.companyState}</td>
                <td>${company.companySort}</td>
                <td>
                    <img src="${pageContext.request.contextPath}/upload/${company.companyPic}" width="50px" height="50px">
                </td>
                <td ><a href="./companyEdit.jsp?id=${company.companyId}" class="tablelink">修改</a> &nbsp;&nbsp;
                    <a href="${pageContext.request.contextPath}/CompanyManage?type=deleteCompany&id=${company.companyId}" class="tablelink"> 删除</a>
                </td>
            </tr>
        </jstl:forEach>

        </tbody>
    </table>
    <div class="pagin">
        <div class="message">共<i class="blue">1256</i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
        <ul class="paginList">
            <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
            <li class="paginItem"><a href="javascript:;">1</a></li>
            <li class="paginItem current"><a href="javascript:;">2</a></li>
            <li class="paginItem"><a href="javascript:;">3</a></li>
            <li class="paginItem"><a href="javascript:;">4</a></li>
            <li class="paginItem"><a href="javascript:;">5</a></li>
            <li class="paginItem more"><a href="javascript:;">...</a></li>
            <li class="paginItem"><a href="javascript:;">10</a></li>
            <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div>
</div>
</body>
</html>
