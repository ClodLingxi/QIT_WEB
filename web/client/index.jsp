<%@ page import="edu.ouc.stu.system.Tomcat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setAttribute("companyList", Tomcat.companyMapper.selectAllCompany());
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>RTO服务_锐聘官网-大学生求职,大学生就业,IT行业招聘，IT企业快速入职 - 锐聘网</title>
    <meta name="renderer" content="ie-stand">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/client/favicon.ico" type="image/x-icon"/>
    <meta content="ItOffer" name="generator">
    <meta content="大学生求职,大学生就业,大学生招聘,IT人才,IT人才招聘,大学生名企招聘,,大学生找工作,IT名企招聘，IT行业招聘，IT企业快速入职"
          name="keywords">
    <meta content="锐聘专注于为企业提供高效的人力资源解决方案，同时面向IT类技术人才推出快速一站式免费就业服务。秉承QST青软实训人才服务理念，为数千家企业量身定做个性化、全程化的人才培养体系，同时帮助中高级人才铺设成功之路，为人才和企业架设起沟通之桥。"
          name="description">
    <link href="${pageContext.request.contextPath}/client/css/base.css" type="text/css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/client/css/index.css" type="text/css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/js/a.js" type="text/javascript"></script>

</head>
<body class="tn-page-bg">

<iframe src="${pageContext.request.contextPath}/client/jsp.jsp" width="100%" height="100" scrolling="no"
        frameborder="0"></iframe>
