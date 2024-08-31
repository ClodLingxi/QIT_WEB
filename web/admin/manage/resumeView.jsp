<%@ page import="com.lingxi.dataform.ResumeData" %>
<%@ page import="com.lingxi.dataform.Passport" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  Passport passport = (Passport) session.getAttribute("passport");
  int id = Integer.parseInt(request.getParameter("id"));
  if (passport != null && id >= 0) {
    request.setAttribute("Resume", ResumeData.getResume(passport, id));
  } else {

  }
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>简历详情</title>
<link href="../css/manageadmin.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="place"> <span>位置：</span>
  <ul class="placeul">
    <li><a href="../index.html">首页</a></li>
    <li>简历详情</li>
  </ul>
</div>
<div class="formbody">
  <div class="usual">
    <div class="tabson">
      <ul class="forminfo">
      	<li>
          <label>真实姓名：</label><label style="width: 200px;"><b style="color: #000">${Resume.name}</b></label>
        </li>
        <li>
          <label>照片：</label><img
                src="${(Resume.picture == null) ? "../images/QST.jpg" : Resume.picture}"
                                           width="100px" height="100px">
        </li>
        <li>
          <label>性别：</label><label style="width: 200px;"><b style="color: #000">${Resume.gender}</b></label>
        </li>
        <li>
          <label>出生日期：</label><label style="width: 200px;"><b style="color: #000">${Resume.birthday}</b></label>
        </li>
        <li>
          <label>当前所在地：</label><label style="width: 200px;"><b style="color: #000">${Resume.location}</b></label>
        </li>
        <li>
          <label>户口所在地：</label><label style="width: 200px;"><b style="color: #000">${Resume.registration}</b></label>
        </li>
        <li>
          <label>手机号：</label><label style="width: 200px;"><b style="color: #000">${Resume.phone}</b></label>
        </li>
        <li>
          <label>邮箱：</label><label style="width: 200px;"><b style="color: #000">${Resume.email}</b></label>
        </li>
        <li>
          <label>求职意向：</label><label style="width: 200px;"><b style="color: #000">${Resume.target}</b></label>
        </li>
        <li>
          <label>工作经验：</label><label style="width: 200px;"><b style="color: #000">${Resume.experience}</b></label>
        </li>
      </ul>
    </div>
  </div>
</div>
</body>
</html>
