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
function getQCDateReport(){
    document.form.action="${ctx}/qc/getQCDateReport.do";
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
	
		if (validate_required(prodectType, "请输入产品类型") == false) {
			prodectType.focus();
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
							<a href="${ctx}/report/QCGoodProject.jsp" >良品条形码</a>
						</dd>
						<dd>
							<a href="${ctx}/report/QCBadProject.jsp" >不良品条形码</a>
						</dd>
						<dd>
							<a href="${ctx}/report/QCDateReport.jsp" class="g-currentMenu" >生产日报</a>
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
					<form name="form" method="post" action="${ctx}/qc/getQCDateReport.do" class="report_form" onsubmit="return validate_form(this)">
						<div class="padding-top-10"></div>

						<label class="label-1 left">&nbsp;&nbsp;PO.NO：</label> <input type="text"
							class="input-1p Wdate left width150" name="pono" id="pono">
						<label class="label-1 left">产品型号：</label> <input type="text"
							class="input-1p Wdate left width150" name="model" id="model">
						
						<label class="label-1 left">组&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
						<select name="groupid" id="groupid" class="input-1p Wdate left width150">
							<option value=""></option>
							<c:forEach var="dept" items="${dptList}">
							<option value="${dept.id}" >
								${dept.name}
							</option>
							</c:forEach>
						</select> 
						<div class="blank20"></div>
						<label class="label-1 left">产品类型：</label> 
						<select name="prodectType" id="prodectType" class="input-1p Wdate left width150">
							
							<option value="S">直发器</option>
							<option value="C">卷发器</option>
							<option value="D">定型器</option>
						</select>
						<label class="label-1 left">日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期：</label>
						<input type="date" class="input-1p Wdate left width150"
							name="productDate" id="productDate"> <label class="label-1 left">导出类型：</label>
						<select name="type" id="type" class="input-1p Wdate left width150">
							<option value="html">html</option>
							<option value="pdf">PDF</option>
							<option value="excel">Excel</option>

						</select>
						<div class="blank20"></div>

						<div class="a-btn-1 left margin-left82">
							<input type="button" onclick="getQCDateReport()" value="生成生产日报表">
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
