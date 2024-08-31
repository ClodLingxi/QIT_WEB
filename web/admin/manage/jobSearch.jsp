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

<html>
<head>
    <meta charset="utf-8">
    <title>职位搜索</title>
    <link href="../css/manageadmin.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<ul class="seachform">
    <li>
        <div class="vocation">
            所属企业：<select class="select3" name="companyId" id="companyId">
            <option value="0">全部企业</option>
            <jstl:forEach items="${companyList}" var="company">
                <option value="${company.companyId}">${company.companyName}</option>
            </jstl:forEach>
        </select>
        </div>
    </li>
    <li>
        职位名称：<input type="text" class="scinput" name="jobName" id="jobName"/>
    </li>
    <li>
        <button class="scbtn" onclick="selectJob()">查询</button>
    </li>
</ul>
<script>
    function selectJob() {
        let select = document.getElementById("companyId");
        let index = select.selectedIndex;
        let company_input = document.getElementById("jobName")
        let company_name = company_input.value;
        parent.location.href = "jobList.jsp?id=".concat(select.options[index].value, "&selectName=" + company_name);
    }
</script>
</body>
</html>
