
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
	<form name="form"  action="${ctx}/qc/toReportBoard2.do"
						method="post"  class="report_form" target="_blank">
						<div class="padding-top-10"></div>

						
						<label class="label-1 left width60">组别：</label>
						<select name="groupid" id="groupid"
							class="input-1p Wdate left width150">
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
</body>

</html>
						