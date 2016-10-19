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
			url="searchProgress.do" toolbar="#searchtool" pageSize="20"
			toolbar="#toolbar"  pagination="true" fit="true"  striped="true"
			rownumbers="true" fitColumns="true" singleSelect="true">			
		<thead>
			<tr>
			    <th field="progressCode" width="20" >工序编号</th>
				<th field="progressName" width="20" >工序名称</th>				
			</tr>
		</thead>
	    </table>
	 <div id="searchtool" style="padding:5px">  
	     <table>
	       <tr>
	            <td>工序编号:</td><td><input type="text" id="progressCode"  size="12"/></td>
	            <td>工序名称:</td><td><input type="text" id="progressName" size="12"/></td>
	            <td><a href="javascript:searchProgress()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
	            <td><a href="javascript:clearProgress()" class="easyui-linkbutton" data-options="iconCls:'icon-myclear'">清空</a></td>	            
	       </tr>
	    </table>
    <div> 
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newProgress()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editProgress()">编辑</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyProgress()">删除</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="reload()">刷新</a>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width:400px;height:300px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">工序信息</div>
		<form id="fm" method="post" novalidate>		
			<div class="fitem">
				<label>工序编号:</label>
				<input  name="progressCode" class="easyui-textbox" required="true" id="big1"
				       validType="checkDuplicate" missingMessage="必填信息">
			</div>
			<div class="fitem">
				<label>工序名称:</label>
				<input name="progressName" class="easyui-textbox" required="true"
				      validType="checkDuplicateName" missingMessage="必填信息">
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveProgress()" style="width:90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
	</div>
			
    <script type="text/javascript">  
    
    
		var url;
		var temp="";
		var temp2="";
		function newProgress(){
			$('#dlg').dialog('open').dialog('setTitle','添加');
			$('#fm').form('clear');
			url = 'addProgress.do';
		}
		function editProgress(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$('#dlg').dialog('open').dialog('setTitle','编辑');
				$('#fm').form('load',row);
				temp=row.progressCode;  
				temp2=row.progressName;     //防止编辑的时候判断code重复,上面这一波消耗了比较长的时间,导致获取temp的速度慢于验证的value导致编辑的时候第一次会报重复的错误
				$('#fm').form('load',row); //加载两次成功解决问题,第一次重复验证的消息就不会显示了                         
				url = 'updateProgress.do?id='+row.id;
			}else{
			   $.messager.show({
							title: '错误信息',msg: '请选择要编辑的信息'
						});
			}
		}
		function saveProgress(){
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
		function destroyProgress(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$.messager.confirm('Confirm','确定删除这条信息吗?',function(r){					
					if (r){
						$.post('deleteProgress.do',{id:row.id},function(result){					    
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
		function searchProgress(){
		    $("#dg").datagrid('load',{
		        progressName:$("#progressName").val(),
		        progressCode:$("#progressCode").val()
		    });
		}
		function clearProgress(){
		    $("#progressName").val("");
		    $("#progressCode").val("");
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
		                url:'checkProgressCode.do',
		                data:{"code":value},
                        dataType:"json",
		                success:function(data,type){	               
		                   result=data;	
		                   if(temp!=""&&temp==value){result=true;}	                   
		                }	                
		          });
		          return result;
		      },
		      message:'重复的流程编码'
		}},{checkDuplicateName:{
		      validator:function(value, param){
		          var result;	          
		          $.ajax({
		                type:'post',
		                async:false, //ajax提交时锁死整个浏览器,
		                url:'checkProgressName.do',
		                data:{"name":value},
                        dataType:"json",
		                success:function(data,type){	               
		                   result=data;	
		                   if(temp2!=""&&temp2==value){result=true;}	                   
		                }	                
		          });
		          return result;
		      },
		      message:'重复的流程名称'
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
