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
			url="searchQCProject.do" toolbar="#searchtool" pageSize="20"
			toolbar="#toolbar"  pagination="true"  fit="true" striped="true"
			rownumbers="true" fitColumns="true" singleSelect="true">			
		<thead>
			<tr>
				<th field="id" width="20">项目编码</th>
				<th field="name" width="20">项目名称</th>
				
				
			</tr>
		</thead>
	    </table>
	 <div id="searchtool" style="padding:5px"> 
	    <table>
	       <tr>
	            <td>项目编码:</td><td><input type="text" id="id" size="12"/> </td>
	            <td>项目名称:</td><td><input type="text" id="name"  size="12"/></td>
	            <td><a href="javascript:searchQCProject()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
	            <td><a href="javascript:clearQCProject()" class="easyui-linkbutton" data-options="iconCls:'icon-myclear'">清空</a></td>	            
	       </tr>
	    </table>  
    <div> 
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newProject()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editProject()">编辑</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteProject()">删除</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="reload()">刷新</a>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">修改不良项</div>
		<form id="fm" method="post" novalidate>
			<div class="fitem">
				<label>项目编码:</label>
				<input name="id" class="easyui-textbox" id="projectid" required="true" missingMessage="必填信息" validType="checkDuplicate">
			</div>
			<div class="fitem">
				<label>项目名称:</label>
				<input  name="name" class="easyui-textbox" required="true" id="big1"
				       validType="checkDuplicate" missingMessage="必填信息">
			</div>
			
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton " iconCls="icon-ok" onclick="saveProject()" style="width:90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
	</div>
	<div id="dlg2" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">修改不良项</div>
		<form id="fm" method="post" novalidate>
			<div class="fitem">
				<label>项目编码:</label>
				<input name="id" class="easyui-textbox" id="projectid" required="true" missingMessage="必填信息" validType="checkDuplicate" readonly="readonly">
			</div>
			<div class="fitem">
				<label>项目名称:</label>
				<input  name="name" class="easyui-textbox" required="true" id="big1"
				       validType="checkDuplicate" missingMessage="必填信息">
			</div>
			
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton " iconCls="icon-ok" onclick="saveProject()" style="width:90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg2').dialog('close')" style="width:90px">取消</a>
	</div>
			
    <script type="text/javascript">  
    
    
		var url;
		var temp="";
		function newProject(){
			$('#dlg').dialog('open').dialog('setTitle','添加');
			$('#fm').form('clear');
			url = 'addQCProject.do';
		}
		function editProject(){
		 
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$('#dlg2').dialog('open').dialog('setTitle','编辑');
				$('#fm').form('load',row);
				
				temp=row.id;       //防止编辑的时候判断code重复,上面这一波消耗了比较长的时间,导致获取temp的速度慢于验证的value导致编辑的时候第一次会报重复的错误
				$('#fm').form('load',row); //加载两次成功解决问题,第一次重复验证的消息就不会显示了                         
				url = 'modifyQCProject.do';
				
			}else{
			   $.messager.show({
							title: '错误信息',msg: '请选择要编辑的信息'
						});
			}
		}
		function saveProject(){
			$('#fm').form('submit',{
				url: url,
				onSubmit: function(){
					return $(this).form('validate');
				},
				success: function(result){
				        $('#dlg').dialog('close');		
				        $('#dlg2').dialog('close');		
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
		function deleteProject(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$.messager.confirm('Confirm','确定删除这条信息吗?',function(r){					
					if (r){
						$.post('deleteQCProject.do',{id:row.id},function(result){					    
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
		function searchQCProject(){
		    $("#dg").datagrid('load',{
		        id:$("#id").val(),
		        name:$("#name").val(),
		     
		    });
		}
		function clearQCProject(){
		    $("#id").val("");
		    $("#name").val("");
		}
		function reload(){
		   $('#dg').datagrid('reload');
		}
		//检测是否重复的方法
		//自定义证规格	
		$.extend($.fn.validatebox.defaults.rules,{checkDuplicate:{
		      validator:function(value, param){
		          var result;	          
		          $.ajax({
		                type:'post',
		                async:false, //ajax提交时锁死整个浏览器,
		                url:'checkProject.do',
		                data:{"id":value},
                        dataType:"json",
		                success:function(data,type){	                
		                   result=data;	
		                   if(temp!=""&&temp==value){result=true;}	                   
		                }	                
		          });
		          return result;
		      },
		      message:'代码已经被占用'
		}});

	

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
