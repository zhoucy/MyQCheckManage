<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<title>QC管理系统</title>
<link href="${ctx}/css/main.css" rel="stylesheet" type="text/css">
<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css">
<link href="${ctx}/css/qccheck.css" rel="stylesheet" type="text/css">
<link href="${ctx}/css/Third-party-configuration.css" rel="stylesheet" type="text/css">
<script src="${ctx}/js/jquery.js"></script>  
<script type="text/javascript">
$(document).ready(function() { 
var message='<%=request.getAttribute("message")%>';
if(message!='null'){
alert(message);
}


})
</script>
</head>

<body>

<div class="g-header">
	<div class="g-logo"><img  height="50" width="60" src="${ctx}/img/logo2.png"></div>
    <div class="g-top-title">东莞港电电器制品有限公司</div>
   
</div>
<!--主体部分-->
<div class="g-main-body">
	
		<div class="Store-M-main">
			<p>&nbsp;</p>
			<div class="Store-tab-item-box">
			<ul class="nav-menu">
				<li><a href="${ctx}/index.jsp" class="Store-tab-item  menu-on">首页</a></li>
				<li><a href="${ctx}/qc/QCCheck.jsp" class="Store-tab-item ">QC检测</a></li>
				<li><a href="${ctx}/board/QCBoard.jsp" class="Store-tab-item ">看板管理</a></li>
			</ul>
			<div class="right">用户名：${sessionScope.name}<label class="username"></label><a href="${ctx}/qc/logout.do" class="label-1">登出</a></div>
				</div>
			<div class="blank20"></div>
           	     
           	     <div class="clear"></div>
           </div>
        </div>
        <div class="" style="clear: both;"></div>
    <div class="g-footer">Copyright ©港电电器 电子产品首选 地址:廣東東莞石排鎮交警大隊對面 联系邮箱: zhoucy@kongelectric.com</div>

</body>
</html>
