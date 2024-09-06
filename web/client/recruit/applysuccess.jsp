<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>“锐聘之星”软件设计大赛 - 锐聘网</title>
<link href="${pageContext.request.contextPath}/client/css/base.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/client/css/applysuccess.css" type="text/css" rel="stylesheet" />
<body>
<iframe src="${pageContext.request.contextPath}/client/jsp.jsp" width="100%" height="120" scrolling="no" frameborder="0" ></iframe>
<div class="applyit-content-box">
  <div class="it-success-tips">
    <div class="it-success-icon">
      <div class="it-pageimg"> </div>
    </div>
    <div class="it-success-word"> <a href="#" title="恭喜您成功申请职位！">恭喜您成功申请职位！</a> <br>
      锐聘网会在3-5天内跟您取得联系。
      <p> 企业：<a href="#"><b>${param.getOrDefault("companyName", "空公司名")}</b></a><br>
        职位：<a href="#"><b>${param.getOrDefault("jobName", "空职业名")}</b></a></p>
    </div>
    <div class="clear"></div>
  </div>
  <div class="it-more-actions">
    <p class="tn-text-note"> 接下来您可以：</p>
    <div class="it-comment-btn"> <a href="${pageContext.request.contextPath}/client/index.jsp" class="app_btn"> <span class="tn-icon it-icon-arrow"></span><span class="tn-button-text">申请其他职位</span> </a> </div>
  </div>
  <div class="it-secondary-link">
    <ul>
      <li><span class="it-icon-view"></span> <a href="${pageContext.request.contextPath}/client/applicant/jobApply.jsp" title="查看我的职位申请">查看我的职位申请</a> </li>
      <li><span class="it-icon-modify"></span> <a href="${pageContext.request.contextPath}/client/applicant/resume.jsp" title="修改我的简历">修改我的简历</a> </li>
    </ul>
  </div>
</div>
<iframe src="${pageContext.request.contextPath}/client/foot.jsp" width="100%" height="150" scrolling="no" frameborder="0" ></iframe>
</body>
</html>
