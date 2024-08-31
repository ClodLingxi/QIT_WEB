<%@ page import="edu.ouc.stu.model.TbUsers" %>
<%@ page import="edu.ouc.stu.system.Tomcat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    TbUsers passport = (TbUsers) session.getAttribute("passport");
    if (passport != null && Tomcat.userManager.validate(passport) != null) {
        String id = request.getParameter("id");
        if (id != null) {
            request.setAttribute("resume", Tomcat.resumeMapper.selectByPrimaryKey(Integer.parseInt(id)));
        }
    }
%>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>简历详情</title>
    <link href="../css/manageadmin.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="place"><span>位置：</span>
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
                    <label>真实姓名：</label><label style="width: 200px;"><b
                        style="color: #000">${resume.resumeName}</b></label>
                </li>
                <li>
                    <label>照片：</label><img
                        src="${(resume.resumePicture == null || resume.resumePicture == "") ? "../images/QST.jpg" : Resume.picture}"
                        width="100px" height="100px">
                </li>
                <li>
                    <label>性别：</label><label style="width: 200px;"><b style="color: #000">${resume.resumeGender}</b></label>
                </li>
                <li>
                    <label>出生日期：</label><label style="width: 200px;"><b
                        style="color: #000">${resume.resumeBirthday}</b></label>
                </li>
                <li>
                    <label>当前所在地：</label><label style="width: 200px;"><b style="color: #000">${resume.resumeLocation}</b></label>
                </li>
                <li>
                    <label>户口所在地：</label><label style="width: 200px;"><b
                        style="color: #000">${resume.resumeRegistration}</b></label>
                </li>
                <li>
                    <label>手机号：</label><label style="width: 200px;"><b
                        style="color: #000">${resume.resumePhone}</b></label>
                </li>
                <li>
                    <label>邮箱：</label><label style="width: 200px;"><b style="color: #000">${resume.resumeEmail}</b></label>
                </li>
                <li>
                    <label>求职意向：</label><label style="width: 200px;"><b
                        style="color: #000">${resume.resumeTarget}</b></label>
                </li>
                <li>
                    <label>工作经验：</label><label style="width: 200px;"><b style="color: #000">${resume.resumeExperience}</b></label>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
