
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
$("#form").validate({
    rules: {
      productDate: "required",
      groupid: "required",
     
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
      groupid: "请输入组别",
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
var j=0;
function addAllbelong(){
     if(j==0){
       var data=$(this).combobox('getData');
       var temp=[{'id':'','name':'生产部','selected':true}];
       $.merge(temp,data);
       j++;
       $(this).combobox("loadData", temp);
    } 
}
var k=0;
function addAllgroup(){
   if(k==0){
       var data=$(this).combobox('getData');
       
    } 
}
</script>

</head>
<body>
	<div class="Store-M-main">
	<div class="blank20"></div>
<form name="form"  id=form action="${ctx}/jasper/badRateRpt.jsp"
			method="post" class="report_form" target="_blank">
		<div class="padding-top-10"></div>
		 <label class="label-1 left" style="width:80px">生产日期：</label> 
		 <input type="date" name="productDate" class="input-1p Wdate left width150">
		 <div class="blank20"></div>
		 <label class="label-1 left" style="width:80px">生产组别：</label>
	
		<select id="belong" name="belong" class=" easyui-combobox"  style="width:150px; height: 30px"
	          data-options="valueField:'id',textField:'name',
	          url:'${ctx}/qc/getAllProductDept.do',onLoadSuccess:addAllbelong,
	          onSelect: function(rec){    
	               var url = '${ctx}/qc/getDeptByBelong.do?belong='+rec.id;
	               k=0;  
	               $('#group').combobox('clear');   
	               $('#group').combobox('reload', url);    
	         }">
	   </select>
	   <select id="group" name="groupid" class="easyui-combobox" style="width:150px; height: 30px"
	           data-options="valueField:'name',textField:'name',onLoadSuccess:addAllgroup" required="true">
	   </select>  
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

		<div class="a-btn-1 left margin-left82">
			<input type="submit" value="确定">
		</div>
	</form>
</div>
</body>

</html>
						