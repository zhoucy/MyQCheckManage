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
	<div class="easyui-panel"  style="width:auto;height:auto;border:0;" data-options="fit:true">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'east',split:true" style="width:40%;border:0">
				<div class="easyui-tabs" data-options="fit:true"  style="width:auto;height:auto;border:0">
					<div title="基本信息">
					    <table>
						    <tr> 
						        <td><label>用户id:</label></td>
						        <td><input id="biid" class="easyui-textbox" data-options="readonly:true"> </td>
						    </tr>	
						    <tr> 
						        <td><label>用户名称:</label></td>
						        <td><input id="biname" class="easyui-textbox" data-options="readonly:true"> </td>
						    </tr>
						    <tr> 
						        <td><label>用户密码:</label></td>
						        <td><input id="bipwd" class="easyui-textbox" data-options="readonly:true"> </td>
						    </tr>
						    <tr> 
						        <td><label>所在部门:</label></td>
						        <td><input id="bidept" class="easyui-textbox" data-options="readonly:true"> </td>
						    </tr>
						    <tr> 
						        <td><label>上司:</label></td>
						        <td><input id="birole" class="easyui-textbox" data-options="readonly:true"> </td>
						    </tr>	
						</table>				
					</div>
					<div title="角色信息">
						
						<table id="ritable" title="" class="easyui-datagrid" url="${ctx}/qc/getAllRole.do"
						data-options="idField:'id'">
							<thead>
								<tr>
								    <th data-options="field:'ck',checkbox:true"></th>
									<th field="id" width="100" sortable="true">角色id</th>
									<th field="name" width="100" sortable="true">角色名</th>
								</tr>
							</thead>
						</table>
					</div>
					<div title="权限信息">					 
						<table id="pitable" title="" class="easyui-datagrid">
							<thead>
								<tr>
				                    <th field="pname" width="100" sortable="true">权限名称</th>
				                    <th field="purl" width="200">权限URL</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
			<div data-options="region:'center'" style="border:0">
			    <!-- 原表格在这里 -->
				<table id="dg" title="" class="easyui-datagrid" 
			        url="searchQCUser.do" toolbar="#searchtool"  data-options="onSelect:selectfunction"
			        toolbar="#toolbar"  pagination="true"  fit="true"  striped="true"
			        rownumbers="true" fitColumns="true" singleSelect="true">			
		       <thead>
			   <tr>
				<th field="id" width="20" sortable="true">用户编码</th>
				<th field="name" width="20">用户名称</th>
				<th field="password" width="20">用户密码</th>
				<th field="dpt" formatter="formatDpt" width="20">所在部门</th>
				<th field="user2Role"  formatter="formatUser2Role" width="20">所属角色</th>
			   </tr>
		      </thead>
	          </table>
			</div>
		</div>
	</div>
		
	 <div id="searchtool" style="padding:5px"> 

        <table>
	       <tr>
	            <td>用户编码:</td><td><input type="text" id="id"  name ="id" size="12"/> </td>
	            <td>用户名称:</td><td><input type="text" id="name" name="name" size="12"/></td>
	            <td>所在部门:</td><td><input type="text" id="departmentid" name="departmentid"  size="12"/></td>
	            <td><a href="javascript:searchQCUser()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a> </td>
	            <td><a href="javascript:clearQCUser()" class="easyui-linkbutton" data-options="iconCls:'icon-myclear'">清空</a></td>
	       </tr>
	    </table>
    <div> 
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newQCUser()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editQCUser()">编辑</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyQCUser()">删除</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="reload()">刷新</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-mylimit" plain="true" onclick="assignDialog()">分配角色</a>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">用户信息</div>
		<form id="fm" method="post" novalidate>
			<div class="fitem">
				<label>用户编码:</label>
				<input name="id" class="easyui-textbox" required="true" missingMessage="必填信息" validType="checkDuplicate">
			</div>
			<div class="fitem">
				<label>用户名称:</label>
				<input  name="name" class="easyui-textbox" required="true"  missingMessage="必填信息">
			</div>
			<div class="fitem">
				<label>用户密码:</label>
				<input name="password" class="easyui-textbox" required="true" missingMessage="必填信息">
			<div class="fitem">
				<label>所在部门:</label>
				<input name="groupid" class="easyui-combobox" data-options="
					url:'getAllDept.do',
					method:'get',
					valueField:'id',
					textField:'name',
					panelHeight:'auto'">
				
			</div>
		</form>
	</div>

	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveQCUser()" style="width:90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
	</div>
	
	<div id="dlg2" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons2">
		<div class="ftitle">所有角色</div>
		<div class="fitem">
				<label>角色名称:</label>
				<select id="roleSelect">
				</select>
			</div>
			
	</div>
	
	<div id="dlg-buttons2">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="assign()" style="width:90px">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg2').dialog('close')" style="width:90px">取消</a>
	</div>	
			
    <script type="text/javascript">  
    
    
		var url;
		var temp="";
		function assignDialog(){
		$("#roleSelect").empty(); 
			$.ajax({
		                type:'post',
		                async:false, //ajax提交时锁死整个浏览器,
		                url:'getAllRole.do',
                        dataType:"json",
		                success:function(data){	
		                	if(data!=null&&data.length>0){
		                		for(var i=0;i<data.length;i++){                
	    						 $("#roleSelect").append("<option value=\""+data[i].id+"\">"+data[i].name+"</option>");
	    							}
	    					 }
  							          
		                }	                
		          });
		
			var row = $('#dg').datagrid('getSelected');
			
			if (row&&row.user2Role==null){
				$('#dlg2').dialog('open').dialog('setTitle','分配角色');
				url = 'assign.do?userId='+row.id;
			}else if(row&&null!=row.user2Role){
			   $.messager.confirm("确认", "已有角色，是否重新分配", function (r) {  
       			 if (r) {  
          			 	$('#dlg2').dialog('open').dialog('setTitle','分配角色');
						url = 'assign.do?userId='+row.id;
        			}  
    			}); 
    		}
			else {
			   $.messager.show({
							title: '错误信息',msg: '请选择要编辑的信息'
						});
						
			}
		}
		function  assign(){
			$.ajax({
		                type:'post',
		                async:false, //ajax提交时锁死整个浏览器,
		                url:url,
		                data:{"roleId":  $("#roleSelect ").val()},
                        dataType:"json",
		                success:function(data){	
		                	$('#dlg2').dialog('close');		
							$('#dg').datagrid('reload');
		                	$.messager.show({
							title: '提示信息',msg: data
						      	          
		         		 });
		 			},
		 			error: function (XMLHttpRequest, textStatus, errorThrown) {  
			    		  
			    		alert(errorThrown);     
			    		} 
		          });
		}
		
		function newQCUser(){
			$('#dlg').dialog('open').dialog('setTitle','添加');
			$('#fm').form('clear');
			url = 'addQCUser.do';
		}
		function editQCUser(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$('#dlg').dialog('open').dialog('setTitle','编辑');
				$('#noedit').attr("readonly", "readonly");
				$('#fm').form('load',row);				
				temp=row.id;       
				$('#fm').form('load',row); //加载两次刷掉重复验证                     
				url = 'modifyQCUser.do?uid='+row.id;
			}else{
			   $.messager.show({
							title: '错误信息',msg: '请选择要编辑的信息'
						});
			}
		}
		function saveQCUser(){
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
		function destroyQCUser(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$.messager.confirm('Confirm','确定删除这条信息吗?',function(r){					
					if (r){
						$.post('deleteQCUser.do',{id:row.id},function(result){					    
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
		function searchQCUser(){
			 $("#dg").datagrid('load',{
		        id:$("#id").val(),
		        name:$("#name").val(),
		     
		    });	   
		}
		function clearQCUser(){
		    $("#id").val("");
		    $("#name").val("");
		}
		function reload(){
		   $('#dg').datagrid('reload');
		}
		//获取用户角色
		 function formatUser2Role(value){
			if(value==null){
			return "";
			}else 
       		 return value.role.name;

    	};
		 function formatDpt(value){
			if(value==null){
			return "";
			}else 
       		 return value.name;

    	};
		//检测是否重复的方法
		//自定义证规格	
		$.extend($.fn.validatebox.defaults.rules,{checkDuplicate:{
		      validator:function(value, param){
		          var result;	          
		          $.ajax({
		                type:'post',
		                async:false, //ajax提交时锁死整个浏览器,
		                url:'checkUser.do',
		                data:{"id":value},
                        dataType:"json",
		                success:function(data,type){	                
		                   result=data;
		                   if(temp!=""&&temp==value){result=true;}	                 
		                }	                
		          });
		          return result;
		      },
		      message:'此用户ID已经被使用,请更换'
		}});
		
function selectfunction(rowIndex, rowData){
    $.ajax({
			type : 'post',
			url : '${ctx}/qc/getUserUnionById.do',
			data : {uid:rowData.id},
			async : false,
			dataType : 'json',
			success : function(result) { 
			    tabsfun(result);
			}
	 });
}
function tabsfun(result){
    //基本信息
    $("#biid").textbox('setValue',result[0].uid);
    $("#biname").textbox('setValue',result[0].uname);
    $("#bipwd").textbox('setValue',result[0].upwd);
    $("#bidept").textbox('setValue',result[0].deptname);
    $("#birole").textbox('setValue',result[0].deptleader);
    //角色信息
    $('#ritable').datagrid('unselectAll');    
    //因为是单角色模式,所以暂时先这样处理
    $('#ritable').datagrid('selectRecord',result[0].rid);
    //权限信息
    $('#pitable').datagrid('loadData', result);
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
