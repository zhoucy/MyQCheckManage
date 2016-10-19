<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<title>QC报表管理</title>
<link href="${ctx}/css/main.css" rel="stylesheet" type="text/css">
<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css">
<link href="${ctx}/css/qccheck.css" rel="stylesheet" type="text/css">
<link href="${ctx}/css/Third-party-configuration.css" rel="stylesheet"
	type="text/css">
<script src="${ctx}/js/jquery.js"></script>


</head>

<body>

	<div class="g-header">
		<div class="g-logo">
			<img src="${ctx}/img/logo2.jpg">
		</div>
		<div class="g-top-title">东莞港电电器制品有限公司</div>

	</div>
	<!--主体部分-->
	<div class="g-main-body">

		<div class="Store-M-main">
			<p>&nbsp;</p>
			<%@ include file="../head.jsp" %>  
			<div class="g-main">
				<div class="g-left">
					<dl>
						<dt >   <img src="../img/p-menu.png">
							报表管理
						</dt>
						<dd>
							<a href="${ctx}/report/QCReport.jsp" >QC检查记录表</a>
						</dd>
						<dd>
							<a href="${ctx}/report/QCGoodProject.jsp" class="g-currentMenu">良品条形码</a>
						</dd>
						<dd>
							<a href="${ctx}/report/QCBadProject.jsp" >不良品条形码</a>
						</dd>
						<dd>
							<a href="${ctx}/report/QCDateReport.jsp" >生产日报</a>
						</dd>
					</dl>
				</div>
				<div class="g-right">
					<h2>
                	 <ul>
                    	<li><a class="current-color-3277de" href="#">具体参数</a></li>
                    	<div class="clear"></div>
                	 </ul>
             		 </h2>
             	 <div class="blank20"></div>
					<form name="form" action="${ctx}/jasper/goodProject.jsp"
						method="post" onsubmit="return validate_form(this)" class="report_form">
						<div class="padding-top-10"></div>
						 <label class="label-1 left">产品类型：</label> 
						 <select name="prodectType" id="prodectType"  class="input-1p Wdate left width150">
							<option value="P">成品</option>
							<option value="H">半成品</option>
						 </select>
						 <div class="blank20"></div>
						<label class="label-1 left">导出类型：</label>
						<select name="type" id="type" class="input-1p Wdate left width150">
							<option value="html">html</option>
							<option value="pdf">PDF</option>
							<option value="excel">Excel</option>

						</select>
						<div class="blank20"></div>

						<div class="a-btn-1 left margin-left82">
							<input type="submit" value="确定">
						</div>
					</form>
				</div>
				<div class="clear"></div>
			</div>

			<div class="" style="clear: both;"></div>
		</div>
	</div>
	<div class="g-footer">Copyright ©港电电器 电子产品首选 地址:廣東東莞石排鎮交警大隊對面
		联系邮箱: zhoucy@kongelectric.com</div>

</body>
</html>
