<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<jsp:include page="../inc.jsp"></jsp:include>
<meta charset="utf-8">
</head>
<body>
		<table id="dg" title="" class="easyui-datagrid" style="width:auto;height:auto"
			url="${ctx }/product/searchProHour.do" toolbar="#searchtool" pageSize="20"
			toolbar="#toolbar"  pagination="true" fit="true"  striped="true"
			rownumbers="true" fitColumns="true" singleSelect="true">			
		<thead>
			<tr>
				<th field="model" width="50" sortable="true">产品品名</th>
				<th field="progress" width="50" formatter="sonfield">产品工序</th>
				<th field="manMinute" width="50" sortable="true">标准工时(秒)</th>
				<th field="manHour" width="50"  sortable="true">单位产能</th>
				<th field="balance" width="50" sortable="true">平衡系数</th>
			</tr>
		</thead>
	    </table>
	 <div id="searchtool" style="padding:5px">  
	    <span>产品品名:</span><input type="text" id="model" class="easyui-textbox"  size="12"/>
        <span>产品工序:</span><input type="text" id="progressid" size="12"
        			class="easyui-combobox"  data-options="
					url:'${ctx }/product/getAllProgress.do',
					method:'get',
					valueField:'id',
					textField:'progressName'"/>       
        
        <a href="javascript:searchProHour()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a> 
        <a href="javascript:clearProHour()" class="easyui-linkbutton" data-options="iconCls:'icon-myclear'">清空</a>  
    <div> 
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newProHour()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editProHour()">编辑</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyProHour()">删除</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="reload()">刷新</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-mycopy" plain="true" onclick="copyProHour()">复制</a>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width:400px;height:300px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">工序工时</div>
		<form id="fm" method="post" novalidate>		
			<div class="fitem">
				<label>产品品名:</label>
				<input  name="model" class="easyui-combobox"   required="true" missingMessage="必填信息" 
				 id="big2" data-options="
					url:'getAllModels.do',
					method:'get',
					valueField:'model',
					textField:'model',
					onSelect:setProductid
					"> 
			</div>
			<div class="fitem">
				<label>产品工序:</label>
				<input name="progressid" class="easyui-combobox" required="true" missingMessage="必填信息" data-options="
					url:'${ctx }/product/getAllProgress.do',
					method:'get',
					valueField:'id',
					textField:'progressName'">
			</div>
			
			<div class="fitem">
				<label>标准工时(秒):</label>
				<input name="manMinute" class="easyui-textbox" >
			</div>
			<div class="fitem">
				<label>单位产能:</label>
				<input name="manHour" class="easyui-textbox" >
			</div>
			<div class="fitem">
				<label>平衡系数:</label>
				<input name="balance" class="easyui-textbox" >
			</div>
			<div class="fitem" hidden="true">
				<label>产品id隐藏起来:</label>
				<input id="productid" name="productId" class="easyui-textbox"  type="text">
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveProHour()" style="width:90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
	</div>
			
    <script type="text/javascript">  
    
    
		var url;
		var temp="";
		function newProHour(){
			$('#dlg').dialog('open').dialog('setTitle','添加');
			$('#fm').form('clear');
			url = '${ctx }/product/addProHour.do';
		}
		function copyProHour(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$('#dlg').dialog('open').dialog('setTitle','添加');
				$('#fm').form('load',row);
				url = '${ctx }/product/addProHour.do';
			}else{
			   $.messager.show({
							title: '错误信息',msg: '请选择要编辑的信息'
						});
			}
		}
		function editProHour(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$('#dlg').dialog('open').dialog('setTitle','编辑');
				$('#fm').form('load',row);
				url = '${ctx }/product/updateProHour.do?id='+row.id;
			}else{
			   $.messager.show({
							title: '错误信息',msg: '请选择要编辑的信息'
						});
			}
		}
		function saveProHour(){
			$('#fm').form('submit',{
				url: url,
				onSubmit: function(){
					return $(this).form('validate');
				},
				success: function(result){
				        $('#dlg').dialog('close');		
						$('#dg').datagrid('reload');
					if (result=='true'){				    
						$.messager.show({
							title: '成功信息',msg: '操作成功'
						});
					} else {							
						$.messager.show({
							title: '错误信息',msg: '操作时发生错误'
						});
					}
				}
			});
		}
		function destroyProHour(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$.messager.confirm('Confirm','确定删除这条信息吗?',function(r){					
					if (r){
						$.post('${ctx }/product/deleteProHour.do',{id:row.id},
						function(result){					    
							if (result==true){							    
								$('#dg').datagrid('reload');
								$.messager.show({	
									title: '成功信息',msg: '删除成功'
								});	
							} else {
							    $('#dg').datagrid('reload');
								$.messager.show({	
									title: '错误信息',msg: '删除失败'
								});
							}
						},'json');
					}
				});
			}else{
			    $.messager.show({
							title: '错误信息',msg: '请选择要删除的信息'
						});
			}
		}
		//条件查询
		function searchProHour(){
		    $("#dg").datagrid('load',{
		        model:$("#model").val(),
		        progressid:$("#progressid").combobox('getValue'),
		    });
		}
		function clearProHour(){
		    $("#model").val("");
		    $("#progressid").val("");
		}
		function reload(){
		   $('#dg').datagrid('reload');
		}
		//显示工序名称
		function sonfield(val,row){
		      return row.progress.progressName;
		}
		//联动为产品id赋值
		function setProductid(data){
		    //console.log(data.id);
		    $("#productid").textbox('setValue',data.id);
		}
		
		//初始化,设置  1小写转大写,页码设置汉字
$(function(){
    $("input",$("#big1").next("span")).keyup(function(){
        this.value = this.value.toUpperCase();
    }); 
});	


	</script>
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
</body>
</html>
