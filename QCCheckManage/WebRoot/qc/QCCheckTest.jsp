w<%@ page language="java" contentType="text/html; charset=utf-8"
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
<link rel="stylesheet" type="text/css"href="${ctx}/css/Third-party-configuration.css" />
<link rel="stylesheet" href="${ctx}/css/jquery-ui.css">
<script src="${ctx}/js/jquery.js"></script>
<script src="${ctx}/js/jquery-ui.js"></script>
<script src="${ctx}/js/jquery.validate.min.js"></script>
<script type="text/javascript">



   

$(document).ready(function() {
	getPono();//初始化所有订单号
		
	function validateForm() {
			return $("form[name='mainform']").validate({
				rules : {
					"pono" : {
						required : true
					},
					
					"packbarcode" : {
						required : true
					},
					packbarcodeConfirm: {
				        required: true,
				         equalTo: "#packbarcode"
				      },
				  "boxbarcode" : {
						required : true
					},
					boxbarcodeConfirm: {
				        required: true,
				         equalTo: "#boxbarcode"
				      }

				},
				messages : {
					"pono" : {
						required : "请输入pono"
					},
					
					"packbarcode" : {
						required : "请输入彩盒条形码"
					},
					"packbarcodeConfirm" : {
						required : "请输入彩盒条形码",
						equalTo : "与对应条形码不一致 请检查"
					},
					"boxbarcode" : {
						required : "请输入装箱条形码",
						
					},
					"boxbarcodeConfirm" : {
						required : "请输入装箱条形码",
						equalTo : "与对应条形码不一致 请检查"
					},
				},
				errorPlacement : function(error, element) {
					error.appendTo(element.next("span"));
				}

			});

		}
				
			$(validateForm());		
			
	$("#submitTest").click(function() {
		if (validateForm().form()) {
			$.ajax({
					type : "post",
					url : "${ctx}/qc/checkBox.do",
					data : $('#mainform').serialize(),
					success : function(data) {
						if(data!=""&&data.message==""){
							$("#boxNum").html(data.boxNum);
							var boxs=$("#boxs").val();
							$("#boxsNum").html((data.boxNum/boxs).toFixed(2));
						}else{
							alert(data.message);
						}
						$("#boxbarcodeConfirm").val("");
						$("#packbarcodeConfirm").val("");
						$("#packbarcodeConfirm").focus();
					}
				});	
			}
	});
				
});

//获取订单号
function getPono() {
	$.ajax({
		type : "POST",
		url : "getPlanPonos.do",
		dataType : "json",
		success : function(data) {
			$("#pono").autocomplete({
				source : data
			});

		}
	});
}

