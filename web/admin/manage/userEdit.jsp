<%@ page import="edu.ouc.stu.model.TbUsers" %>
<%@ page import="edu.ouc.stu.system.Tomcat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    TbUsers passport = (TbUsers) session.getAttribute("passport");
    String temp = request.getParameter("id");
    if(temp == null){
        response.sendRedirect("userAdd.jsp");
        return;
    }
    int id = Integer.parseInt(temp);

    if (passport != null && id > 0 && Tomcat.userManager.validate(passport) != null && passport.getUserRole() == 1) {
        request.setAttribute("user", Tomcat.userManager.selectByPrimaryKey(id));
    }
%>

<!doctype html>
<html>
<head>
    <title>修改用户</title>
    <link href="../css/manageadmin.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="place"><span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">修改用户</a></li>
    </ul>
</div>
<div class="formbody">
    <div class="usual">
        <form name="frm" action="../../UserManage?type=updateUser&id=${user.userId}" method="post">
            <div class="tabson">
                <ul class="forminfo">
                    <li>
                        <label>登录名称<b>*</b></label>
                        <input name="userLogname" type="text" class="dfinput" style="width:518px;"
                               value="${user.userName}"/>
                    </li>
                    <li>
                        <label>登录密码<b>*</b></label>
                        <input name="userPwd" type="password" class="dfinput" style="width:518px;"
                               value="${user.userPwd}"/>
                    </li>
                    <li>
                        <label>真实姓名<b>*</b></label>
                        <input name="userRealname" type="text" class="dfinput" style="width:518px;"
                               value="${user.userRealname}"/>
                    </li>
                    <li>
                        <label>邮箱<b>*</b></label>
                        <input name="userEmail" type="text" class="dfinput" style="width:518px;" value="${user.userEmail}"/>
                    </li>
                    <li>
                        <label>用户角色<b>*</b></label>
                        <div class="vocation">
                            <select name="userRole" class="select3">
                                <jstl:set var="role" value="${user.userRole}" />
                                <option value="3" <jstl:if test="${role == 3}">selected</jstl:if>>普通用户</option>
                                <option value="2" <jstl:if test="${role == 2}">selected</jstl:if>>企业管理员</option>
                                <option value="1" <jstl:if test="${role == 1}">selected</jstl:if>>系统管理员</option>
                            </select>
                        </div>
                    </li>
                    <li>
                        <label>用户状态<b>*</b></label>

                        <jstl:set var="state" value="${user.userState}" />
                        <input name="userState" type="radio" value="1" <jstl:if test="${state == 1}">checked</jstl:if>/>启用
                        <input name="userState" type="radio" value="0" <jstl:if test="${state == 0}">checked</jstl:if>/>禁用
                    </li>
                    <li><label>&nbsp;</label>
                        <input name="" type="submit" class="btn" value="修改"/>
                    </li>
                </ul>
            </div>
        </form>
    </div>
</div>
</body>
</html>