
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
var m=0;
function addAllbelong2(){
     if(m==0){
       var data=$(this).combobox('getData');
       var temp=[{'id':'','name':'生产部','selected':true}];
       $.merge(temp,data);
       m++;
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
var n=0;
function addAllgroup2(){
   if(n==0){
       var data=$(this).combobox('getData');
       var temp=[{'id':'','name':'全部','selected':true}];
       $.merge(temp,data);
       n++;
       $(this).combobox("loadData", temp);
    } 
}

function getQCDateReport(){
    document.form.action="${ctx}/qc/getQCDateReport.do?reportName=QCDateReport";
    
    document.form.submit();
}
function getQCDateSummaryReport(){
    document.form2.action="${ctx}/qc/getQCDateReport.do?reportName=QCDateSummaryReport";
    document.form2.submit();
}
function getFailDetailReport(){
    document.form2.action="${ctx}/qc/getQCDateReport.do?reportName=failDetailReport";
    document.form2.submit();
}
function getProductionHour(){
    document.form2.action="${ctx}/qc/getQCDateReport.do?reportName=productionHour";
    document.form2.submit();
}

</script>
</head>
<body>
	<div class="Store-M-main">
	<div class="blank20"></div>
<form name="form" method="post" action="${ctx}/qc/getQCDateReport.do" class="report_form" target="_blank" >
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
           data-options="valueField:'id',textField:'name',onLoadSuccess:addAllgroup">
   </select> 
			<div class="blank20"></div>
			<label class="label-1 left">产品类型：</label> 
			<select name="prodectType" id="prodectType" class="input-1p Wdate left width150">
				<option value=""></option>
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
				<input type="button"  value="生成生产日报表" onclick="getQCDateReport()">
				
			</div>
		</form>
	<div class="blank20"></div>
<form name="form2" method="post" action="${ctx}/qc/getQCDateReport.do" class="report_form" target="_blank" >
			<div class="padding-top-10"></div>

			<label class="label-1 left">&nbsp;&nbsp;PO.NO：</label> <input type="text"
				class="input-1p Wdate left width150" name="pono" id="pono">
			<label class="label-1 left">产品型号：</label> <input type="text"
				class="input-1p Wdate left width150" name="model" id="model">
			
			<label class="label-1 left">组&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
			<select id="belong2"  name="belong" class=" easyui-combobox"  style="width:150px; height: 30px"
		           data-options="valueField:'id',textField:'name',
		           url:'${ctx}/qc/getAllProductDept.do',onLoadSuccess:addAllbelong2,
		           onSelect: function(rec){    
		                var url = '${ctx}/qc/getDeptByBelong.do?belong='+rec.id;
		                n=0;  
		                $('#group2').combobox('clear');   
		                $('#group2').combobox('reload', url);    
		          }">
		         
		   </select>
		   <select id="group2" name="groupid" class="easyui-combobox" style="width:150px; height: 30px"
		           data-options="valueField:'id',textField:'name',onLoadSuccess:addAllgroup2">
		   </select> 
			<div class="blank20"></div>
			<label class="label-1 left">产品类型：</label> 
			<select name="prodectType" id="prodectType" class="input-1p Wdate left width150">
				<option value=""></option>
				<option value="S">直发器</option>
				<option value="C">卷发器</option>
				<option value="D">定型器</option>
			</select>
			<label class="label-1 left">开始日期：</label>
			<input type="date" class="input-1p Wdate left width150" name="startDate" id="startDate">
			<label class="label-1 left">结束日期：</label>
			<input type="date" class="input-1p Wdate left width150" name="productDate" id="productDate">
			<div class="blank20"></div>
			<label class="label-1 left">导出类型：</label>
			<select name="type" id="type" class="input-1p Wdate left width150">
				<option value="html">html</option>
				<option value="pdf">PDF</option>
				<option value="excel">Excel</option>

			</select>
			<div class="blank20"></div>

			<div class="a-btn-1 left margin-left82">
				
				<input type="button"  value="生成生产日报汇总表" onclick="getQCDateSummaryReport()">
				<input type="button"  value="生成失败工时汇总表" onclick="getFailDetailReport()">
				<input type="button"  value="工时汇总表" onclick="getProductionHour()">
			</div>
		</form>
</div>
</body>

</html>
						