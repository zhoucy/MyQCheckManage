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
<div class="easyui-panel" style="width:auto;height:auto;border:0;" data-options="fit:true">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'east',split:true" style="width:40%;border:0;">
				<div class="easyui-tabs" data-options="fit:true"  style="width:auto;height:auto;border:0">
					<div title="权限详情">
						<table id="pitable"  toolbar="#toolbar2"></table>
					</div>
				</div>
			</div>
			<div data-options="region:'center'" style="border:0;">
				<table id="dg" title="" class="easyui-datagrid"
					style="width:auto;height:auto" url="searchQCPermission.do"
					toolbar="#searchtool" toolbar="#toolbar" striped="true"
					pagination="true"   data-options="onSelect:selectfunction,idField: 'id'"
					fit="true" rownumbers="true" fitColumns="true" singleSelect="true">
					<thead>
						<tr>
							<th field="id" width="20" sortable="true">权限id</th>
							<th field="name" width="40" sortable="true">权限名称</th>
							<th field="url" width="150">权限URL</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
</div>	
		
	 <div id="searchtool" style="padding:5px">
	     <table>
	       <tr>
	            <td>权限id:</td><td><input type="text" id="id" size="12"/></td>
	            <td>权限名称:</td><td><input type="text" id="name"  size="12"/></td>
	            <td>权限URL:</td><td><input type="text" id="url"  size="12"/> </td>
	            <td><a href="javascript:searchPermission()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
	            <td><a href="javascript:clearPermission()" class="easyui-linkbutton" data-options="iconCls:'icon-myclear'">清空</a></td>
	       </tr>
	    </table>    
    <div> 
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newPermission()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editPermission()">编辑</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyPermission()">删除</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="reload()">刷新</a>
	</div>
	<div id="toolbar2" hidden="true">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newPermission2()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editPermission2()">编辑</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyPermission2()">删除</a>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">权限信息</div>
		<form id="fm" method="post" novalidate>
			<div class="fitem">
				<label>权限id:</label>
				<input name="id" class="easyui-textbox"  readonly="readonly">
			</div>
			<div class="fitem">
				<label>权限名称:</label>
				<input  name="name" class="easyui-textbox" required="true" missingMessage="必填信息">
			</div>
			<div class="fitem">
				<label>权限URL:</label>
				<input name="url" class="easyui-textbox" required="true" missingMessage="必填信息">
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="savePermission()" style="width:90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
	</div>
	<div id="dlg2" class="easyui-dialog" style="width:1000px;height:480px;padding:10px 20px"
			closed="true" buttons="#dlg2-buttons">
		<table id="tt"></table>
	</div>
	<div id="dlg2-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="newPermission2()" style="width:90px">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" onclick="editPermission2()" style="width:90px">编辑</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" onclick="destroyPermission2()" style="width:90px">删除</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg2').dialog('close')" style="width:90px">取消</a>
	</div>
			
    <script type="text/javascript">  
    
    
		var url;
		function newPermission(){
			$('#dlg').dialog('open').dialog('setTitle','添加');
			$('#fm').form('clear');
			url = 'addQCPermission.do';
		}
		function editPermission(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$('#dlg').dialog('open').dialog('setTitle','编辑');
				$('#fm').form('load',row);            
				url = 'updateQCPermission.do';
			}else{
			   $.messager.show({title: '错误信息',msg: '请选择要编辑的信息'});
			}
		}
		function savePermission(){
		    var row = $('#dg').datagrid('getSelected');
			$('#fm').form('submit',{
				url: url,
				onSubmit: function(){
					return $(this).form('validate');
				},
				success: function(result){
				        $('#dlg').dialog('close');		
						$('#dg').datagrid('reload');
						console.log(row.id);
						$('#dg').datagrid('selectRecord',row.id);						
					if (result=='true'){				    
						$.messager.show({title: '成功信息',msg: '操作成功'});
					} else {							
						$.messager.show({title: '错误信息',msg: '操作时发生错误'});
					}
				}
			});
		}
		function destroyPermission(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$.messager.confirm('Confirm','确定删除<span style="color:red;">'+row.name+'</span>这条信息吗?',function(r){					
					if (r){
						$.post('deleteQCPermission.do',{id:row.id},function(result){					    
							if (result==true){							    
								$('#dg').datagrid('reload');
								$.messager.show({	title: '成功信息',msg: '删除成功'});	
							} else {
							    $('#dg').datagrid('reload');
								$.messager.show({	title: '错误信息',msg: '删除失败'});
							}
						},'json');
					}
				});
			}else{
			    $.messager.show({title: '错误信息',msg: '请选择要删除的信息'});
			}
		}
		//管理权限部分的增删改查
		function newPermission2(){
			$('#dlg').dialog('open').dialog('setTitle','添加');
			$('#fm').form('clear');
			var row = $('#dg').datagrid('getSelected');
			var fatherid=row.id;
			url = 'addQCPermission.do?fatherid='+fatherid;
		}
		function editPermission2(){
			var row = $('#pitable').datagrid('getSelected');
			if (row){
				$('#dlg').dialog('open').dialog('setTitle','编辑');
				$('#fm').form('load',row);            
				url = 'updateQCPermission.do';
			}else{
			   $.messager.show({title: '错误信息',msg: '请选择要编辑的信息'});
			}
		}
		function destroyPermission2(){
			var row = $('#pitable').datagrid('getSelected');
			if (row){
				$.messager.confirm('Confirm','确定删除<span style="color:red;">'+row.name+'</span>这条信息吗?',function(r){					
					if (r){
						$.post('deleteQCPermission.do',{id:row.id},function(result){					    
							if (result==true){							    
								$('#pitable').datagrid('reload');
								$.messager.show({	title: '成功信息',msg: '删除成功'});	
							} else {
							    $('#pitable').datagrid('reload');
								$.messager.show({	title: '错误信息',msg: '删除失败'});
							}
						},'json');
					}
				});
			}else{
			    $.messager.show({title: '错误信息',msg: '请选择要删除的信息'});
			}
		}
		
		
		
		//条件查询
		function searchPermission(){
		    $("#dg").datagrid('load',{
		        id:$("#id").val(),
		        name:$("#name").val(),
		        fatherid:$("#fatherid").val(),
		        url:$("#url").val()
		    });
		}
		function clearPermission(){
		     $("#id").val("");
		     $("#name").val("");
		     $("#fatherid").val("");
		     $("#url").val("");
		}
		function reload(){
		   $('#dg').datagrid('reload');
		}

function selectfunction(rowIndex, rowData){
    $("#pitable").datagrid({ 
         view: myview,
         emptyMsg: '无数据',  
	     fit:true,
	     singleSelect:true,
         url:'getPermissionByFatherid.do',        
         queryParams: {
		     fatherid:rowData.id    
	     },                      
         columns:[[    
            {field:'id',title:'权限id'},    
            {field:'name',title:'权限名称'},
            {field:'url',title:'权限url'},
      ]]}); 
}
//无数据时显示无数据
var myview = $.extend({},$.fn.datagrid.defaults.view,{
    onAfterRender:function(target){
        $.fn.datagrid.defaults.view.onAfterRender.call(this,target);
        var opts = $(target).datagrid('options');
        var vc = $(target).datagrid('getPanel').children('div.datagrid-view');
        vc.children('div.datagrid-empty').remove();
        if (!$(target).datagrid('getRows').length){
            var d = $('<div class="datagrid-empty"></div>').html(opts.emptyMsg || 'no records').appendTo(vc);
            d.css({
                position:'absolute',
                left:0,
                top:50,
                width:'100%',
                textAlign:'center'
            });
        }
    }
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