$(function ($) {


	$("#changeNo").on('click', function() {
			if (confirm("是否换单")) {
				if ($("#hiddenID").val() != null) {
					var hiddenID = $("#hiddenID").val();
					var url = "${ctx}/qc/changePono.do?hiddenID=" + hiddenID;

					$.get(url, function(data) {
						window.location.reload();
					});

				}
			}
	});

		//订单号获取对应的规格型号
		$("#pono").blur(function() {
			var pono = $("#pono").val();
			var url = "${ctx}/qc/getPlanModel.do?pono=" + pono;

			$.get(url, function(data) {
				if (data == '') {
					alert("请检查订单号是否输入正确");
				}
				$("#packbarcode").val(data.plan.packbarcode);
				$("#boxbarcode").val(data.plan.boxbarcode);
			});
		});
		//enter键触发 提交事件		
		$("#mainform").keydown(function(e){
			 var e = e || event,
			 keycode = e.which || e.keyCode;
			 if (keycode==13&&$("#boxbarcodeConfirm").val()!="") {
			  $("#submitTest").trigger("click");
			 }
			 if (keycode==13&&$("#boxbarcodeConfirm").val()==""&&$("#packbarcodeConfirm").val()!="") {
			 
			  $("#boxbarcodeConfirm").focus();
			 }
			});
					 
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
	<div class="g-main-body">
		<div class="Store-M-main">
			<p>&nbsp;</p>
			<div class="Store-tab-item-box">
			<ul class="nav-menu">
				<ul class="nav-menu">
				<li><a href="${ctx}/index.jsp" class="Store-tab-item ">首页</a>
				</li>
				<li><a href="${ctx}/qc/QCCheck.jsp"
					class="Store-tab-item menu-on">QC检测</a>
				</li>
				<li><a href="${ctx}/board/QCBoard.jsp" class="Store-tab-item ">看板管理</a>
				</li>
				</ul>
			<div class="right">用户名：${sessionScope.name}<label class="username"></label><a href="${ctx}/qc/logout.do" class="label-1">登出</a></div>
			</div>
			<div class="g-main">
				<div class="g-left">
					<dl>
						<dt >   <img src="../img/p-menu.png">
							QC管理
						</dt>
						<dd>
							<a href="${ctx}/qc/QCCheck.jsp" >QC检验记录</a>
						</dd>
						<dd><a href="${ctx}/qc/QCCheckTest.jsp" class="g-currentMenu" >装箱检测</a></dd>
						
					</dl>
				</div>
				<div class="g-right margin-left30">
				<h2>
                	 <ul>
                    	<li><a class="current-color-3277de" href="#">具体参数</a></li>
                    	<div class="clear"></div>
                	 </ul>
             		 </h2>
			<div class="blank20"></div>
			<div class="configureBox">
				<form id="mainform"  name="mainform" method="post" onsubmit="return validate_form(this)">
					<div class="padding-top-10"></div>
						<input type="hidden" class="input-1p Wdate left width150" name="hiddenID" id="hiddenID" >
						<label class="label-1 left">生产订单：</label>
						<input type="text" class="input-1p Wdate left width150" name="pono" id="pono" ><span  class="left "></span>
					
						<label class="label-1 left">组&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
						<select name="groupid" id="groupid" class="input-1p Wdate left width150">
							<c:forEach var="dept" items="${dptList}">
								<option value="${dept.id}">${dept.name}</option>
							</c:forEach>
						</select>  <span></span>
						
						<label class="label-1 left">装箱个数：</label> 
						<input type="text" class="input-1p Wdate left width150" name="boxs" id="boxs"><span class="  left "></span>
					
						<div class="blank20"></div>
						<label class="label-1 left">彩盒编码：</label> 
						<input type="text" class="input-1p Wdate left width150" name="packbarcode" id="packbarcode"><span class=" left "></span>
						
						                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
						<label class="label-1 left">装箱编码：</label> 
						<input type="text" class="input-1p Wdate left width150" name="boxbarcode" id="boxbarcode"><span class="  left "></span>
						<div class="blank20"></div>
						<label class="label-1 left">彩盒编码：</label> 
						<input type="text" class="input-1p Wdate left width150" name="packbarcodeConfirm" id="packbarcodeConfirm"><span class=" left "></span>
						
						
						<label class="label-1 left">装箱编码：</label> 
						<input type="text" class="input-1p Wdate left width150" name="boxbarcodeConfirm" id="boxbarcodeConfirm"><span class="  left "></span>
						
						
						<div class="a-btn-1 left">
							<input type="button" id="submitTest" class="submit" value="确定">
						
					</div>
						<div class="a-btn-1 left">
							<input type="button" class="submit"  id="changeNo" value="换单">
						
					</div>
				</form>
			</div>

			<div class="blank20"></div>
			<div class="list-main">
				<div class="customer-management-bottom">
					<div class="g-pageBar">
						<div class="g-pages">
							<div>
								<label>合计装箱数:<lable id="boxNum" class="countRecord"></lable>
								<label>合计箱数:<lable id="boxsNum" class="countRecord"></label>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
			</div>
		</div>
	</div>
	<div class="g-footer">Copyright ©港电电器 电子产品首选 地址:廣東東莞石排鎮交警大隊對面
		联系邮箱: zhoucy@kongelectric.com</div>


</body>
</html>