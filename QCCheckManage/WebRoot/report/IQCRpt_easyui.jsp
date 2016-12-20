
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

</script>


</head>
<body>
	<div class="Store-M-main">
	<div class="blank20"></div>
<form name="form" action="${ctx}/jasper/iqcMatarilRpt.jsp"
						method="post" class="report_form" target="_blank">
						<div class="padding-top-10"></div>
						 <label class="label-1 left">检验日期：</label> 
						 <input type="date" name="nowDate" class="input-1p Wdate left width150">
						 <div class="blank20"></div>
						 <label class="label-1 left">物料编码：</label> 
						 <input type="text" name="FNumber" class="input-1p Wdate left width150">
						 <div class="blank20"></div>
						 <label class="label-1 left">采购订单：</label> 
						 <input type="text" name="FSourceBillNo" class="input-1p Wdate left width150">
						 <div class="blank20"></div>
						<label class="label-1 left">导出类型：</label>
						<select name="type" id="type" class="input-1p Wdate left width150">
							<option value="html">html</option>
							<option value="pdf">PDF</option>
							<option value="excel">Excel</option>

						</select>
						<div class="blank20"></div>

						<div class="a-btn-1 left ">
							<input type="submit"  value="生成IQC物料检测表">
						</div>
					</form>
</div>
</body>

</html>
						