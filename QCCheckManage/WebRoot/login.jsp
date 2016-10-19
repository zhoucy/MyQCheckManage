<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
<title>QC检查记录</title>

<link href="${ctx}/css/login.css" rel="stylesheet" type="text/css">

<script src="${ctx}/js/jquery.js"></script> 

	</head>
	<body>
		<div class="login-bg">
			        <img src="${ctx}/img/login-bg.png" />
		        </div>
		<div class="Sign-in-table">
			<div class="Sign-in">
				<div class="Sign-in-box">
					
					<div class="center">
						<div class="Account-password">
						<form action="${ctx}/qc/login.do" method="post">
							<ul>
								<li><p>欢迎登录</p><b style="color:red">${requestScope.message}</b></li>
								<li class="login-user Record">
									<label>
									<span>用户名：</span>
									<input type="text"  name="name" >
									</label> 
								</li>
								<li class="login-password Record">
								<label>
									<span>密&nbsp码：</span>
									<input type="password" name="password" >
								</label>
								</li>
								
								<li class="login-group">								  
									<div style="clear: both;">
									<input type="checkbox" name="remeberme" checked="checked"><span>记住我</span>
									</div>
								</li>
								
								<li class="botton">
									<input type="submit" value="登录" name="submit">
								</li>
							</ul>
							</form>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		
	</body>
</html>
