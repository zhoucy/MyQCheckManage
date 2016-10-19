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
					    <table id="pitable" title="" class="easyui-datagrid" url="${ctx}/qc/getAllPermission.do"
						data-options="idField:'id'" toolbar="#toolbar2">
							<thead>
								<tr>
								    <th data-options="field:'ck',checkbox:true"></th>
								    <th field="id" width="100" hidden="true">id</th>
				                    <th field="name" width="100">权限名称</th>
				                    <th field="url" width="200">权限URL</th>
								</tr>
							</thead>
						</table>				
					</div>
					<div title="角色用户">
						<table id="rutable"></table>
					</div>
				</div>
			</div>
			<div data-options="region:'center'" style="border:0;">
				<table id="dg" title="" class="easyui-datagrid" style="width:auto;height:auto;"
			       url="searchQCRole.do" toolbar="#searchtool" data-options="onSelect:selectfunction"
			       toolbar="#toolbar"  pagination="true" fit="true"  striped="true"
			       rownumbers="true" fitColumns="true" singleSelect="true">			
		       <thead>
			   <tr>
				  <th field="id" width="20" sortable="true">角色id</th>
				  <th field="name" width="20" sortable="true">角色名</th>
				  <th field="permission" width="20" multiline="true" hidden="true">拥有权限</th>
			   </tr>
		       </thead>
	           </table>
			</div>
		</div>
</div>		
	 <div id="searchtool" style="padding:5px;">  
	    <table>
	       <tr>
	            <td>角色id:</td><td><input type="text" id="id" size="12"/></td>
	            <td>角色名:</td><td><input type="text" id="name"  size="12"/></td>
	            <td><a href="javascript:searchRole()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
	            <td><a href="javascript:clearRole()" class="easyui-linkbutton" data-options="iconCls:'icon-myclear'">清空</a></td>            
	       </tr>
	    </table>
    <div> 
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newRole()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editRole()">编辑</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyRole()">删除</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="reload()">刷新</a>
	</div>
	<div id="toolbar2">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="saveRole2()">更新/保存权限</a>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">角色信息</div>
		<form id="fm" method="post" novalidate>
			<div class="fitem">
				<label>角色id:</label>
				<input  id="roleid" name="id" class="easyui-textbox" required="true" missingMessage="必填信息"
				validType="checkDuplicate">
			</div>
			<div class="fitem">
				<label>角色名:</label>
				<input id="rolename"  name="name" class="easyui-textbox" required="true"  missingMessage="必填信息">
			</div>
			<div class="fitem">
				<label>权限分配:</label>					
				<select id="rolepermission"  name="permission" class="easyui-combogrid"  style="width:160px" required="true" missingMessage="必填信息"
				            data-options="
				            panelWidth: 400,
			                multiple: true,
			                idField: 'id',
			                textField: 'name',
			                url: 'getAllPermission.do',
			                method: 'get',
			                columns: [[
				            {field:'ck',checkbox:true},
				            {field:'id',title:'ID',width:20},
				            {field:'name',title:'名称',width:80},
				            {field:'url',title:'URL',width:120}
			           ]],
			                fitColumns: true"></select>		
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveRole()" style="width:90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
	</div>
			
    <script type="text/javascript">  
    
    
		var url;
		var temp=0;
		function newRole(){
			$('#dlg').dialog('open').dialog('setTitle','添加');
			$('#fm').form('clear');
			url = 'addQCRole.do';
		}
		function editRole(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$('#dlg').dialog('open').dialog('setTitle','编辑');
				$('#fm').form('load',row);				
				temp=row.id;
				$('#fm').form('load',row);                  
				url = 'updateQCRole.do?updateid='+row.id+'&updatename='+row.name;
			}else{
			   $.messager.show({
							title: '错误信息',msg: '请选择要编辑的信息'
						});
			}
		}
		function saveRole(){
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
		function destroyRole(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$.messager.confirm('Confirm','确定删除这条信息吗?',function(r){					
					if (r){
						$.post('deleteQCRole.do',{id:row.id,name:row.name,permissionID:row.permissionID},function(result){					    
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
		function searchRole(){
		    $("#dg").datagrid('load',{
		        id:$("#id").val(),
		        name:$("#name").val(),
		    });
		}
		function clearRole(){
		    $("#id").val("");
		    $("#name").val("");
		}
		function reload(){
		   $('#dg').datagrid('reload');
		}
		function saveRole2(){
		   var rows=$("#pitable").datagrid('getSelections');
		   if(rows.length==0){
		        $.messager.show({title: '错误信息',msg: '至少分配一个权限'});
		        return;
		   }
		   var row = $('#dg').datagrid('getSelected');
		   var json={};
		   $.each(rows,function(name,value){
		       json[name]=value.id;
		   });
		   //JSON.stringify(json);		   
		   if(row){
		        $.ajax({
		           type:'post',
		           url:'updateQCRole.do?updateid='+row.id+'&updatename='+row.name,
		           data:{'id':row.id,'name':row.name,'permission':json},
		           dataType:'json',
		           success:function(result){
		                if (result==true){				    
						$.messager.show({title: '成功信息',msg: '保存/更新成功'});
					} else {							
						$.messager.show({title: '错误信息',msg: '保存/更新失败'});
					}
		           }
		        });
		   }else{
		       $.messager.show({title: '错误信息',msg: '请选择要编辑的<span style="color:red;">角色</span>'});
		   }		   
		}
		
		
		
		//检测是否重复的方法
		//自定义证规格	
		$.extend($.fn.validatebox.defaults.rules,{checkDuplicate:{
		      validator:function(value, param){
		          var result;	          
		          $.ajax({
		                type:'post',
		                async:false, //ajax提交时锁死整个浏览器,
		                url:'checkQCRoleID.do',
		                data:{"id":value},
                        dataType:"json",
		                success:function(data,type){                
		                   result=data;	
		                   if(temp!=""&&temp==value){result=true;}	                   
		                }	                
		          });
		          return result;
		      },
		      message:'重复的ID,禁止使用'
		}});
		
function selectfunction(rowIndex, rowData){
    $.ajax({
			type : 'post',
			url : '${ctx}/qc/getPremissionByRoleId.do',
			data : {rid:rowData.id},
			async : false,
			dataType : 'json',
			success : function(result) { 
			    tabsfun(result);
			}
	 });
	 $("#rutable").datagrid({   
	     rownumbers:true,
	     pagination:true,
	     fit:true,
         url:'getUserPageListByRid.do',        
         queryParams: {
		     rid:rowData.id    
	     },                      
         columns:[[    
            {field:'uid',title:'用户id',width:80},    
            {field:'uname',title:'用户姓名',width:80},
            {field:'rname',title:'角色名称',width:80},
            {field:'deptname',title:'部门',width:80},
            {field:'deptleader',title:'部门leader',width:80},
      ]]});   	 
}
function tabsfun(result){
    //权限详情
    $('#pitable').datagrid('unselectAll');
    $.each(result,function(name,value){
        $('#pitable').datagrid('selectRecord',value.id);
    });
    //角色用户
}

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
