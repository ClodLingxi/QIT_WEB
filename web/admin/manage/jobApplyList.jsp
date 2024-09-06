<%@ page import="edu.ouc.stu.model.TbUsers" %>
<%@ page import="edu.ouc.stu.system.Tomcat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    TbUsers passport = (TbUsers) request.getSession().getAttribute("passport");
    if (passport != null && Tomcat.userManager.validate(passport) != null && passport.getUserRole() == 1){
        request.setAttribute("applyList", Tomcat.applyMapper.selectAll());
    }
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>职位申请列表</title>
<link href="../css/manageadmin.css" rel="stylesheet" type="text/css" />
<!-- 日期控件js -->
<script src="../js/Calendar6.js" type="text/javascript"></script>
</head>
<body>
<div class="place"> <span>位置：</span>
  <ul class="placeul">
    <li><a href="index.html">首页</a></li>
    <li>职位申请查询列表</li>
  </ul>
</div>
<div class="rightinfo">
  <div class="tools">
  <ul class="seachform">
	  <li>
	    <div class="vocation">
	      所属企业：<select class="select3" name="companyId">
	        <option>全部企业</option>
	        <option>青软实训</option>
	        <option>凌志软件</option>
	      </select>
	    </div>
	  </li>
	  <li>
	    <div class="vocation">
	      所属职位：<select class="select3" name="jobId">
	        <option>全部职位</option>
	        <option>对日外包</option>
	        <option>Java软件开发</option>
	      </select>
	    </div>
	  </li>
	  <li>
	    申请日期：<input name="" type="text" onclick="SelectDate(this)" readonly="readonly" class="scinput"/>
	    --<input name="" type="text" onclick="SelectDate(this)" readonly="readonly" class="scinput"/>
	  </li>
	  <li>
	    <input name="" type="button" class="scbtn" value="查询"/>
	  </li>
	</ul>
  </div>
  <table class="imgtable">
    <thead>
      <tr>
        <th>姓名</th>
        <th>申请职位</th>
        <th>申请状态</th>
        <th>申请日期</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody>
	<tr height="50px">
		<td>青软实训</td>
		<td>对日软件外包</td>
        <td>已申请</td>
        <td>2015-6-8</td>
        <td><a href="#" class="tablelink">申请审核</a> &nbsp;&nbsp;
        <a href="#" class="tablelink">邮件通知</a></td>
      </tr>
    <jstl:forEach items="${applyList}" var="apply">
        <tr height="50px">
            <td>${apply.applyCompanyName}</td>
            <td>${apply.applyJobName}</td>

            <jstl:if test="${apply.applyState == 1}">
                <td>未申请</td>
            </jstl:if>
            <jstl:if test="${apply.applyState == 2}">
                <td>已申请</td>
            </jstl:if>
            <td>${apply.applyDate.year}-${apply.applyDate.month}-${apply.applyDate.day}</td>
            <td><a href="#" class="tablelink">申请审核</a> &nbsp;&nbsp;
                <a href="#" class="tablelink">邮件通知</a></td>
        </tr>
    </jstl:forEach>
    </tbody>
  </table>
</div>
</body>
</html>
