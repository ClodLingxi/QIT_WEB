﻿<%@ page import="edu.ouc.stu.system.Tomcat" %>
<%@ page import="edu.ouc.stu.model.TbJob" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>

<%
  String id = request.getParameter("id");
  if(id == null) id = "1";
  TbJob job = Tomcat.jobMapper.selectByPrimaryKey(Integer.parseInt(id));
  request.setAttribute("job", job);
  String endDate = Tomcat.dataFormatter.format(job.getJobEnddate());
  request.setAttribute("endDate", endDate);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>“锐聘之星”软件设计大赛 - 锐聘网</title>
<link href="${pageContext.request.contextPath}/client/css/base.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/client/css/job.css" type="text/css" rel="stylesheet">
</head>
<body>
<iframe src="${pageContext.request.contextPath}/client/jsp.jsp" width="100%" height="120" scrolling="no" frameborder="0"> </iframe>
<div class="tn-grid">
  <div class="it-com-keyimg">
    <div class="tn-widget-content"> <img src="../images/635581231315281772.jpg"> </div>
  </div>
</div>
<div class="tn-grid">
  <div class="tn-box-content">
    <div class="it-main">
      <div class="it-ctn-heading">
        <div class="it-title-line"> <span class="it-hover-text"><a href="#" target="_blank">其它同类职位</a><span style="float:left;margin-right:20px">
          <a href="http://www.jiathis.com/share/?uid=您的UID" target="_blank">分享</a>
          </span></span>
          <h3>${job.jobName}</h3>
        </div>
      </div>
      <div class="job">
        <table class="it-table">
          <tbody>
            <tr>
              <td class="it-table-title"> 招聘人数： </td>
              <td class="tn-border-rb"> ${job.jobHiringnum} </td>
              <td class="it-table-title"> 薪资： </td>
              <td class="tn-border-rb"> ${job.jobSalary} </td>
            </tr>
            <tr>
              <td class="it-table-title"> 年龄要求： </td>
              <td class="tn-border-rb">  </td>
              <td class="it-table-title"> 截至日期 </td>
              <td class="tn-border-rb"> ${endDate} </td>
            </tr>
            <tr>
              <td class="it-table-title"> 学历要求： </td>
              <td class="tn-border-rb"> 本科及以上 </td>
              <td class="it-table-title"> 性别要求： </td>
              <td class="tn-border-rb"> 不限 </td>
            </tr>
            <tr>
              <td class="it-table-title"> 专业要求： </td>
              <td class="tn-border-rb"> 电子信息类 </td>
              <td class="it-table-title"> 外语要求： </td>
              <td class="tn-border-rb"> 日语(熟练) </td>
            </tr>
          </tbody>
        </table>
        <div class="it-post-count">
          <ul class="tn-text-note it-text-part">
            <li class="jobli"><span class="tn-explain-icon"><span class="tn-icon it-icon-time"></span><span class="tn-icon-text" id="leftTimeShowSpan">
              <label>已过期</label>
              </span></span></li>
            <li class="jobli"><span class="tn-explain-icon"><span class="tn-icon it-icon-people"></span><span class="tn-icon-text">招聘人数 <span class="it-font-cor">40</span> 人</span></span></li>
            <li class="jobli"><span class="tn-explain-icon"><span class="tn-icon it-icon-people"></span><span class="tn-icon-text">申请人数 <span class="it-font-cor">44</span> 人</span></span></li>
          </ul>
        </div>
        <div class="clear"> </div>
        <div class="it-post-text">
          <p> <strong>招聘岗位：</strong>软件开发（对日方向） </p>
          <p class="default"> <strong>技术方向：</strong>JAVA（计算机及理工科相关专业应届生） </p>
          <p class="default"> <strong>学历要求：</strong>本科以上 </p>
          <p class="default"> <strong>需求人数：</strong>30人 </p>
          <p class="default"> <strong>工作地点：</strong>济南 </p>
          <p class="default"> <strong>招聘要求：(1)</strong>J2EE开发 TOMCAT/JBOSS等主流应用服务器 Webservice、SOCKET、SNMP等标准接口和协议,Struts2、Spring、Hibernate等常用框架 Linux操作系统及oracle;(2)有很好的逻辑思维能力，学习能力强；沟通能力优秀，有团队精神；有责任心，踏实敬业；(3)挂科数少于1门（专业课挂科淘汰，其他科且已补考通过的可以考虑）。<strong></strong> </p>
          <p class="default"> <strong>岗前培训：</strong>入职前需要经过4个月左右的岗前培训 </p>
          <p class="default"> <strong>工资待遇：</strong> </p>
          <p class="default"> <strong>实习期工资：济南：</strong>1000元/月 </p>
          <p> <strong><strong>转正工资：济南：</strong>年薪4-5.5万元 按照国家标准缴纳五险一金。</strong> </p>
          <p> <strong>工作地点：</strong>山东济南 </p>
          <p>&nbsp; </p>
          <p> <strong>职业发展：</strong> 日立华胜济南分公司正处于快速发展规模的关键时期，有大量的部门经理及以上职位等待大家去竞聘。 </p>
          <p> <strong>职业发展</strong>： </p>
          <p> 部门经理 </p>
        </div>
        <div class="it-requirements-title">
          <h3 class="it-font-size">职位要求</h3>
        </div>
        <div class="it-post-text">
          <p><strong>岗位描述：</strong> 对日软件开发工程师，从事开发、测试及设计等工作</p>
          <p><strong>任职资格：</strong></p>
          <p><strong></strong>1. 2015届本科计算机相关专业，对软件开发、软件设计工作有兴趣、有自信</p>
          <p>2. 熟练掌握C/C++、JAVA等开发语言.</p>
          <p>3. 熟练使用数据库相关操作</p>
          <p>4. 日语N4 等级</p>
          <p>&nbsp;</p>
          <p><strong>联系方式：</strong></p>
          <p align="left">袁莎莎： 13012486818 QQ:391013093</p>
          <p align="left">mail：yuanshsh@itshixun.com</p>
          <p align="left">辛 俊： 15140365693 QQ:2453435523</p>
          <p align="left">mail：xinj@itshixun.com</p>
        </div>
        <div class="btn_bot"> <a class="tn-button-secondary" href="${pageContext.request.contextPath}/client/recruit/company.jsp?id=${job.companyId}" target="_blank"> <span style="color:#1faebc"  class="tn-button-text">查看公司信息</span> </a> </div>
      </div>
    </div>
    <div class="job_right">
      <div class="it-listbox">
        <div class="it-listbox-header">
          <div class="tn-option"><a href="#" target="_blank">更多</a></div>
          <h3 class="tn-helper-reset">职位分类</h3>
        </div>
        <div class="it-listbox-content">
          <ul>
            <li><span class="tn-icon"></span><a title="软件开发工程师" href="#" target="_blank">软件开发工程师</a></li>
            <li><span class="tn-icon"></span><a title=".Net软件开发" href="#" target="_blank">.Net软件开发</a></li>
            <li><span class="tn-icon"></span><a title="移动客户端开发" href="#" target="_blank">移动客户端开发</a></li>
            <li><span class="tn-icon"></span><a title="Java软件开发" href="#" target="_blank">Java软件开发</a></li>
            <li><span class="tn-icon"></span><a title="其他" href="#" target="_blank">其他</a></li>
            <li><span class="tn-icon"></span><a title="IT运维工程师" href="#" target="_blank">IT运维工程师</a></li>
          </ul>
        </div>
      </div>
      <div class="it-listbox">
        <div class="it-listbox-header">
          <div class="tn-option"><a href="http://www.itoffer.cn" target="_blank">更多</a></div>
          <h3 class="tn-helper-reset">热招企业</h3>
        </div>
        <div class="it-listbox-content">
          <ul>
            <li><span class="tn-icon"></span><a title="“锐聘之星”软件设计大赛" href=#" target="_blank">“锐聘之星”软件设计大赛</a></li>
            <li><span class="tn-icon"></span><a title="凌志软件股份有限公司" href="#" target="_blank">凌志软件股份有限公司</a></li>
            <li><span class="tn-icon"></span><a title="北京日立华胜信息系统有限公司" href="#" target="_blank">北京日立华胜信息系统有限公司</a></li>
            <li><span class="tn-icon"></span><a title="宏智科技（苏州）有限公司" href="#" target="_blank">宏智科技（苏州）有限公司</a></li>
            <li><span class="tn-icon"></span><a title="江苏仕德伟网络科技股份有限公司" href="#" target="_blank">江苏仕德伟网络科技股份有限公司</a></li>
            <li><span class="tn-icon"></span><a title="青岛百灵信息科技有限公司" href="#" target="_blank">青岛百灵信息科技有限公司</a></li>
            <li><span class="tn-icon"></span><a title="无锡晟奥软件有限公司" href="#" target="_blank">无锡晟奥软件有限公司</a></li>
            <li><span class="tn-icon"></span><a title="苏州大宇宙信息创造有限公司" href="#" target="_blank">苏州大宇宙信息创造有限公司</a></li>
            <li><span class="tn-icon"></span><a title="青岛拓宇网络科技有限公司" href="#" target="_blank">青岛拓宇网络科技有限公司</a></li>
            <li><span class="tn-icon"></span><a title="无锡NTT DATA有限公司" href="#" target="_blank">无锡NTT DATA有限公司</a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="clear"> </div>
  </div>
</div>
<iframe src="${pageContext.request.contextPath}/client/foot.jsp" width="100%" height="150" scrolling="no" frameborder="0"> </iframe>
</body>
</html>