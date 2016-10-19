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
			url="${ctx }/product/searchProduct.do" toolbar="#searchtool" pageSize="20"
			toolbar="#toolbar"  pagination="true" fit="true"  striped="true"
			rownumbers="true" fitColumns="true" singleSelect="true">			
		<thead>
			<tr>
			    <th field="materialCode" width="20" >物料编码</th>
			    <th field="model" width="20" >品名</th>
				<th field="productSpecific" width="20" >规格</th>				
				<th field="productType" width="20" >产品类型</th>				
				<th field="progressManHours" width="20"    formatter="formatProgress">工序</th>				
				
			</tr>
		</thead>
	    </table>
	 <div id="searchtool" style="padding:5px"> 
	    <table>
	       <tr>
	            <td>品名:</td><td><input type="text" id="model" class="easyui-textbox" size="12"/></td>
	            <td>规格:</td><td><input type="text" id="productSpecific" class="easyui-textbox" size="12"/></td>
	            <td>产品类型:</td>
	            <td>	<input id="productType" class="easyui-combobox" data-options="
					url:'getAllQCPT.do',
					method:'post',
					valueField:'productNo',
					textField:'productName'">
					</td>
	            <td><a href="javascript:searchDept()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
	            <td><a href="javascript:clearProduct()" class="easyui-linkbutton" data-options="iconCls:'icon-myclear'">清空</a> </td>
	       </tr>
	    </table>   
    <div> 
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addProduct()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editProduct()">编辑</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyProduct()">删除</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="reload()">刷新</a>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width:400px;height:300px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">产品信息</div>
		<form id="fm" method="post" novalidate>
			<div class="fitem">
				<label>物料编码:</label>
				<input name="materialCode" class="easyui-textbox" required="true" missingMessage="必填信息">
			</div>		
			<div class="fitem">
				<label>品名:</label>
				<input  name="model" class="easyui-textbox" required="true" id="big1"
				       validType="checkDuplicate" missingMessage="必填信息">
			</div>
			<div class="fitem">
				<label>规格:</label>
				<input name="productSpecific" class="easyui-textbox" required="true" missingMessage="必填信息">
			</div>
			<div class="fitem">
				<label>产品类型:</label>
				<input name="productType" class="easyui-combobox" data-options="
					url:'getAllQCPT.do',
					method:'post',
					valueField:'productNo',
					textField:'productName'">
			</div>
			
			
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveProduct()" style="width:90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
	</div>
			
    <script type="text/javascript">  
    
    
		var url;
		var temp="";
		function addProduct(){
			$('#dlg').dialog('open').dialog('setTitle','添加');
			$('#fm').form('clear');
			url = '${ctx }/product/addProduct.do';
		}
		function editProduct(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$('#dlg').dialog('open').dialog('setTitle','编辑');
				$('#fm').form('load',row);
				temp=row.model;       //防止编辑的时候判断code重复,上面这一波消耗了比较长的时间,导致获取temp的速度慢于验证的value导致编辑的时候第一次会报重复的错误
				$('#fm').form('load',row); //加载两次成功解决问题,第一次重复验证的消息就不会显示了                         
				url = '${ctx }/product/updateProduct.do?id='+row.id;
			}else{
			   $.messager.show({
							title: '错误信息',msg: '请选择要编辑的信息'
						});
			}
		}
		function saveProduct(){
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
		function destroyProduct(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$.messager.confirm('Confirm','确定删除这条信息吗?',function(r){					
					if (r){
						$.post('${ctx }/product/deleteProduct.do',{id:row.id},function(result){					    
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
		        model:$("#model").val(),
		        productType:$('#productType').combobox('getValue'),
		        productSpecific:$("#productSpecific").val(),
		        
		    });
		}function clearProduct(){
		     $("#model").val("");
		     $("#productType").val("");
		     $("#productSpecific").val("");
		}
		function reload(){
		   $('#dg').datagrid('reload');
		}
		
		//获取所有工序
		  function formatProgress(value){
		  	var data=new Array();
			if(value==null){
			return "";
			}else {
				for(var i=0;i<value.length ;i++){
	       			data[i]= value[i].progress.progressName;
	       		}
	       		return data;
			}
       		

    	}; 
    	/* function formatProgress(val,row){
    	    var result = new Array();
    	    $.each(row.progressManHours,function(n,value){
    	       result[n]=value.progress.progressName;
    	    });
			return result;
    	}; */
		
		//检测是否重复的方法
		//自定义证规格	
		$.extend($.fn.validatebox.defaults.rules,{checkDuplicate:{
		      validator:function(value, param){
		          var result;	          
		          $.ajax({
		                type:'post',
		                async:false, //ajax提交时锁死整个浏览器,
		                url:'${ctx }/product/checkProduct.do',
		                data:{"model":value},
                        dataType:"json",
		                success:function(data,type){	
		                	result=data;
		                	if(result=='true');	
		                   if(temp!=""&&temp==value){result=true;}	        
		                     
		                }	                
		          });
		          return result;
		      },
		      message:'品名已存在'
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
