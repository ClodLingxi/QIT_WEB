<%@ page import="edu.ouc.stu.system.Tomcat" %>
<%@ page import="edu.ouc.stu.model.TbCompany" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String id = request.getParameter("id");
    if(id == null) id = "1";
    TbCompany company = Tomcat.companyMapper.selectByPrimaryKey(Integer.parseInt(id));
    request.setAttribute("company", company);
    Integer companyId = company.getCompanyId();
    request.setAttribute("jobList", Tomcat.jobMapper.selectByParamAndCompanyName(companyId.toString(), ""));
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>“锐聘之星”软件设计大赛 - 锐聘网</title>
    <link href="${pageContext.request.contextPath}/client/css/base.css" type="text/css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/client/css/company.css" type="text/css" rel="stylesheet"/>
</head>

<body>
<iframe src="../jsp.jsp" width="100%" height="120" scrolling="no" frameborder="0"></iframe>
<div class="tn-grid">
    <div class="it-com-keyimg">
        <div class="tn-widget-content"><img src="${pageContext.request.contextPath}/upload/images/${company.companyPic}"/></div>
    </div>
</div>
<div class="clear"></div>
<div class="tn-grid">
    <div class="tn-widget-content">
        <div class="tn-box-content">
            <div class="tn-helper-clearfix">
                <div class="it-main2">
                    <div class="it-ctn-heading">
                        <div class="it-title-line"><span> <em> 157 </em> 浏览 </span>
                            <h3> 企业简介 </h3>
                        </div>
                    </div>
                    <div class="it-com-textnote"><span class="kuai"> ${company.companyType} </span> <span
                            class="kuai"> ${company.companyArea} </span> <span class="kuai"> ${company.companySize} </span> <span
                            class="kuai"> 性质：其它 </span></div>
                    <div class="it-company-text">
                        ${company.companyBrief}
                    </div>
                    <p class="tn-helper-right"><a href="/Home/SuccessCases?companyId=288" target="_blank"
                                                  class="tn-action"> <span class="tn-icon"> </span> <span
                            class="tn-action-text"> 成功案例 </span> </a></p>
                </div>
            </div>
        </div>
    </div>

    <input type="hidden" id="videoListCompanyId" value="151"/>
    <input type="hidden" id="companyTotalVideoCount" value='1'/>
    <div class="it-content-seqbox">
        <div id="morejob">
            <div class="it-ctn-heading">
                <div class="it-title-line">
                    <h3> 职位 </h3>
                </div>
            </div>
            <!--职位列表-->
            <jstl:forEach items="${jobList}" var="job">
                <div class="it-post-box tn-border-dashed">
                    <div class="it-post-name">
                        <div class="tn-helper-right it-post-btn"><a class="it-font-underline"
                                                                    href="${pageContext.request.contextPath}/client/recruit/job.jsp?id=${job.jobId}" target=_blank><span
                                class="tn-icon-view"></span><span class=tn-action-text>查看详细</span> </a><a
                                class="tn-button-small"
                                href="${pageContext.request.contextPath}/ApplicantManage?type=addApply&id=${job.jobId}&companyName=${job.companyName}&jobName=${job.jobName}"><span
                                class="tn-button-text">
                            申请
                        </span> </a></div>
                        <h3><a title=${job.jobName} href="${pageContext.request.contextPath}/client/recruit/job.jsp?id=${job.jobId}"
                               target=_blank>${job.jobName}</a></h3>
                    </div>
                    <ul class="it-post">
                        <li style="width:300px;">薪资： <span
                                class="it-font-size">2500~4000元/月</span></li>
                        <li style="width:250px;"><span class=tn-text-note>工作地区：</span>
                            <Label for="">苏州市</Label>
                        </li>
                        <li><span class="tn-text-note">招聘人数：</span> ${job.jobHiringnum}</li>
                        <li><span class="tn-text-note">申请人数：</span> ${job.jobApplicantnum}</li>
                    </ul>
                </div>
            </jstl:forEach>
            <!--职位列表-->
        </div>
    </div>
    <div class="bottomban">
        <div class="bottombanbox"><img src="${pageContext.request.contextPath}/upload/images/${company.companyPic}"/></div>
    </div>
</div>
</div>
</div>
<!-- InstanceBeginEditable name="backtop" -->
<p class="it-back-to-top" style=" position:fixed" id="backTop" title="返回顶部"><a href="#top"> <span> </span> 返回顶部
</a></p>
<!-- InstanceEndEditable -->
<iframe src="${pageContext.request.contextPath}/client/foot.jsp" width="100%" height="150" scrolling="no" frameborder="0"></iframe>
</div>
</body>
</html>