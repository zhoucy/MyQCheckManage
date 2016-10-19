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
		getPono();//初始化所有订单号
		if (groupid != 'null') {
			$("#groupid").val(groupid);
		}
		$("#model").attr("readonly", true);
		$("#prodectType").click(function() {
			alert("根据品名产生，无需手动输入")
			return false;
		});
		$("#submitPackage").hide();

		//zhangxz 1.创建一个方法来返回表单验证的结果

		function validateForm() {
			return $("form[name='mainform']").validate({
				rules : {
					"pono" : {
						required : true
					},
					"model" : {
						required : true
					},
					"sumWorker" : {
						required : true,
						number : true
					},
					"qccheckprojectid" : {
						required : true
					},
					"targetProduct" : {
						required : true,
						number : true
					},
					"standardProduct" : {
						required : true,
						number : true
					}

				},
				messages : {
					"pono" : {
						required : "请输入pono"
					},
					"model" : {
						required : "请输入产品类型"
					},
					"qccheckprojectid" : {
						required : "请输入编码"
					},
					"sumWorker" : {
						required : "请输入投入人数",
						number : "必须输入数字"
					},
					"targetProduct" : {
						required : "请输入目标产能",
						number : "必须输入数字"
					},
					"standardProduct" : {
						required : "请输入标准产能",
						number : "必须输入数字"
					},
				},
				errorPlacement : function(error, element) {
					error.appendTo(element.next("span"));
				}

			});

		}
		//2.注册该方法
		$(validateForm());
		//3.点击button来实现你的功能
		$("#submitTest").click(function() {
			$("#tby tr").remove();
			if (validateForm().form()) {
				$.ajax({
					type : "post",
					url : "${ctx}/qc/insertQCDetailRecord1.do",
					data : $('#mainform').serialize(),
					success : function(data) {
						var message = data.message;
						var main = data.main;
						if (main != null) {
							$("#targetProduct").val(main.targetProduct);
							$("#standardProduct").val(main.standardProduct);

						}

						if (message != null && message != "") {
							alert(message);
						}
						var hiddenID = data.hiddenID;
						if (hiddenID != null) {
							$("#pono").attr("readonly", true);

							$("#groupid").click(function() {
								alert("不允许修改");
								return false;
							});
							$("#hiddenID").val(hiddenID);
							$("#progress").click(function() {
								alert("不允许修改");
								return false;
							});

						}
						var array = data.qcProjectList;
						$("#goodNum").text(data.goodNum);
						$("#badNum").text(data.badNum);

						$("#QCCheckProjectID").val("");

						var tby = $("#tby");

						if (array) {
							var tr = $("<tr></tr>");
							var td1 = $("<td>" + array.id + "</td>");
							var td2 = $("<td>" + array.name + "</td>");
							tr.append(td1).append(td2);
							tr.appendTo(tby);

						} else if ($("#model").val() === '') {
						}
						$("#QCCheckProjectID").focus();
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {

						alert(errorThrown);
					}
				});
			}
		});
		
		//3.点击button来实现你的功能
		$("#submitPackage").click(function() {
			$("#tby tr").remove();
			if (validateForm().form()) {
				$.ajax({
					type : "post",
					url : "${ctx}/qc/insertQCDetailRecord1.do",
					data : $('#mainform').serialize(),
					success : function(data) {
						var message = data.message;
						var main = data.main;
						if (main != null) {
							$("#targetProduct").val(main.targetProduct);
							$("#standardProduct").val(main.standardProduct);

						}

						if (message != null && message != "") {
							alert(message);
						}
						var hiddenID = data.hiddenID;
						if (hiddenID != null) {
							$("#pono").attr("readonly", true);

							$("#groupid").click(function() {
								alert("不允许修改");
								return false;
							});
							$("#hiddenID").val(hiddenID);
							$("#progress").click(function() {
								alert("不允许修改");
								return false;
							});

						}
						var array = data.qcProjectList;
						$("#goodNum").text(data.goodNum);
						$("#badNum").text(data.badNum);

						$("#QCCheckProjectID").val("");

						var tby = $("#tby");

						if (array) {
							var tr = $("<tr></tr>");
							var td1 = $("<td>" + array.id + "</td>");
							var td2 = $("<td>" + array.name + "</td>");
							tr.append(td1).append(td2);
							tr.appendTo(tby);

						} else if ($("#model").val() === '') {
						}
						$("#QCCheckProjectID").focus();
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {

						alert(errorThrown);
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
		/*  $( "#model" ).autocomplete({
		   source: data
		 }); */

	}

	$(function($) {
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
			;

		});

		//订单号获取对应的规格型号
		$("#pono").blur(function() {
			var pono = $("#pono").val();
			var url = "${ctx}/qc/getPlanModel.do?pono=" + pono;

			$.get(url, function(data) {
				if (data == '') {

					alert("未找到相应规格型号，请检查订单号是否输入正确");
				}
				$("#model").val(data.plan.model);
				$("#productid").val(data.plan.productId);
				$("#prodectType").val(data.productType);
			});
		});
		//工序和品名 获取
		$("#progress").change(
				function() {
					if ($("#progress").val() == 1) {
						$("#checkProjectid").hide();
						$("#submitTest").hide();
						$("#submitPackage").show();
						$("#numpage").hide();
						$("#pid").html("产品编码：");

					} else {
						$("#checkProjectid").show();
						$("#submitTest").show();
						$("#submitPackage").hide();
						$("#numpage").show();
						$("#pid").html("项目编码：");
					}

					var model = $("#model").val();
					var progress = $("#progress").val();
					var sumWorker = $("#sumWorker").val();
					var url = "${ctx}/qc/getProductNum.do?model=" + model
							+ "&&progress=" + progress + "&&sumWorker="
							+ sumWorker;
					$.get(url, function(result) {

						if (result == '') {

							$("#targetProduct").val("");
							$("#standardProduct").val("");
							alert("未找到对应工时");

						} else {
							$("#targetProduct").val(result.targetProduct);
							$("#standardProduct").val(result.standardProduct);
						}

					});
				});
		$("#sumWorker").keyup(
				function() {
					var model = $("#model").val();
					var progress = $("#progress").val();
					var sumWorker = $("#sumWorker").val();
					var url = "${ctx}/qc/getProductNum.do?model=" + model
							+ "&&progress=" + progress + "&&sumWorker="
							+ sumWorker;
					$.get(url, function(result) {

						if (result == '') {
							return;
						} else {
							$("#targetProduct").val(result.targetProduct);
							$("#standardProduct").val(result.standardProduct);
						}

					});
				});
		//enter键触发 提交事件		
		$("#mainform").keydown(function(e) {
			var e = e || event, keycode = e.which || e.keyCode;
			if (keycode == 13) {
				$("#submitTest").trigger("click");
				return false;
			}

		});

	});
</script>

</head>

<body>

	<div class="g-header">
		<div class="g-logo">
			<img src="${ctx}/img/logo2.jpg">
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
					<li><a href="${ctx}/report/QCReport.jsp"
						class="Store-tab-item">报表管理</a>
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
							<img src="../img/p-menu.png"> QC记录管理
						</dt>
						<dd>
							<a href="${ctx}/qc/QCCheck.jsp" class="g-currentMenu">QC检验记录</a>
						</dd>


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
							<input type="hidden" class="input-1p Wdate left width150"
								name="hiddenID" id="hiddenID"> <input type="hidden"
								class="input-1p Wdate left width150" name="productid"
								id="productid"> <label class="label-1 left">生产订单：</label>
							<input type="text" class="input-1p Wdate left width150"
								name="pono" id="pono"><span class="left "></span> <label
								class="label-1 left">产品型号：</label> <input type="text"
								class="input-1p Wdate left width150" name="model" id="model"
								readonly="readonly"><span class=" left "></span> <label
								class="label-1 left">产品类型：</label> <select name="prodectType"
								id="prodectType" class="input-1p Wdate left width150">
								<c:forEach var="productType" items="${productTypes}">
									<option value="${productType.index}">
										${productType.name}</option>
								</c:forEach>
							</select> <span></span>

							<div class="blank20"></div>
							<label class="label-1 left">投入人数：</label> <input type="text"
								class="input-1p Wdate left width150" name="sumWorker"
								id="sumWorker"><span class=" left "></span> <label
								class="label-1 left">组&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
							<select name="groupid" id="groupid"
								class="input-1p Wdate left width150">
								<c:forEach var="dept" items="${dptList}">
									<option value="${dept.id}">${dept.name}</option>
								</c:forEach>
							</select> <span></span> <label class="label-1 left">生产工序：</label> <select
								name="progress" id="progress"
								class="input-1p Wdate left width150">
								<option value=""></option>
								<option value="4">组装+包装</option>
								<option value="1">包装</option>
								<option value="2">组装</option>
								<option value="5">大小卷筒加工</option>
								<option value="6">底座加工+包装</option>
								<option value="7">卷发头加工</option>
								<option value="8">直发头加工</option>
								<option value="9">手柄加工</option>

							</select> <span></span>

							<div class="blank20"></div>
							<label class="label-1 left">目标产能：</label> <input type="text"
								class="input-1p Wdate left width150" name="targetProduct"
								id="targetProduct"><span class="  left "></span> <label
								class="label-1 left">标准产能：</label> <input type="text"
								class="input-1p Wdate left width150" name="standardProduct"
								id="standardProduct"><span class=" left "></span> <label
								id="pid" class="label-1 left">项目编码：</label> <input type="text"
								class="input-1p Wdate left width150" name="qccheckprojectid"
								id="QCCheckProjectID"><span class="left "></span>
							<div class="blank20"></div>
							<div class="a-btn-1 left">
								<input type="button" id="submitTest" value="确定"> <input
									type="button" id="submitPackage" value="确定">
							</div>
							<div class="a-btn-1 left">
								<input type="button" id="changeNo" value="换单">

							</div>
						</form>
					</div>

					<div class="blank20"></div>
					<div class="list-main">
						<table class="gridtable" id="checkProjectid">
							<thead>
								<tr height="40px">
									<th width="8%">项目编码</th>
									<th width="8%">项目名称</th>
								</tr>
							</thead>
							<tbody id="tby">

							</tbody>
						</table>
						<div class="blank20"></div>
						<div class="customer-management-bottom">
							<div class="g-pageBar">
								<div class="g-pages" id=numpage>
									<div>
										<label>良品合计:<lable id="goodNum" class="countRecord">${goodNum}</lable>
										</label>
									</div>
									<div>
										<label>不良品合计 :<lable id="badNum" class="countRecord">${badNum}</lable>
										</label>
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