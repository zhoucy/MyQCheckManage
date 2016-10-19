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
<script type="text/javascript">
  var groupid='<%=session.getAttribute("groupid")%>';
  $(document).ready(function() { 
   		if(groupid!='null'){
   			$("#groupid").val(groupid);
   		}
   		});
</script>

</head>

<body>

	<div class="g-header">
		<div class="g-logo">
			<img src="${ctx}/img/logo2.png"  height="50" width="60" >
		</div>
		<div class="g-top-title">东莞港电电器制品有限公司</div>

	</div>
	<!--主体部分-->
	<div class="g-main-body">

		<div class="Store-M-main">
			<p>&nbsp;</p>
			<div class="Store-tab-item-box">
			<ul class="nav-menu">
				<li><a href="${ctx}/index.jsp" class="Store-tab-item ">首页</a></li>
				<li><a href="${ctx}/qc/QCCheck.jsp" class="Store-tab-item ">QC检测</a></li>
				<li><a href="${ctx}/board/QCBoard.jsp" class="Store-tab-item menu-on">看板管理</a></li>
			</ul>
			<div class="right">用户名：${sessionScope.name}<label class="username"></label><a href="${ctx}/qc/logout.do" class="label-1">登出</a></div>
			</div>
			<div class="g-main">
				<div class="g-left">
					<dl>
						<dt >   <img src="../img/p-menu.png">
							报表管理
						</dt>
						<dd>
							<a href="${ctx}/board/QCBoard.jsp" class="g-currentMenu">生产日报看板</a>
						</dd>
						<dd>
							<a href="${ctx}/board/QCProductionBoard.jsp" >产能看板</a>
						</dd>
						<dd>
							<a href="#" >其他看板</a>
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
					<form name="form"  action="${ctx}/qc/toReportBoard.do"
						method="post"  class="report_form">
						<div class="padding-top-10"></div>

						
						<label class="label-1 left width60">组别：</label>
						<select name="groupid" id="groupid" class="input-1p Wdate left width150">
							<option value=""></option>
							<c:forEach var="dept" items="${dptList}">
							<option value="${dept.id}" >
								${dept.name}
							</option>
							</c:forEach>
						</select>
						 <div class="blank20"></div>
						<div class="a-btn-1 left margin-left82">
							<input type="submit"  value="查看看板">
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
