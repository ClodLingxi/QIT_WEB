<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>登录 - 锐聘网</title>
    <link href="${pageContext.request.contextPath}/client/css/base.css" type="text/css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/client/css/login.css" type="text/css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/client/js/a.js" type="text/javascript"></script>
    <script>

        function validate() {
            if(document.getElementById("userLogname").value == ""){
                alert("用户邮箱不能为空！");
                document.getElementById("userLogname").focus();
                return false;
            }
            if(document.getElementById("userPwd").value == ""){
                alert("登录密码不能为空！");
                document.getElementById("userPwd").focus();
                return false;
            }
            if(document.getElementById("ValidateCode").value == ""){
                alert("验证码不能为空不能为空！");
                document.getElementById("ValidateCode").focus();
                return false;
            }

            return true;
        }

    </script>

    <meta content="大学生求职,大学生就业,大学生招聘,IT人才,IT人才招聘,大学生名企招聘,,大学生找工作,IT名企招聘，IT行业招聘，IT企业快速入职"
          name="keywords">
    <meta content="锐聘专注于为企业提供高效的人力资源解决方案，同时面向IT类技术人才推出快速一站式免费就业服务。秉承QST青软实训人才服务理念，为数千家企业量身定做个性化、全程化的人才培养体系，同时帮助中高级人才铺设成功之路，为人才和企业架设起沟通之桥。"
          name="description">
</head>

<body>
<iframe src="${pageContext.request.contextPath}/client/jsp.jsp" width="100%" height="100" scrolling="no"
        frameborder="0"></iframe>
<div class="content">
    <div class="page_name">登陆</div>
    <div class="login_content">
        <div class="login_l">
            <p class="font14">使用注册邮箱登录</p>
            <form action="${pageContext.request.contextPath}/UserServlet?role=user" method="post"
                  onsubmit="return validate();">
                <div class="span1">
                    <label class="tn-form-label">邮箱：</label>
                    <input name="userLogname" id="userLogname" class="tn-textbox" type="text">
                </div>
                <div class="span1">
                    <label class="tn-form-label">密码：</label>
                    <input name="userPwd" id="userPwd" class="tn-textbox" type="password">
                </div>
                <div class="tn-form-row-button">
                    <div class="span1">
                        <input type="submit" class="tn-button-text" value="登   录" id="loginBut">
                        <span class="it-register-text">

                        <input checked="checked" class="tn-checkbox" value="true" type="checkbox">
                        <label for="RememberPassword"> 记住密码</label>
                        </span>
                    </div>
                    <div align="center">
                        <font style="color: red;">${sessionScope.msg}</font>
                    </div>
                </div>
            </form>
        </div>
    <div class="clear"></div>
</div>
<div class="login_r">
    <p align="center"><b>还没有帐号？</b><a
            href="${pageContext.request.contextPath}/client/register.jsp">10秒钟快速注册</a>
    </p>

    <div><img src="${pageContext.request.contextPath}/client/images/login_pic.jpg"></div>

    <div class="clear"></div>
</div>
<div class="clear"></div>
</div>
</div>
<iframe src="${pageContext.request.contextPath}/client/foot.jsp" width="100%" height="150" scrolling="no"
        frameborder="0"></iframe>
</body>
</html>
