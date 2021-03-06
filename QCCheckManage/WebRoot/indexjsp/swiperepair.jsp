<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<jsp:include page="../inc.jsp"></jsp:include>
<meta charset="utf-8">
    <style type="text/css">
		#fm{
			margin:0;
			padding:10px 30px;
		}
		.ftitle{
			font-size:14px;
			font-weight:bold;
			padding:5px 0;
			margin-bottom:10px;
			border-bottom:1px solid #ccc;
		}
		.fitem{
			margin-bottom:5px;
		}
		.fitem label{
			display:inline-block;
			width:80px;
		}
		.fitem input{
			width:160px;
		}
        .panel-body {
            border:0;
        }
	</style>
</head>
<body>
      <table id="dg" title="" class="easyui-datagrid" style="width:auto;height:auto"
			toolbar="#searchtool" showFooter="true" 
			toolbar="#toolbar"    fit="true" striped="true"
			rownumbers="true" fitColumns="true" singleSelect="true"
			data-options="onDblClickRow:showRepairRecordBySerialnum">			
		<thead>
			<tr>
				<th field="serialnum" width="50">产品序列号</th>
				<th field="badcode" width="50">坏项编码</th>
				<th field="badname" width="50">坏项名称 </th>
				<th field="dbtime" width="50" formatter="formatTime">qc检测时间</th>
				<th field="groupname" width="50">生产组别</th>
				<th field="pono" width="50">订单号</th>
				<th field="model" width="50">model</th>
				<th field="product_type" width="50">产品类型</th>
				
			</tr>
		</thead>
	    </table>
	 <div id="searchtool"  style="padding:5px;">  
	    <table >	         
	         <tr>
	              <td>产品序列号:</td><td><input type="text" id="serialnum" class="easyui-textbox" style="width:200px"/></td>
                  <td><a href="javascript:searchFailure()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
	              <td><a href="javascript:clearFailure()" class="easyui-linkbutton" data-options="iconCls:'icon-myclear'">清空</a></td>
	         </tr>	        
	    </table>         
    <div> 
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-myrepair" plain="true" onclick="repairFailure();">维修</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-myrepair" plain="true" onclick="repairRecord();">维修记录</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-myrepair" plain="true" onclick="repairCount();">维修数量</a>
	</div>
	<div id="dlg" class="easyui-dialog" style="width:400px;height:320px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">详细信息</div>
		<form id="fm" method="post" novalidate>
			<div class="fitem">
				<label>产品序列号:</label>
				<input name="serialnum" class="easyui-textbox" readonly="readonly">
			</div>
			<div class="fitem">
				<label>坏项:</label>
				<input name="badcode" class="easyui-textbox" readonly="readonly" >
			</div>
			<div class="fitem">
				<label>维修结果:</label>
				<input id="result" name="result" class="easyui-combobox" data-options="
		               valueField: 'label',
		               textField: 'value',
		               panelHeight:'auto',
		               data: [{label: 'OK',value: 'OK'
		                    },{label: '待测试',value: '待测试',selected:'true'
		                    },{label: '报废',value: '报废'
		               }]" />
			</div>
			<div class="fitem">
				<label>维修过程:</label>
				<input id="description" name="description" class="easyui-textbox" data-options="multiline:true" style="width:160px;height:50px">
			</div>
			<div class="fitem">
				<label>维修人:</label>
				<input name="repairman" class="easyui-textbox" readonly="readonly" value="${sessionScope.name}">
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveRepair()" style="width:90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
	</div>
	<div id="dlg2" class="easyui-dialog" style="left:0px;top:130px;width:1000px;height:400px;"closed="true" 
                   collapsible="true" resizable="true" maximizable="true">
    <table id="dg2"></table></div> 
