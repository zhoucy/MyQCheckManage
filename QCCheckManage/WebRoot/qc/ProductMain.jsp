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
			url="searchMain.do" toolbar="#searchtool"  pageSize="20"
			toolbar="#toolbar"  pagination="true" fit="true"  striped="true"
			rownumbers="true" fitColumns="true" singleSelect="true">			
		<thead>
			<tr>
			    <th field="pono" width="20" >订单号</span></red></th>
				<th field="groupid" width="20" >产线</th>				
				<th field="model" width="20">产品型号</th>
				<th field="prodectType" width="20">产品类型</th>
				<th field="progress" width="20">工序</th>
				<th field="sumWorker" width="20">投入人数</th>
				<th field="targetProduct" width="20">目标产能</th>
				<th field="standardProduct" width="20">标准产能</th>
				<th field="productDate" width="20">生产日期</th>
			</tr>
		</thead>
	    </table>
	 <div id="searchtool" style="padding:5px"> 
	 
	    <table>
	         <tr>
	              <td>生产订单:</td><td><input type="text" id="pono"  size="12"/></td>
	              <td>生产组别:</td><td><input type="text" id="groupid" size="12"/> </td>
	              <td>产品型号:</td><td><input type="text" id="model"  size="12"/> </td>
	              <td>产品类型:</td><td><select  id="prodectType" style="width:96px"  >
							                <option value="" >全部</option>
							                <c:forEach var="productType" items="${productTypes}">
								            <option value="${productType.index}" >
									        ${productType.name}
								            </option>
							                </c:forEach>  
						                    </select></td>
	              <td>工序:</td><td><input type="text" id="progress"  size="12" class="easyui-combobox" data-options="
					                        url:'${ctx }/product/getAllProgress.do',
					                        method:'get',
					                        valueField:'id',
					                        textField:'progressName'"/></td>
	              <td><a href="javascript:searchMain()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
	              <td><a href="javascript:clearMain()" class="easyui-linkbutton" data-options="iconCls:'icon-myclear'">清空</a></td>
	         </tr>
	    </table>  
    <div> 
	<div id="toolbar">
		
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editMain()">编辑</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyMain()">删除</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="reload()">刷新</a>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width:400px;height:370px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">生产订单信息</div>
		<form id="fm" method="post" novalidate>		
			<div class="fitem">
				<label>订单号:</label>
				<input  name="pono" class="easyui-textbox" required="true" id="big1"  validType="checkcode"
				        missingMessage="必填信息">
			</div>
			<div class="fitem">
				<label>产线:</label>
				<input name="groupid" class="easyui-textbox" required="true" 
				missingMessage="必填信息" validType="checkname">
			</div>
			<div class="fitem">
				<label>产品型号:</label>
				<input name="model" class="easyui-textbox" >
			</div>
			<div class="fitem">
				<label>产品类型:</label>
				<select  name="productType" required="true" missingMessage="必填信息" style="width:160px" >
						
						<c:forEach var="productType" items="${productTypes}">
							<option value="${productType.index}" >
								${productType.name}
							</option>
						</c:forEach>
				</select>
			</div>
			<div class="fitem">
				<label>投入人数:</label>
				<input name="sumWorker" class="easyui-textbox" >
			</div>
			<div class="fitem">
				<label>标准产能:</label>
				<input name="targetProduct" class="easyui-textbox" >
			</div>
			<div class="fitem">
				<label>目标产能:</label>
				<input name="standardProduct" class="easyui-textbox" >
			</div>
			<div class="fitem">
				<label>生产日期:</label>
				<input  class="easyui-datebox" name="productDate"  >
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveMain()" style="width:90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
	</div>
			
    <script type="text/javascript">  
    
    
		var url;
		var temp="";
		var temp2="";
	
		function editMain(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$('#dlg').dialog('open').dialog('setTitle','编辑');
				$('#fm').form('load',row); //加载两次成功解决问题,第一次重复验证的消息就不会显示了                         
				url = 'updateMain.do?id='+row.id;
			}else{
			   $.messager.show({
							title: '错误信息',msg: '请选择要编辑的信息'
						});
			}
		}
		function saveMain(){
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
		function destroyMain(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$.messager.confirm('Confirm','确定删除这条信息吗?',function(r){					
					if (r){
						$.post('deleteMain.do',{id:row.id},function(result){					    
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
		function searchMain(){
	
		    $("#dg").datagrid('load',{
		        pono:$("#pono").val(),
		        groupid:$("#groupid").val(),
		        model:$("#model").val(),
		        prodectType:$("#prodectType").val(),
		        progress:$('#progress').combobox('getValue'),
		        productDate:$("#productDate").combo('getValue')
		    });
		}
		function clearMain(){
		    $("#pono").val("");
		    $("#groupid").val("");
		    $("#model").val("");
		    $("#prodectType").val("");
		    $("#progress").combo('clear');
		    $("#productDate").combo('clear');
		}
		function reload(){
		   $('#dg').datagrid('reload');
		}
		

$(function(){
    $("input",$("#big1").next("span")).keyup(function(){
        this.value = this.value.toUpperCase();
    });
    
    
    var p = $('#dg').datagrid('getPager'); 
    $(p).pagination({ 
        beforePageText: '第',//页数文本框前显示的汉字 
        afterPageText: '页    共 {pages} 页', 
        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录', 
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
