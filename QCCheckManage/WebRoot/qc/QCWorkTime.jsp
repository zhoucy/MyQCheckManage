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
			url="searceQCWT.do" toolbar="#searchtool" pageSize="20"
			toolbar="#toolbar"  pagination="true"  fit="true" striped="true"
			rownumbers="true" fitColumns="true" singleSelect="true">			
			  <thead frozen="true">
			<tr>
				<th field="groupname" width="80" align="center" >生产部门</th>
				<th field="belongname" width="100" align="center">归属</th>
			</tr>
		</thead>
		<thead>
			<tr>
				<th colspan="2">1</th>
				<th colspan="2">2</th>
				<th colspan="2">3</th>
				<th colspan="2">4</th>
				<th colspan="2">5</th>
				<th colspan="2">6</th>
				<th colspan="2">7</th>
				<th colspan="2">8</th>
				<th colspan="2">9</th>
				<th colspan="2">10</th>
				<th colspan="2">11</th>
			</tr>
			<tr>
			    <th field="S1" width="60" align="center" formatter="formattertime">起</th>
				<th field="E1" width="60" align="center" formatter="formattertime">止</th>
				<th field="S2" width="60" align="center" formatter="formattertime">起</th>
				<th field="E2" width="60" align="center" formatter="formattertime">止</th>
				<th field="S3" width="60" align="center" formatter="formattertime">起</th>
				<th field="E3" width="60" align="center" formatter="formattertime">止</th>
				<th field="S4" width="60" align="center" formatter="formattertime">起</th>
				<th field="E4" width="60" align="center" formatter="formattertime">止</th>
				<th field="S5" width="60" align="center" formatter="formattertime">起</th>
				<th field="E5" width="60" align="center" formatter="formattertime">止</th>
				<th field="S6" width="60" align="center" formatter="formattertime">起</th>
				<th field="E6" width="60" align="center" formatter="formattertime">止</th>
				<th field="S7" width="60" align="center" formatter="formattertime">起</th>
				<th field="E7" width="60" align="center" formatter="formattertime">止</th>
				<th field="S8" width="60" align="center" formatter="formattertime">起</th>
				<th field="E8" width="60" align="center" formatter="formattertime">止</th>
				<th field="S9" width="60" align="center" formatter="formattertime">起</th>
				<th field="E9" width="60" align="center" formatter="formattertime">止</th>
				<th field="S10" width="60" align="center" formatter="formattertime">起</th>
				<th field="E10" width="60" align="center" formatter="formattertime">止</th>
				<th field="S11" width="60" align="center" formatter="formattertime">起</th>
				<th field="E11" width="60" align="center" formatter="formattertime">止</th>
			</tr>
		</thead>	
	    </table>
	 <div id="searchtool" style="padding:5px">  
	     <table>
	       <tr>
	            <td>生产组别:</td><td><input type="text" id="groupname" size="12"/></td>
	            <td>归属:</td><td><input type="text" id="belongname"  size="12"/></td>
	            <td><input type="button" id="showtime"  onclick="showtime()" value="显示秒数"></td>
	            <td><a href="javascript:searchQCWT()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
	            <td><a href="javascript:clearQCWT()" class="easyui-linkbutton" data-options="iconCls:'icon-myclear'">清空</a></td>
	       </tr>
	    </table> 
    <div> 
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newQCWT()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editQCWT()">编辑</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyQCWT()">删除</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="reload()">刷新</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-mycopy" plain="true" onclick="copyQCWT()">复制</a>
	</div>
	<div id="dlg" class="easyui-dialog" style="width:370px;height:510px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">工作时间</div>
		<form id="fm" method="post" novalidate>
		    <div class="fitem" hidden="true">
				<label>id:</label>
				<input id="qcwtid" name="id" class="easyui-textbox" style="width:80px">
			</div>
			<div class="fitem">
				<label>归属:</label>
				<input id="belongid"  name="belongid" class="easyui-combobox" required="true" missingMessage="必填信息"
				data-options="valueField:'id',textField:'name',
                    url:'${ctx}/qc/getAllProductDept.do',
                    onSelect: function(rec){    
                        var url = '${ctx}/qc/getDeptByBelong.do?belong='+rec.id;  
                        $('#groupid').combobox('clear');   
                        $('#groupid').combobox('reload', url);    
                }"> 
			</div>
			<div class="fitem">
				<label>部门名称:</label>
				<input id="groupid" name="groupid" class="easyui-combobox" required="true" 
				       validType="checkDuplicate" missingMessage="必填信息"
				       data-options="url:'${ctx}/qc/getAllDept.do',valueField:'id',textField:'name'">
			</div>
			<div class="fitem">
				<label>1小时:</label>
				<input name="S1" class="easyui-numberbox" style="width:80px">
				<input name="E1" class="easyui-numberbox" style="width:80px">
			</div>
			<div class="fitem">
				<label>2小时:</label>
				<input name="S2" class="easyui-numberbox" style="width:80px">
				<input name="E2" class="easyui-numberbox" style="width:80px">
			</div>
			<div class="fitem">
				<label>3小时:</label>
				<input name="S3" class="easyui-numberbox" style="width:80px">
				<input name="E3" class="easyui-numberbox" style="width:80px">
			</div>
			<div class="fitem">
				<label>4小时:</label>
				<input name="S4" class="easyui-numberbox" style="width:80px">
				<input name="E4" class="easyui-numberbox" style="width:80px">
			</div>
			<div class="fitem">
				<label>5小时:</label>
				<input name="S5" class="easyui-numberbox" style="width:80px">
				<input name="E5" class="easyui-numberbox" style="width:80px">
			</div>
			<div class="fitem">
				<label>6小时:</label>
				<input name="S6" class="easyui-numberbox" style="width:80px">
				<input name="E6" class="easyui-numberbox" style="width:80px">
			</div>
			<div class="fitem">
				<label>7小时:</label>
				<input name="S7" class="easyui-numberbox" style="width:80px">
				<input name="E7" class="easyui-numberbox" style="width:80px">
			</div>
			<div class="fitem">
				<label>8小时:</label>
				<input name="S8" class="easyui-numberbox" style="width:80px">
				<input name="E8" class="easyui-numberbox" style="width:80px">
			</div>
			<div class="fitem">
				<label>9小时:</label>
				<input name="S9" class="easyui-numberbox" style="width:80px">
				<input name="E9" class="easyui-numberbox" style="width:80px">
			</div>
			<div class="fitem">
				<label>10小时:</label>
				<input name="S10" class="easyui-numberbox" style="width:80px">
				<input name="E10" class="easyui-numberbox" style="width:80px">
			</div>
			<div class="fitem">
				<label>11小时:</label>
				<input name="S11" class="easyui-numberbox" style="width:80px">
				<input name="E11" class="easyui-numberbox" style="width:80px">
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveQCWT()" style="width:90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
	</div>
			
    <script type="text/javascript">  
    
    
		var url;
		var temp="";
		var control="";
		function newQCWT(){		
			$('#dlg').dialog('open').dialog('setTitle','添加');
			$('#fm').form('clear');
			url = '${ctx}/qc/addQCWT.do';
		}
		function editQCWT(){		
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$('#dlg').dialog('open').dialog('setTitle','编辑');
				$('#fm').form('load',row);
				temp=row.groupname;     
				$('#fm').form('load',row);//加载两次,刷掉重复验证                      
				url = '${ctx}/qc/updateQCWT.do';
			}else{
			   $.messager.show({
							title: '错误信息',msg: '请选择要编辑的信息'
						});
			}
		}
		function copyQCWT(){		
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$('#dlg').dialog('open').dialog('setTitle','添加');
				row.id="";
				row.belongid="";
				row.groupid="";
				$('#fm').form('load',row); 
				url = '${ctx}/qc/addQCWT.do';                       
			}else{
			   $.messager.show({
							title: '错误信息',msg: '请选择要复制的信息'
						});
			}
		}
		function saveQCWT(){
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
		function destroyQCWT(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$.messager.confirm('Confirm','确定删除这条信息吗?',function(r){					
					if (r){
						$.post('${ctx}/qc/deleteQCWT.do',{id:row.id},function(result){					    
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
		function searchQCWT(){
		    $("#dg").datagrid('load',{
		        groupname:$("#groupname").val(),
		        belongname:$("#belongname").val(),
		        });
		}
		//清空查询条件,将查询组件赋值为空就行了
		function clearQCWT(){
		    $("#groupname").val("");
		    $("#belongname").val("");
		//刷新
		}
		function reload(){
		   $('#dg').datagrid('reload');
		}
		function showtime(){
		    if(control==""){
		       control="on";
		       $("#showtime").val("显示时间");
		       reload();
		    }else{
		      control="";
		      $("#showtime").val("显示秒数");
		      reload();
		    }
		}
		function formattertime(value, row, index){	
		     if(control=="on"){
		       var hour=Number(value)/3600;
		       var minutes=Number(value)%3600;
		       var minute=minutes/60;
		       var second=minutes%60;
		       return parseInt(hour)+":"+parseInt(minute)+":"+second;
		     }else{
		       return value;
		     }	     
		}
		//检测是否重复的方法
		//自定义证规格	
	$.extend($.fn.validatebox.defaults.rules,{checkDuplicate:{
		      validator:function(value, param){
		          console.log(value);
		          var result;	          
		          $.ajax({
		                type:'post',
		                async:false, //ajax提交时锁死整个浏览器,
		                url:'checkQCWTGroupid.do',
		                data:{"groupname":value},
                        dataType:"json",
		                success:function(data,type){                
		                   result=data;	
		                   if(temp!=""&&temp==value){result=true;}	                   
		                }	                
		          });
		          return result;
		      },
		      message:'这个生产部门已经有工作时间表,请不要重复添加'
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
