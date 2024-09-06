<%@ page import="edu.ouc.stu.model.TbUsers" %>
<%@ page import="edu.ouc.stu.system.Tomcat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    TbUsers passport = (TbUsers) session.getAttribute("passport");
    String temp = request.getParameter("id");
    if(temp == null){
        response.sendRedirect("companyEdit.jsp");
        return;
    }
    int id = Integer.parseInt(temp);

    if (passport != null && id > 0 && Tomcat.userManager.validate(passport) != null && passport.getUserRole() == 1) {
        request.setAttribute("company", Tomcat.companyMapper.selectByPrimaryKey(id));
    }
%>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>添加企业</title>
    <link href="../css/manageadmin.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("companyName").value == "") {
                alert("企业名称不能为空！");
                document.getElementById("companyName").focus();
                return false;
            }
            if (document.getElementById("companyArea").value == "") {
                alert("企业所在地不能为空！");
                document.getElementById("companyArea").focus();
                return false;
            }
            if (document.getElementById("companySize").value == "") {
                alert("企业规模不能为空！");
                document.getElementById("companySize").focus();
                return false;
            }
            if (document.getElementById("companyType").value == "") {
                alert("企业性质不能为空！");
                document.getElementById("companyType").focus();
                return false;
            }
            if (document.getElementById("companyPic").value == "") {
                alert("请选择企业宣传图片！");
                document.getElementById("companyPic").focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div class="place"><span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">添加企业</a></li>
    </ul>
</div>
<div class="formbody">
    <div class="usual">
        <form name="frm" action="${pageContext.request.contextPath}/CompanyManage?type=updateCompany&id=${company.companyId}" method="post"
              enctype="multipart/form-data" onsubmit="return validate();">
            <div class="tabson">
                <ul class="forminfo">
                    <li>
                        <label>企业名称<b>*</b></label>
                        <input name="companyName" type="text" id="companyName" class="dfinput" style="width:518px;"
                               value="${company.companyName}"/>
                    </li>
                    <li>
                        <label>企业所在地<b>*</b></label>
                        <input name="companyArea" type="text" id="companyArea" class="dfinput" style="width:518px;"
                               value="${company.companyArea}"/>
                    </li>
                    <li>
                        <label>企业规模<b>*</b></label>
                        <input name="companySize" type="text" id="companySize" class="dfinput" style="width:518px;"
                               value="${company.companySize}"/>
                    </li>
                    <li>
                        <label>企业性质<b>*</b></label>
                        <input name="companyType" type="text" id="companyType" class="dfinput" style="width:518px;"
                               value="${company.companyType}"/>
                    </li>
                    <li>
                        <p>企业简介&nbsp;(不超过1000字)</p>
                        <textarea class="ckeditor" cols="50" id="companyBrief" name="companyBrief"
                                  rows="10">${company.companyBrief}</textarea>
                    </li>
                    <li>
                        <label>企业招聘状态</label>
                        <div class="vocation">
                            <select name="companyState" class="select3">
                                <jstl:set var="state" value="${company.companyState}"/>
                                <option value="0" <jstl:if test="${state == 1}">selected</jstl:if>>招聘中
                                </option>
                                <option value="1" <jstl:if test="${state == 2}">selected</jstl:if>>已暂停
                                </option>
                                <option value="2" <jstl:if test="${state == 3}">selected</jstl:if>>已结束
                                </option>
                            </select>
                        </div>
                    </li>
                    <li>
                        <label>显示排序<b></b></label>
                        <input name="companySort" type="text" class="dfinput" style="width:100px;" value="${company.companySort}"/>
                    </li>
                    <li>
                        <label>宣传图片<b>*</b></label>
                        <input name="companyPic" id="companyPic" type="file" class="dfinput"
                               style="width:300px; margin-right:5px;"/>
                    </li>
                    <li><label>&nbsp;</label>
                        <input name="" type="submit" class="btn" value="添加"/>
                    </li>
                </ul>
            </div>
        </form>
    </div>
</div>
</body>
</html>
