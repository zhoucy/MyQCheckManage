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
			url="searchDept.do" toolbar="#searchtool" pageSize="20"
			toolbar="#toolbar"  pagination="true" fit="true"  striped="true"
			rownumbers="true" fitColumns="true" singleSelect="true">			
		<thead>
			<tr>
			    <th field="code" width="20" >部门编号</th>
				<th field="name" width="20" >部门名称</th>				
				<th field="leader" width="20">主管</th>
				<th field="belongname" width="20" >归属</th>
				<th field="remarks" width="20">备注</th>
			</tr>
		</thead>
	    </table>
	 <div id="searchtool" style="padding:5px">  
	    <table>
	        <tr>
	             <td>部门编号:</td><td><input type="text" id="code"  size="12"/></td>
	             <td>部门名称:</td><td><input type="text" id="name" size="12"/></td>
	             <td>主管:</td><td><input type="text" id="leader"  size="12"/></td>
	             <td>归属:</td><td><input type="text" id="belongname"  size="12"/></td>
	             <td><a href="javascript:searchDept()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
	             <td><a href="javascript:clearDept()" class="easyui-linkbutton" data-options="iconCls:'icon-myclear'">清空</a></td>
	        </tr>	    
	    </table>         
    <div> 
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newDept()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editDept()">编辑</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyDept()">删除</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="reload()">刷新</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-mycopy" plain="true" onclick="copyDept()">复制</a>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width:400px;height:300px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">部门信息</div>
		<form id="fm" method="post" novalidate>		
			<div class="fitem">
				<label>部门编号:</label>
				<input  name="code" class="easyui-textbox" required="true" id="big1"  validType="checkcode"
				        missingMessage="必填信息">
			</div>
			<div class="fitem">
				<label>部门名称:</label>
				<input name="name" class="easyui-textbox" required="true" 
				missingMessage="必填信息" validType="checkname">
			</div>
			<div class="fitem">
				<label>主管:</label>
				<input name="leader" class="easyui-textbox" >
			</div>
			<div class="fitem">
				<label>归属:</label>
				<input name="belong" class="easyui-combobox" data-options="
					url:'getAllDept.do',
					method:'post',
					valueField:'id',
					textField:'name'">
			</div>
			<div class="fitem">
				<label>备注:</label>
				<input name="remarks" class="easyui-textbox" >
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveDept()" style="width:90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
	</div>
			
    <script type="text/javascript">  
    
    
		var url;
		var temp="";
		var temp2="";
		function newDept(){
			$('#dlg').dialog('open').dialog('setTitle','添加');
			$('#fm').form('clear');
			url = 'addDept.do';
		}
		function copyDept(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$('#dlg').dialog('open').dialog('setTitle','复制');
				$('#fm').form('load',row);
				url = 'addDept.do';
			}else{
			   $.messager.show({
							title: '错误信息',msg: '请选择要复制的信息'
						});
			}
		}
		function editDept(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$('#dlg').dialog('open').dialog('setTitle','编辑');
				$('#fm').form('load',row);
				temp=row.code;
				temp2=row.name;       //防止编辑的时候判断code重复,上面这一波消耗了比较长的时间,导致获取temp的速度慢于验证的value导致编辑的时候第一次会报重复的错误
				$('#fm').form('load',row); //加载两次成功解决问题,第一次重复验证的消息就不会显示了                         
				url = 'updateDept.do?id='+row.id;
			}else{
			   $.messager.show({
							title: '错误信息',msg: '请选择要编辑的信息'
						});
			}
		}
		function saveDept(){
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
		function destroyDept(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$.messager.confirm('Confirm','确定删除这条信息吗?',function(r){					
					if (r){
						$.post('deleteDept.do',{id:row.id},function(result){					    
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
		function searchDept(){
		    $("#dg").datagrid('load',{
		        name:$("#name").val(),
		        code:$("#code").val(),
		        leader:$("#leader").val(),
		        belongname:$("#belongname").val()
		    });
		}
		function clearDept(){
		     $("#name").val("");
		     $("#code").val("");
		     $("#leader").val("");
		     $("#belongname").val("");
		}
		function reload(){
		   $('#dg').datagrid('reload');
		}
		//格式化部门(不使用)
		/* function formatbelong(val,row,index){
		    var back=val;
		    $.ajax({
		        type:'post',
		        async:false,//必须锁住才能为back赋值
		        url:'getDeptNameByID.do',
		        data:{"id":val},
                dataType:"json",
		        success:function(data,type){
		           if(data!="没有"){back=data;}
		        }	
		    });
		    return back;
		} */
		//检测是否重复的方法
		//自定义证规格	
		$.extend($.fn.validatebox.defaults.rules,{checkcode:{
		      validator:function(value, param){
		          var result;	          
		          $.ajax({
		                type:'post',
		                async:false, //ajax提交时锁死整个浏览器,
		                url:'checkDeptCode.do',
		                data:{"code":value},
                        dataType:"json",
		                success:function(data,type){              
		                   result=data;	
		                   if(temp!=""&&temp==value){result=true;}	                   
		                }	                
		          });
		          return result;
		      },
		      message:'重复的部门编码'
		},checkname:{
		      validator:function(value, param){
		          var result;	          
		          $.ajax({
		                type:'post',
		                async:false, //ajax提交时锁死整个浏览器,
		                url:'checkDeptName.do',
		                data:{"name":value},
                        dataType:"json",
		                success:function(data,type){              
		                   result=data;	
		                   if(temp2!=""&&temp2==value){result=true;}	                   
		                }	                
		          });
		          return result;
		      },
		      message:'重复的部门名称'
		}});
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
