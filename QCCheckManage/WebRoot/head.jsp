<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>

<style type="text/css">
.menu-on{ background: #A72222 !important;}

</style>



	<div class="Store-tab-item-box">
				<ul class="nav-menu">
				<li><a href="${ctx}/index.jsp" class="Store-tab-item ">首页</a></li>
				<li><a href="${ctx}/qc/QCCheck.jsp" class="Store-tab-item ">QC检测</a></li>
				<li><a href="${ctx}/board/QCBoard.jsp" class="Store-tab-item ">看板管理</a></li>
				<li><a href="${ctx}/report/QCReport.jsp" class="Store-tab-item menu-on">报表管理</a></li>
			</ul>
				<div class="right">
					用户名：${sessionScope.name}<label class="username"></label><a
						href="${ctx}/qc/logout.do" class="label-1">登出</a>
				</div>
</div>