<script type="text/javascript">
var url;
function repairFailure(){
   var row = $('#dg').datagrid('getSelected');
   if(row){
      $('#dlg').dialog('open').dialog('setTitle','维修');
      $('#fm').form('load',row);
      url='${ctx}/qc/addRepairRecord.do';
   }else{
      $.messager.show({title: '错误信息',msg: '请选择一条信息'});
   }
}
function saveRepair(){
	$('#fm').form('submit', {
			url : url,
			onSubmit : function() {
				return $(this).form('validate');
			},
			success : function(result) {
				$('#dlg').dialog('close');
				$('#dg').datagrid('reload');
				if (result == 'true') {
					$.messager.show({title : '成功信息',msg : '操作成功'});
				} else {
					$.messager.show({title : '错误信息',msg : '操作时发生错误'});
				}
			}
		});
}
function searchFailure(){
   var serialnum=$("#serialnum").val();
   if(serialnum){
      $('#dg').datagrid({
         url:'${ctx}/qc/getFailureBySerialnum.do',
         queryParams: {serialnum:serialnum}        
      });
   }else{
      $.messager.alert('提示消息','请输入序列号','warning');
   }  
}
function clearFailure(){
   $("#serialnum").textbox('clear');
}
function formatTime(value, row, index) {
  if (value != undefined) {
    value = parseInt(value);
	var time = new Date(value);
	var y = time.getFullYear();
	var m = time.getMonth() < 9 ? "0" + (time.getMonth()+1) : (time.getMonth()+1);
	var d = time.getDate() < 10 ? "0" + time.getDate() : time.getDate();
	var h = time.getHours() < 10 ? "0" + time.getHours() : time.getHours();
	var mm = time.getMinutes() < 10 ? "0" + time.getMinutes() : time.getMinutes();
	var ss = time.getSeconds() < 10 ? "0" + time.getSeconds() : time.getSeconds();
	var t = y + "-" + m + "-" + d + " " + h + ":" + mm + ":" + ss;
	return t;
  }
}
function repairRecord(){  
   $('#dg2').datagrid({  
                 fit:true, 
                 rownumbers:true,
                 url:'${ctx}/qc/getRepairRecordByManAndDate.do',
                 queryParams: {
		                       repairman:"${sessionScope.name}",
		                       repairdate:getToday(),
	             },                      
                 columns:[[    
                 {field:'serialnum',title:'序列号',width:150,align:'center'},    
                 {field:'badcode',title:'坏项编码',width:60,align:'center'},  
                 {field:'badname',title:'坏项名称',width:150,align:'center'},  
                 {field:'repairtime',title:'维修时间',width:150,align:'center',formatter:formatTime},
                 {field:'result',title:'维修结果',width:80,align:'center'}, 
                 {field:'description',title:'过程描述',width:80,align:'center'},
                 {field:'repairman',title:'维修者',width:80,align:'center'},    
    ]]});
    $('#dlg2').dialog('open').dialog('setTitle','${sessionScope.name}的维修记录');
}
function repairCount(){
   $.ajax({
      type:'post',
      url:'${ctx}/qc/getRepairRecordNum.do',
      data:{repairman:"${sessionScope.name}",repairdate:getToday()},
      dataType:'json',
      success:function(data){
         $.messager.show({title : '维修消息',msg : '您今天一共维修了'+data+'个产品'});
      }
   });  
}
function getToday(){
   var time=new Date();
   var y = time.getFullYear();
   var m = time.getMonth() < 9 ? "0" + (time.getMonth()+1) : (time.getMonth()+1);
   var d = time.getDate() < 10 ? "0" + time.getDate() : time.getDate();
   var day=y + "-" + m + "-" + d;
   return day;
}
function showRepairRecordBySerialnum(rowIndex, rowData){
   var serialnum=rowData.serialnum;
   $('#dg2').datagrid({  
                 fit:true, 
                 rownumbers:true,
                 url:'${ctx}/qc/getRepairRecordByManAndDate.do',
                 queryParams: {
		                       serialnum:serialnum,
	             },                      
                 columns:[[    
                 {field:'serialnum',title:'序列号',width:150,align:'center'},    
                 {field:'badcode',title:'坏项编码',width:60,align:'center'},  
                 {field:'badname',title:'坏项名称',width:150,align:'center'},  
                 {field:'repairtime',title:'维修时间',width:150,align:'center',formatter:formatTime},
                 {field:'result',title:'维修结果',width:80,align:'center'}, 
                 {field:'description',title:'过程描述',width:80,align:'center'},
                 {field:'repairman',title:'维修者',width:80,align:'center'},    
    ]]});
    $('#dlg2').dialog('open').dialog('setTitle',serialnum+'的维修记录');
}
</script>
</body>
</html>
