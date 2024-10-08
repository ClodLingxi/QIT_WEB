<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>无标题文档</title>
    <link href="${pageContext.request.contextPath}/client/css/base.css" type="text/css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/client/css/my_resume.css" type="text/css" rel="stylesheet"/>
</head>

<body>
<div class="it-aside">
    <div class="it-aside-fixed">


        <div id="resumeSavePreview">
            <div class="it-comment-btn">
                <a id="reviewResume" class="tn-button tn-corner-all tn-button-text-only tn-button-preview"
                   href="${pageContext.request.contextPath}/client/applicant/resumeView.jsp" target="_parent"
                   plugin="dialog">
                    <span class="tn-button-text">简历预览</span>
                </a>
                <a id="saveResume" class="tn-button tn-corner-all tn-button-text-only tn-button-save"
                   href="javascript:;">
                    <span class="tn-button-text">保存简历</span>
                </a>

            </div>
        </div>


        <div id="resumeFull">
            <div class="tn-instructions tn-border-gray tn-border-bottom">
                <p class="tn-progress-text"><span class="tn-text-note">简历完整度</span><strong
                        class="tn-action">45%</strong></p>
                <div class="tn-progress-bar tn-widget-content tn-corner-all">
                    <div class="tn-progress-bar-value tn-widget-header tn-corner-left tn-border-tbl"
                         style="width: 45%"></div>
                </div>
            </div>
            <div class="it-editdata-list">
                <ul>
                    <li class="tn-editdata-bg"><a class="tn-button-text" href="#Resume">基本信息</a> <span
                            class="tn-icon it-icon-accept"></span></li>
                    <li class="tn-editdata-bg"><a class="tn-button-text" href="#ResumesEducationExperience">
                        教育经历</a>
                        <span class="tn-icon it-icon-accept"></span>
                    </li>
                    <li class="tn-editdata-bg"><a class="tn-button-text" href="#WorkExperience">工作经历</a>
                        <span class="tn-icon it-icon-accept"></span>
                    </li>
                    <li class="tn-editdata-bg"><a class="tn-button-text" href="#ResumesLanguageAbility">
                        语言能力</a>
                        <span class="tn-icon it-icon-accept"></span>
                    </li>
                    <li class="tn-editdata-bg"><a class="tn-button-text" href="#ResumesProjectExperience">
                        项目经验</a>
                        <span class="tn-icon it-icon-stop"></span>
                    </li>
                    <li class="tn-editdata-bg"><a class="tn-button-text" href="#ResumesHonour">获得证书</a>
                        <span class="tn-icon it-icon-stop"></span>
                    </li>
                    <li class="tn-editdata-bg"><a class="tn-button-text" href="#ResumesTrainExperience">
                        培训经历</a>
                        <span class="tn-icon it-icon-stop"></span>
                    </li>
                    <li class="tn-editdata-bg"><a class="tn-button-text" href="#ResumesITTec">IT技能</a>
                        <span class="tn-icon it-icon-accept"></span>
                    </li>
                    <li class="tn-editdata-bg"><a class="tn-button-text" href="#ResumesOtherInfo">其他信息</a>
                        <span class="tn-icon it-icon-stop"></span>
                    </li>
                    <li class="tn-editdata-bg"><a class="tn-button-text" href="#Resume">简历照片</a>
                        <span class="tn-icon it-icon-stop"></span>
                    </li>
                    <li class="tn-editdata-bg"><a class="tn-button-text" href="#ResumesAttachment">简历附件</a>
                        <span class="tn-icon it-icon-stop"></span>
                    </li>
                </ul>
            </div>
            <div class="it-list-aid">
					    <span class="tn-action tn-action-text-icon"><span class="tn-icon it-icon-accept"></span>
					    <span class="tn-action-text tn-text-note">已填写</span></span>
                <span class="tn-action tn-action-text-icon">
					    <span class="tn-icon it-icon-stop"></span><span class="tn-action-text tn-text-note">
					    暂未填写</span>
					    </span>
            </div>
        </div>
    </div>
</div>
</body>
</html>
