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
function getQCCheckReport(){
    document.form.action="${ctx}/qc/getQCCheckReport.do?reportName=QCCheckReport";
    
    document.form.submit();
}
function getQCSummaryReport(){
    document.form.action="${ctx}/qc/getQCCheckReport.do?reportName=QCSummaryReport";
    document.form.submit();
}	
				
function validate_required(field, alerttxt) {
	with (field) {
		if (value == null || value == "") {
			alert(alerttxt);
				return false;
		} else {
					return true;
				}
			}
		}

function validate_form(thisform) {
	with (thisform) {
		if (validate_required(pono, "请输入PO.No") == false) {
			pono.focus();
			return false;
		}
	
		if (validate_required(groupid, "请输入组别") == false) {
			groupid.focus();
			return false;
		}
		if (validate_required(prodectType, "请输入产品类型") == false) {
			prodectType.focus();
			return false;
		}
		if (validate_required(QCCheckProjectID,"请输入项目编号") == false) {
			QCCheckProjectID.focus();
			return false;
		}
	}
}
</script>

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
			<div class="Store-tab-item-box">
			<ul class="nav-menu">
				<li><a href="${ctx}/index.jsp" class="Store-tab-item ">首页</a></li>
				<li><a href="${ctx}/qc/QCCheck.jsp" class="Store-tab-item ">QC检测</a></li>
				<li><a href="${ctx}/board/QCBoard.jsp" class="Store-tab-item ">看板管理</a></li>
				<li><a href="${ctx}/report/QCReport.jsp" class="Store-tab-item menu-on" >报表管理</a></li>
			</ul>
			<div class="right">用户名：${sessionScope.name}<label class="username"></label><a href="${ctx}/qc/logout.do" class="label-1">登出</a></div>
			</div>
			<div class="g-main">
				<div class="g-left">
					<dl>
						<dl>
						<dt >   <img src="../img/p-menu.png">
							报表管理
						</dt>
						<dd>
							<a href="${ctx}/report/QCReport.jsp" class="g-currentMenu">QC检查记录表</a>
						</dd>
						<dd>
							<a href="${ctx}/report/QCGoodProject.jsp" >良品条形码</a>
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
					<form name="form" 
						method="post"  class="report_form">
						<div class="padding-top-10"></div>

						<label class="label-1 left width60">PO.NO：</label> <input type="text"
							class="input-1p Wdate left width150" name="pono" id="pono">
						<label class="label-1 left width85">产品型号：</label> <input type="text"
							class="input-1p Wdate left width150" name="model" id="model">
						<div class="blank20"></div>
						<label class="label-1 left width60">组别：</label>
						<select name="groupid" id="groupid" class="input-1p Wdate left width150">
							<option value=""></option>
							<c:forEach var="dept" items="${dptList}">
							<option value="${dept.id}" >
								${dept.name}
							</option>
							</c:forEach>
						</select> <label class="label-1 left width85">产品类型：</label> <select
							name="prodectType" id="prodectType"
							class="input-1p Wdate left width150">
										
							<option value="S">直发器</option>
							<option value="C">卷发器</option>
							<option value="D">定型器</option>

						</select>
						<div class="blank20"></div>
						<label class="label-1 left width60">日期：</label>
						<input type="date" class="input-1p Wdate left width150"
							name="productDate" id="productDate"> <label class="label-1 left width85">导出类型：</label>
						<select name="type" id="type" class="input-1p Wdate left width150">
							<option value="html">html</option>
							<option value="pdf">PDF</option>
							<option value="excel">Excel</option>

						</select>
						<div class="blank20"></div>

						<div class="a-btn-1 left margin-left82">
						
							<input type="button" onclick="getQCCheckReport()" value="生成检测记录表">
							<input type="button" onclick="getQCSummaryReport()" value="生成记录总结报表">
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
