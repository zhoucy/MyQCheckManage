
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
$(document).ready(function() {
$("#form2").validate({
    rules: {
      productDate: "required",
     
     
      safeLine: {
        required: true,
        number:true
      },
      warmLine: {
        required: true,
        number:true
      },
     
    },
    messages: {
      productDate: "请输入日期",
      safeLine: {
        required: "请输入安全线",
        number: "必须是数字"
      },
      warmLine: {
        required: "请输入警戒线",
        number: "必须是数字"
      }
     
    }
	});
});

</script>

</head>
<body>
	<div class="Store-M-main">
	<div class="blank20"></div>
<form name="form" action="${ctx}/jasper/badRateSummaryRpt.jsp"
						method="post" class="report_form" target="_blank">
						 <input type="hidden" name="reportName" value="summaryByGroup"> 
						<div class="padding-top-10"></div>
						 <label class="label-1 left" style="width:80px">生产日期：</label> 
						 <input type="date" name="productDate" class="input-1p Wdate left width150">
						
						 <div class="blank20"></div>
						<label class="label-1 left" style="width:80px">导出类型：</label>
						<select name="type" id="type" class="input-1p Wdate left width150">
							<option value="html">html</option>
							<option value="pdf">PDF</option>
							<option value="excel">Excel</option>

						</select>
						<div class="blank20"></div>

						<div class="a-btn-1 left ">
							<input type="submit" value="不良率汇总(按组别)">
						</div>
					</form>
					 <div class="blank20"></div>
	<form name="form2" id="form2" action="${ctx}/jasper/badRateRpt.jsp"
						method="post" class="report_form" target="_blank">
						<div class="padding-top-10"></div>
						 <input type="hidden" name="reportName" value="summaryByType"> 
						 <label class="label-1 left" style="width:80px">生产日期：</label> 
						 <input type="date" name="productDate" class="input-1p Wdate left width150">
						 <div class="blank20"></div>
						  <label class="label-1 left" style="width:80px">安全线：</label> 
						 <input type="text" name="safeLine" class="input-1p Wdate left width150">
						 <div class="blank20"></div>
						  <label class="label-1 left" style="width:80px">警戒线：</label> 
						 <input type="text" name="warmLine" class="input-1p Wdate left width150">
						 <div class="blank20"></div>
						<label class="label-1 left" style="width:80px">导出类型：</label>
						<select name="type" id="type" class="input-1p Wdate left width150">
							<option value="html">html</option>
							<option value="pdf">PDF</option>
							<option value="excel">Excel</option>

						</select>
						<div class="blank20"></div>

						<div class="a-btn-1 left ">
							<input type="submit" value="不良率汇总（推移图）">
						</div>
					</form>
</div>
</body>

</html>
						