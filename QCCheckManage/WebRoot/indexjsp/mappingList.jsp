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

</head>

<body>
	<table class="tableList" >
	<tr>
			<th>类名</th>
			<th>方法名</th>
			<th>URL</th>
			<th>类型</th>
	<tr>
		<c:forEach items="${list}" var="mvc" varStatus="status">
		<tr id="${status.index}">
			<td>${mvc.className}</td>
			<td>${mvc.method}</td>
			<td>
				<c:choose>
				<c:when test="${!fn:contains(mvc.url,'}') and (mvc.type=='GET' or mvc.type=='')}">
					<a href="${ctx}${mvc.url}" target="_blank">${mvc.url}</a>
				</c:when>
				<c:otherwise>${mvc.url}</c:otherwise>
				</c:choose>
			</td>
			<td>${mvc.type}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>
