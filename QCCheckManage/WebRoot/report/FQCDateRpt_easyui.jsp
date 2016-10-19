
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<jsp:include page="../inc.jsp"></jsp:include>
<meta charset="utf-8">
<script type="text/javascript">
function getFQCDateRpt(){
    document.form.action="${ctx}/jasper/FQCDateRpt.jsp?reportName=FQCDateRpt";
    
    document.form.submit();
}
function getFQCMonthRpt(){
    document.form.action="${ctx}/jasper/FQCDateRpt.jsp?reportName=FQCMonthRpt";
    document.form.submit();
}

</script>


</head>
<body>
	<div class="Store-M-main">
	<div class="blank20"></div>
<form name="form" action="${ctx}/jasper/FQCDateRpt.jsp"
						method="post" class="report_form" target="_blank">
						<div class="padding-top-10"></div>
						 <label class="label-1 left">生产日期：</label> 
						 <input type="date" name="productDate" class="input-1p Wdate left width150">
						 <div class="blank20"></div>
						<label class="label-1 left">导出类型：</label>
						<select name="type" id="type" class="input-1p Wdate left width150">
							<option value="html">html</option>
							<option value="pdf">PDF</option>
							<option value="excel">Excel</option>

						</select>
						<div class="blank20"></div>

						<div class="a-btn-1 left ">
							<input type="button" onclick="getFQCDateRpt()" value="生产FQC日报表">
							<input type="button"  onclick="getFQCMonthRpt()"  value="生成FQC月报表">
						</div>
					</form>
</div>
</body>

</html>
						