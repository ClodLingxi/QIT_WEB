<%@ page import="edu.ouc.stu.model.TbResume" %>
<%@ page import="edu.ouc.stu.system.Tomcat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    TbResume tbResume = (TbResume) request.getSession().getAttribute("resume");
    String resume_datetime = Tomcat.dataFormatter.format(tbResume.getResumeBirthday());
    request.setAttribute("resume", tbResume);
    request.setAttribute("resume_datetime", resume_datetime);
%>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>我的简历 - 锐聘网</title>
    <link href="${pageContext.request.contextPath}/client/css/base.css" type="text/css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/client/css/my_resume.css" type="text/css" rel="stylesheet"/>
    <meta content="大学生求职,大学生就业,大学生招聘,IT人才,IT人才招聘,大学生名企招聘,,大学生找工作,IT名企招聘，IT行业招聘，IT企业快速入职"
          name="keywords">
    <meta content="锐聘专注于为企业提供高效的人力资源解决方案，同时面向IT类技术人才推出快速一站式免费就业服务。秉承QST青软实训人才服务理念，为数千家企业量身定做个性化、全程化的人才培养体系，同时帮助中高级人才铺设成功之路，为人才和企业架设起沟通之桥。"
          name="description">

</head>

<body>
<iframe src="${pageContext.request.contextPath}/client/jsp.jsp" width="100%" height="100" scrolling="no"
        frameborder="0"></iframe>

<div class="resume_con">
    <!--tab设置-->
    <div class="user_operate">
        <ul style="float:left">
            <li><a href="resume.jsp" class="active">我的简历</a></li>
            <li><a href="${pageContext.request.contextPath}/client/applicant/jobApply.jsp">我的申请</a></li>
            <div class="clear"></div>
        </ul>
        <div class="clear"></div>
    </div>
    <!--主体部分-->
    <div class="resume_main">
        <!--左边-->
        <div class="resume_left">
            <div class="resume_title">
                <div style="float:left">基本信息</div>
            </div>
            <form action="${pageContext.request.contextPath}/ResumeClient?type=updateResume" method="post">
                <div class="all_resume">
                    <div class="table_style">
                        <table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
                            <tr>
                                <th width="110" align="right" bgcolor="#F8F8F8">姓名：</th>
                                <td bgcolor="#F8F8F8"><input type="text" name="resumeName" value="${resume.resumeName}"></td>
                            </tr>
                        </table>
                        <div class="he"></div>
                        <table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
                            <tr>
                                <th width="110" align="right" bgcolor="#F8F8F8">性别：</th>
                                <td bgcolor="#F8F8F8">
                                    <input type="radio" name="resumeGender" value="男" <jstl:if test='${resume.resumeGender == "男"}'> checked</jstl:if>> 男
                                    <input type="radio" name="resumeGender" value="女" <jstl:if test='${resume.resumeGender == "女"}'> checked</jstl:if>> 女
                                </td>
                            </tr>
                        </table>
                        <div class="he"></div>
                        <table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
                            <tr>
                                <th width="110" align="right" bgcolor="#F8F8F8">出生日期：</th>
                                <td bgcolor="#F8F8F8"><input type="text" name="resumeBirthday" value="${resume_datetime}"></td>
                            </tr>
                        </table>
                        <div class="he"></div>
                        <table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
                            <tr>
                                <th width="110" align="right" bgcolor="#F8F8F8">手机：</th>
                                <td bgcolor="#F8F8F8"><input type="text" name="resumePhone" value="${resume.resumePhone}"></td>
                            </tr>
                        </table>
                        <div class="he"></div>
                        <table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
                            <tr>
                                <th width="110" align="right" bgcolor="#F8F8F8">邮件：</th>
                                <td bgcolor="#F8F8F8"><input type="text" name="resumeEmail" value="${resume.resumeEmail}"></td>
                            </tr>
                        </table>
                        <div class="he"></div>
                        <table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
                            <tr>
                                <th width="110" align="right" bgcolor="#F8F8F8">求职意向：</th>
                                <td bgcolor="#F8F8F8"><input type="text" name="resumeTarget" value="${resume.resumeTarget}"></td>
                            </tr>
                        </table>
                        <div class="he"></div>
                        <table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
                            <tr>
                                <th width="110" align="right" bgcolor="#F8F8F8">工作经验：</th>
                                <td bgcolor="#F8F8F8"><input type="text" name="resumeExperience" value="${resume.resumeExperience}"></td>
                            </tr>
                        </table>
                        <div class="he"></div>
                        <div style="margin-left:100px;">
                            <input type="submit" class="save1" value="保存">
                            <jstl:if test='${resume.resumeName == ""}'>
                                <input name="cancel" type="text" class="cancel2" value="取消">
                            </jstl:if>
                        </div>
                    </div>
                    <div style="float:right" class="uploade">
                        <img src="${pageContext.request.contextPath}/upload/images/${resume.resumePicture}">
                        <div align="center">
                            <a href="${pageContext.request.contextPath}/client/applicant/resumeBasicInfoPicUpload.jsp" class="uploade_btn">更换照片</a>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            </form>

        </div>
        <!--右边-->
        <iframe src="${pageContext.request.contextPath}/client/applicant/resume_right.jsp" width="290" height="650"
                scrolling="no" frameborder="0"></iframe>
        <div style="clear:both"></div>
    </div>
</div>

<iframe src="${pageContext.request.contextPath}/client/foot.jsp" width="100%" height="150" scrolling="no"
        frameborder="0"></iframe>
</body>
</html>
