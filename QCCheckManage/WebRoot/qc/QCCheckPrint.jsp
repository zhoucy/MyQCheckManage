<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<title>QC检查记录</title>
<link href="${ctx}/css/main.css" rel="stylesheet" type="text/css">
<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css">
<link href="${ctx}/css/qccheck.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${ctx}/css/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/css/Third-party-configuration.css" />
<link rel="stylesheet" href="${ctx}/css/jquery-ui.css">

<script src="${ctx}/js/jquery.js"></script>
<script src="${ctx}/js/jquery-ui.js"></script>
<script src="${ctx}/js/jquery.validate.min.js"></script>
<script type="text/javascript">
  var groupid='<%=session.getAttribute("groupid")%>';
	$(document).ready(function() {
		if (groupid != 'null') {
			$("#groupid").val(groupid);
		}
		
		
    
	/* 	//enter键触发 提交事件		
		$("#mainform").keydown(function(e) {
			var e = e || event, keycode = e.which || e.keyCode;
			if (keycode == 13) {
				
				return false;
			}
			

		}); */

	});
	
	 $(function () {
   //验证失败工时表单并提交
        $("#mainform").validate({
            rules: {
                cardid:"required",
            },
            messages: {
                cardid: {
                    required: "请刷卡！"
                },
               
            },
            onfocus: true,
            onkeyup: false,//这个地方要注意，修改去控制器验证的事件。
            submitHandler : function(){
            alert(123);
              $.ajax({
                            type: "POST",
                            url: "hahahha",
                            dataType:"json",
                            data:$('#mainform').serialize(),
                            success: function(data){
                            
                                if(data!="" && data.message=="success"){
                                 alert("成功添加");
                                 $("#failHourForm").fadeOut("fast");
                                  location.reload();
                                }else{
                                alert(data.message);
                                }
                                
                            },
                           error:function(){
                                  alert("添加失败");
                                 
                            },
                                
               } );   //confirm
        }
    });
});
	
</script>

</head>

<body>

<div class="g-header">
	<div class="g-logo">
		<img  height="50" width="60"  src="${ctx}/img/logo2.png">
	</div>
	<div class="g-top-title">东莞港电电器制品有限公司</div>
</div>
<div class="g-main-body">
	<div class="Store-M-main">
		<p>&nbsp;</p>
		<div class="Store-tab-item-box">
			<ul class="nav-menu">
				<li><a href="${ctx}/index.jsp" class="Store-tab-item ">首页</a>
				</li>
				<li><a href="${ctx}/qc/QCCheck.jsp"
					class="Store-tab-item menu-on">QC检测</a>
				</li>
				<li><a href="${ctx}/board/QCBoard.jsp" class="Store-tab-item ">看板管理</a>
				</li>
				
			</ul>
			<div class="right">
				用户名：${sessionScope.name}<label class="username"></label><a
					href="${ctx}/qc/logout.do" class="label-1">登出</a>
			</div>
		</div>
		<div class="g-main">
			<div class="g-left">
				<dl>
					<dt>
						<img src="../img/p-menu.png"> QC管理
					</dt>
					<dd>
						<a href="${ctx}/qc/QCCheck.jsp" class="g-currentMenu" >QC检验记录</a>
						
					</dd>
					<dd>	<a href="${ctx}/qc/QCCheckTest.jsp"  >打印标签</a></dd>
				</dl>
			</div>
			<div class="g-right margin-left30">
				<h2>
					<ul>
						<li><a class="current-color-3277de" href="#">具体参数</a>
						</li>
						<div class="clear"></div>
					</ul>
				</h2>
				<div class="blank20"></div>
				<div class="configureBox">
					<form id="mainform" name="mainform" method="post">
						<div class="padding-top-10"></div>
						<label class="label-1 left">生产订单：</label>
						<input type="text" class="input-1p Wdate left width150" name="pono" id="pono"/>
						<label class="label-1 left">生产卡号：</label>
						<input type="text" class="input-1p Wdate left width150" name="cardid" id="cardid"/>
						<span class="left "></span>
						<label class="label-1 left">打印偏移：</label>
						<input type="text" class="input-1p Wdate left width150" name="printOffset" id="printOffset"/>
						<span class="left "></span>
						
						<div class="blank20"></div>
						<div class="a-btn-1 left">
						  <input type="submit" id="submitTest" value="确定">
						</div>
					</form>
				</div>
        </div>
	</div>		
</div>
<div class="g-footer">Copyright ©港电电器 电子产品首选 地址:廣東東莞石排鎮交警大隊對面
	联系邮箱: zhoucy@kongelectric.com</div>


</body>
</html>