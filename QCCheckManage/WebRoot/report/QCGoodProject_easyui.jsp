
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<jsp:include page="../inc.jsp"></jsp:include>
<meta charset="utf-8">
</head>
<body>
	<div class="Store-M-main">
	<div class="blank20"></div>
<form name="form" action="${ctx}/jasper/goodProject.jsp"
						method="post" target="_blank" class="report_form">
						<div class="padding-top-10"></div>
						 <label class="label-1 left">产品类型：</label> 
						 <select name="prodectType" id="prodectType"  class="input-1p Wdate left width150">
							<option value="S">直发器</option>
							<option value="C">卷发器</option>
							<option value="D">定型器</option>
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
</body>

</html>
						