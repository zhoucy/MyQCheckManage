
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
  var groupid='<%=session.getAttribute("groupid")%>';
  $(document).ready(function() { 
   		if(groupid!='null'){
   			$("#groupid").val(groupid);
   		}
   		});
function getQCCheckReport(){
    document.form.action="${ctx}/qc/getQCCheckReport.do?reportName=QCCheckReport";
    
    document.form.submit();
}
function getQCSummaryReport(){
    document.form.action="${ctx}/qc/getQCCheckReport.do?reportName=QCSummaryReport";
    document.form.submit();
}
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
       var temp=[{'id':'','name':'全部','selected':true}];
       $.merge(temp,data);
       k++;
       $(this).combobox("loadData", temp);
       
    } 
}
</script>
</head>
<body>
	<div class="Store-M-main">
	<div class="blank20"></div>
<form name="form" method="post"  class="report_form" target="_blank" >
		<div class="padding-top-10"></div>

		<label class="label-1 left">&nbsp;&nbsp;PO.NO：</label> <input type="text"
			class="input-1p Wdate left width150" name="pono" id="pono">
		<label class="label-1 left">产品型号：</label> <input type="text"
			class="input-1p Wdate left width150" name="model" id="model">
		
		<label class="label-1 left">组&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
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
	           data-options="valueField:'id',textField:'name',onLoadSuccess:addAllgroup" >
	   </select> 
		<div class="blank20"></div>
		<label class="label-1 left">产品类型：</label> 
		<select name="prodectType" id="prodectType" class="input-1p Wdate left width150">
			
			<option value="S">直发器</option>
			<option value="C">卷发器</option>
			<option value="D">定型器</option>
		</select>
		<label class="label-1 left">日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期：</label>
		<input type="date" class="input-1p Wdate left width150"
			name="productDate" id="productDate"> <label class="label-1 left">导出类型：</label>
		<select name="type" id="type" class="input-1p Wdate left width150">
			<option value="html">html</option>
			<option value="pdf">PDF</option>
			<option value="excel">Excel</option>

		</select>
		<div class="blank20"></div>
		<div class="a-btn-1 left margin-left82">
			<input type="button" onclick="getQCCheckReport()" value="生成检测记录表">
			<input type="button" onclick="getQCSummaryReport()" value="生成记录总结报表">
		</div>
	</form>
</div>
</body>

</html>
						