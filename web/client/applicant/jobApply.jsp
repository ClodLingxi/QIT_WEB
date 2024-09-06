<%@ page import="edu.ouc.stu.model.TbUsers" %>
<%@ page import="edu.ouc.stu.system.Tomcat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    TbUsers passport = (TbUsers) request.getSession().getAttribute("passport");
    Integer userId = (Integer) Tomcat.userManager.validate(passport);
    if (userId > 0) {
        request.setAttribute("applyList", Tomcat.applyMapper.selectAllByUserId(userId));
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>我的工作申请 - 锐聘网</title>
    <link href="../css/base.css" rel="stylesheet" type="text/css"/>
    <link href="../css/myapplys.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<iframe src="../jsp.jsp" width="100%" height="100" scrolling="no" frameborder="0"></iframe>
<div id="tn-content" class="tn-content-bg">
    <div class="tn-wrapper">
        <div class="tn-grid">
            <div class="it-content-box it-person">
                <div class="tn-box-content">
                    <div class="tn-tabs">
                        <ul class="tn-tabs-nav tn-widget-content ">
                            <li><a href="resume.jsp">我的简历</a></li>
                            <li class="tn-tabs-selected"><a href="jobApply.html">我的申请</a></li>
                        </ul>
                        <div class="tn-tabs-panel tn-widget-content">
                            <form action="#" method="post" id="Form-Apply">
                                <table class="tn-table-grid">
                                    <tbody>
                                    <jstl:forEach items="${applyList}" var="apply">
                                        <jstl:set var="progress_width" value="1"/>
                                        <jstl:if test="${apply.applyState == 1}">
                                            <jstl:set var="width" value="50" />
                                        </jstl:if>
                                        <jstl:if test="${apply.applyState == 2}">
                                            <jstl:set var="width" value="100" />
                                        </jstl:if>

                                        <tr class="tn-table-grid-row">
                                            <td class="tn-width-check"><input type="checkbox" class="tn-checkbox tnui-apply"
                                                                              value="487" name="applyIdList"></td>
                                            <td class="tn-width-auto"><a title=${apply.applyCompanyName}
                                                                         href="${pageContext.request.contextPath}/client/recruit/company.jsp?id=${apply.applyCompanyId}" target="_blank">
                                                ${apply.applyCompanyName}</a></td>
                                            <th class="tn-width-pic-mini"><a title=${apply.applyJobName}
                                                                             href="${pageContext.request.contextPath}/client/recruit/job.jsp?id=${apply.applyCompanyId}" target="_blank">
                                                    ${apply.applyJobName}</a></th>
                                            <td class="tn-width-category">
                                                <div class="tn-instructions">
                                                    <div class="it-instructions-tit"><span
                                                            style="width: 26px">申请</span><span
                                                            style="width: 132px">审核</span><span
                                                            style="width: 132px">通知</span></div>
                                                    <div class="tn-progress-bar tn-widget-content tn-corner-all">
                                                        <div
                                                                style="width: ${progress_width}%"
                                                                class="tn-progress-bar-value tn-widget-header tn-corner-left tn-border-tbl"></div>
                                                    </div>
                                                    <ul class="tn-helper-clearfix tn-step-scale">

                                                    </ul>
                                                </div>
                                            </td>
                                            <td class="tn-width-action2"><span class="tn-action"> <a
                                                    class="tn-action tn-action-text-icon tnui-apply-delete"
                                                    href="${pageContext.request.contextPath}/ApplicantManage?type=deleteApply?id=${apply.applyId}"> <span
                                                    class="tn-icon it-icon-delete"></span><span
                                                    class="tn-action-text">删除</span></a> </span></td>
                                        </tr>
                                    </jstl:forEach>
                                    </tbody>
                                </table>
                            </form>
                            <div class="it-page-results tn-helper-clearfix">
                                <div class="tn-helper-left"><a
                                        class="tn-button tn-corner-all tn-button-text-only tn-button-semidlong" href="#"
                                        id="deleteAll"> <span class="tn-button-text">删除</span></a></div>
                                <div class="tn-pagination tn-pagination-simple tn-helper-clearfix">
                                    <div class="tn-pagination-btn"><span
                                            class="tn-page-prev tn-page-thumb">上一页</span> <span
                                            class="tn-page-number tn-selected">1</span> <a href="#"
                                                                                           class="tn-page-number">2</a>
                                        <a href="#" class="tn-page-thumb tn-page-next">下一页</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<iframe src="../foot.jsp" width="100%" height="150" scrolling="no" frameborder="0"></iframe>
</body>
</html>