<div id="tn-content">
    <div class="it-home-topbg">
        <div class="tn-box tn-widget tn-widget-content tn-corner-all it-home-top">
            <div class="tn-box-content tn-widget-content tn-corner-all">
                <div class="it-sliderkit">
                    <script src="${pageContext.request.contextPath}/js/sliderkit_002.js"
                            type="text/javascript"></script>
                    <script src="${pageContext.request.contextPath}/js/jquery.js" type="text/javascript"></script>
                    <script src="${pageContext.request.contextPath}/js/sliderkit.js" type="text/javascript"></script>
                    <div style="display: block;" class="sliderkit photoslider-1click">
                        <div class="sliderkit-btn sliderkit-go-btn sliderkit-go-prev" id="previousSlide"
                             style="display: block;"><a rel="nofollow" href="javascript:;"><span>Previous</span></a>
                        </div>
                        <div class="sliderkit-btn sliderkit-go-btn sliderkit-go-next" id="nextSlide"
                             style="display: block;"><a rel="nofollow" href="javascript:;"><span>Next</span></a></div>
                        <div style="" class="sliderkit-nav">
                            <div style="" class="sliderkit-nav-clip" id="slideNumPanel">
                                <ul style="width: 50px;">
                                    <li class="" style="width: 0px; height: 0px;"><a href="javascript:;" title="1">1</a>
                                    </li>
                                    <li class="" style="width: 0px; height: 0px;"><a href="javascript:;" title="2">1</a>
                                    </li>
                                    <li class="" style="width: 0px; height: 0px;"><a href="javascript:;" title="3">1</a>
                                    </li>
                                    <li class="sliderkit-selected" style="width: 0px; height: 0px;"><a
                                            href="javascript:;" title="4">1</a></li>
                                    <li class="" style="width: 0px; height: 0px;"><a href="javascript:;" title="5">1</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="sliderkit-panels">
                            <div style="display: block;" class="sliderkit-panel"><a
                                    href="${pageContext.request.contextPath}/index.htm" target="_blank">
                                <img src="${pageContext.request.contextPath}/client/images/635086152036177812.jpg"
                                     alt="1"> </a></div>
                            <div style="display: block;" class="sliderkit-panel"><a
                                    href="${pageContext.request.contextPath}/Index.htm" target="_blank">
                                <img src="${pageContext.request.contextPath}/client/images/635089669584615000.jpg"
                                     alt="2"> </a></div>
                            <div style="display: block;" class="sliderkit-panel sliderkit-panel-old"><a href="Index.htm"
                                                                                                        target="_blank">
                                <img src="${pageContext.request.contextPath}/client/images/635084673057125000.jpg"
                                     alt="3"> </a></div>
                            <div style="display: block;" class="sliderkit-panel sliderkit-panel-active"><a
                                    href="Index.htm" target="_blank"> <img
                                    src="${pageContext.request.contextPath}/client/images/635085509625826250.jpg"
                                    alt="4">
                            </a></div>
                            <div style="display: block;" class="sliderkit-panel"><a href="#" target="_blank"> <img
                                    src="${pageContext.request.contextPath}/client/images/635084672065718750.jpg"
                                    alt="5"> </a></div>
                        </div>
                    </div>
                    <script type="text/javascript">
                        $(window).load(function () {

                            $(".photoslider-1click").sliderkit({
                                auto: 1,
                                autostill: false,
                                timer: true,
                                keyboard: true,
                                shownavitems: 5,
                                circular: true
                            });

                            $("#slideNumPanel").attr("style", "");
                            //fanyc修改鼠标移上去再显示左右按钮
                            $(".photoslider-1click").mouseover(function (e) {
                                $("#previousSlide").show();
                                $("#nextSlide").show();
                            }).mouseout(function () {
                                $("#previousSlide").hide();
                                $("#nextSlide").hide();
                            });
                        });
                    </script>
                </div>
            </div>
        </div>
    </div>
    <div class="tn-grid">
        <div class="tn-box tn-widget tn-widget-content tn-corner-all it-home-box">
            <div class="tn-box-content tn-widget-content tn-corner-all">
                <div class="it-company-keyimg tn-border-bottom tn-border-gray"><a href="recruit/company.jsp"
                                                                                  target="_blank"> <img
                        src="${pageContext.request.contextPath}/client/images/635560750235172731.jpg" width="990"> </a>
                </div>
            </div>
        </div>
    </div>

    <jsp:useBean id="companyList" scope="request" type="java.util.List<edu.ouc.stu.model.TbCompany>"/>
    <jstl:forEach items="${companyList}" var="company">
        <div class="tn-grid">
            <div class="tn-box tn-widget tn-widget-content tn-corner-all it-home-box">
                <div class="tn-box-content tn-widget-content tn-corner-all">
                    <div class="it-company-keyimg tn-border-bottom tn-border-gray"><span><a
                            class="tn-button it-button-video"
                            href="http://www.itoffer.cn/Company/131#moreVideos"></a></span>
                        <a href="${pageContext.request.contextPath}/client/recruit/company.jsp?id=${company.companyId}" target="_blank">
                            <img src="${pageContext.request.contextPath}/upload/images/${company.companyPic}"
                                 width="990">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </jstl:forEach>
    <div class="tn-grid">
        <div class="tn-box tn-widget tn-widget-content tn-corner-all it-home-box">
            <div class="tn-box-content tn-widget-content tn-corner-all">
                <div class="it-company-keyimg tn-border-bottom tn-border-gray"><a href="recruit/company.jsp"
                                                                                  target="_blank"> <img
                        src="${pageContext.request.contextPath}/client/images/635386133707515461.jpg" width="990"> </a>
                </div>
                <div class="it-home-present">

                    <div class="it-present-btn"><a class=" tn-button tn-button-home-apply" href="recruit/company.jsp">
                        <span class="tn-button-text">我要申请</span> </a></div>
                    <div class="it-present-text" style="padding-left:185px;">
                        <div class="it-line01 it-text-bom">
                            <p class="it-text-tit">职位</p>
                            <p class="it-line01 it-text-explain"><span class="tn-icon it-home-arrow"></span> <a
                                    href="job.html" target="_blank" title=".NET软件开发工程师">.NET软件开发工程师</a>
                            </p>

                        </div>
                        <div class="it-line01 it-text-top">
                            <p class="it-text-tit">薪资</p>
                            <p class="it-line01 it-text-explain"><span class="tn-icon it-home-arrow"></span> <b
                                    title="3000起">3000起</b></p>
                        </div>
                    </div>
                    <div class="it-present-text">
                        <div class="it-line01 it-text-bom">
                            <p class="it-text-tit">职位</p>
                            <p class="it-line01 it-text-explain"><span class="tn-icon it-home-arrow"></span> <span
                                    class="tn-helper-right tn-action"> <a href="job.html" target="_blank"
                                                                          class="tn-button tn-corner-all tn-button-text-only tn-button-semidlong"> <span
                                    class="tn-button-text">更多职位</span> </a> </span> <a href="job.html"
                                                                                           target="_blank"
                                                                                           title=".NET软件开发工程师">.NET软件开发工程师</a>
                            </p>

                        </div>
                        <div class="it-line01 it-text-top">
                            <p class="it-text-tit">薪资</p>
                            <p class="it-line01 it-text-explain"><span class="tn-icon it-home-arrow"></span> <b
                                    title="3000起">3000起</b></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function setShare(title, url) {
            jiathis_config.title = title;
            jiathis_config.url = url;
        }

        var jiathis_config = {}

    </script>
    <script type="text/javascript">

        // 该函数用于执行倒计时
        function onTimer(id, time) {
            // 将传进来的long型转换成秒
            var remainingTime = time;
            var hour = 0;
            var minute = 0;
            var second = 0;

            // 需要将其句柄赋予一个变量，方便清除该事件
            var stopCountDown = setInterval(countDown, 1000);

            function countDown() {
                if (remainingTime > 0) {
                    // 如果倒计时大于0，则继续倒计时
                    day = Math.floor(remainingTime / 86400);
                    hour = Math.floor(Math.floor(remainingTime % 86400) / 3600);
                    minute = Math.floor(Math.floor(Math.floor(remainingTime % 86400) % 3600) / 60);
                    second = Math.floor(remainingTime % 60);
                    var formatTime = numToDate(day, hour, minute, second);
                    changeShowTime(id, formatTime);
                    remainingTime--;

                    /* 这里可用Ajax提交到服务器的 */

                } else {
                    // 若倒计时为0，则清除事件
                    clearInterval(stopCountDown);

                    /* 这里可用Ajax提交到服务器的 */
                }
            }
        }

        // 将数字转换成时间格式，如： 09:30:45
        function numToDate(day, hour, minute, second) {
            var tohour = hour;
            var tominute = minute;
            var tosecond = second;
            return day + "天 " + tohour + "小时 " + tominute + "分钟 " + tosecond + "秒";
        }

        // 该函数用于显示倒计时
        function changeShowTime(id, time) {
            /* 该函数内编写显示倒计时的语句 */
            ///////////////////////////////////////////////////////

            $(id).html(time);
        }

    </script>
    <script type="text/javascript" src="js/jia.js" charset="utf-8"></script>
    <div class="tn-box tn-widget tn-widget-content tn-corner-all it-home-recruiters">
        <div class="tn-box-content tn-widget-content tn-corner-all">
            <div class="tn-main-heading">
                <h2><span class="it-logos-title"></span></h2>
            </div>
            <div class="it-comlogo-list">
                <ul class="tn-photo-list tn-widget tn-helper-clearfix it-comlogo-ul it-comlogo-ul">
                    <li class="tn-photo-item">
                        <p class="tn-photo-wrap tn-widget-content tn-border-gray"><a
                                href="http://www.itoffer.cn/Company/128" title="上海博辕"> <img alt="上海博辕"
                                                                                                src="${pageContext.request.contextPath}/client/images/635090638930865000.jpg"
                                                                                                width="120"><span></span></a>
                        </p>
                    </li>
                    <li class="tn-photo-item">
                        <p class="tn-photo-wrap tn-widget-content tn-border-gray"><a href="Index.htm" title="博彦科技">
                            <img alt="博彦科技"
                                 src="${pageContext.request.contextPath}/client/images/634954112522421875.jpg"
                                 width="120"><span></span></a></p>
                    </li>
                    <li class="tn-photo-item">
                        <p class="tn-photo-wrap tn-widget-content tn-border-gray"><a href="Index.htm" title="东南融通">
                            <img alt="东南融通"
                                 src="${pageContext.request.contextPath}/client/images/634954112688671875.jpg"
                                 width="120"><span></span></a></p>
                    </li>
                    <li class="tn-photo-item">
                        <p class="tn-photo-wrap tn-widget-content tn-border-gray"><a href="Index.htm" title="华为"> <img
                                alt="华为" src="${pageContext.request.contextPath}/client/images/634954113455078125.jpg"
                                width="120"><span></span></a></p>
                    </li>
                    <li class="tn-photo-item">
                        <p class="tn-photo-wrap tn-widget-content tn-border-gray"><a href="Index.htm" title="东软"> <img
                                alt="东软" src="${pageContext.request.contextPath}/client/images/634954112813828125.jpg"
                                width="120"><span></span></a></p>
                    </li>
                    <li class="tn-photo-item">
                        <p class="tn-photo-wrap tn-widget-content tn-border-gray"><a href="Index.htm" title="南天信息">
                            <img alt="南天信息"
                                 src="${pageContext.request.contextPath}/client/images/634954113001796875.jpg"
                                 width="120"><span></span></a></p>
                    </li>
                    <li class="tn-photo-item">
                        <p class="tn-photo-wrap tn-widget-content tn-border-gray"><a href="Index.htm" title="群硕"> <img
                                alt="群硕" src="${pageContext.request.contextPath}/client/images/634954113155078125.jpg"
                                width="120"><span></span></a></p>
                    </li>
                    <li class="tn-photo-item">
                        <p class="tn-photo-wrap tn-widget-content tn-border-gray"><a href="Index.htm" title="日立"> <img
                                alt="日立" src="${pageContext.request.contextPath}/client/images/634954113301796875.jpg"
                                width="120"><span></span></a></p>
                    </li>
                    <li class="tn-photo-item">
                        <p class="tn-photo-wrap tn-widget-content tn-border-gray"><a href="Index.htm" title="人人网">
                            <img alt="人人网"
                                 src="${pageContext.request.contextPath}/client/images/634954206219375000.jpg"
                                 width="120"><span></span></a></p>
                    </li>
                    <li class="tn-photo-item">
                        <p class="tn-photo-wrap tn-widget-content tn-border-gray"><a href="Index.htm" title="简柏特">
                            <img alt="简柏特"
                                 src="${pageContext.request.contextPath}/client/images/634954217492226562.jpg"
                                 width="120"><span></span></a></p>
                    </li>
                    <li class="tn-photo-item">
                        <p class="tn-photo-wrap tn-widget-content tn-border-gray"><a href="Index.htm" title="联发科">
                            <img alt="联发科"
                                 src="${pageContext.request.contextPath}/client/images/634954210151210937.jpg"
                                 width="120"><span></span></a></p>
                    </li>
                    <li class="tn-photo-item">
                        <p class="tn-photo-wrap tn-widget-content tn-border-gray"><a href="Index.htm" title="创迹"> <img
                                alt="创迹" src="${pageContext.request.contextPath}/client/images/634954212053007812.jpg"
                                width="120"><span></span></a></p>
                    </li>
                    <li class="tn-photo-item">
                        <p class="tn-photo-wrap tn-widget-content tn-border-gray"><a href="Index.htm" title="nec"> <img
                                alt="nec" src="${pageContext.request.contextPath}/client/images/634954214356601562.jpg"
                                width="120"><span></span></a></p>
                    </li>
                    <li class="tn-photo-item">
                        <p class="tn-photo-wrap tn-widget-content tn-border-gray"><a href="Index.htm" title="NTTDATA">
                            <img alt="NTTDATA"
                                 src="${pageContext.request.contextPath}/client/images/634954215820976562.jpg"
                                 width="120"><span></span></a></p>
                    </li>
                </ul>
            </div>
        </div>
    </div>

</div>
<iframe src="${pageContext.request.contextPath}/client/foot.jsp" width="100%" height="150" scrolling="no"
        frameborder="0"></iframe>

</body>
</html>