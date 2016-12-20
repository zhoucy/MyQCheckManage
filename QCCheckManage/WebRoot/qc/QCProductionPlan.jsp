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
			url="searchQCPP.do" toolbar="#searchtool" showFooter="true" pageSize="20"
			toolbar="#toolbar"  pagination="true"  fit="true" striped="true"
			rownumbers="true" fitColumns="true" singleSelect="true" data-options="onLoadSuccess:nodata">			
		<thead>
			<tr>
				<th field="pono" width="50" sortable="true">生产单号</th>
				<th field="model" width="50" sortable="true">产品品名</th>
				<th field="productId" width="50" sortable="true">产品ID</th>
				<th field="productSpecific" width="50" sortable="true">产品规格</th>
				<th field="orderNumber" width="50" sortable="true">订单数量</th>
				<th field="finishNumber" width="50"  sortable="true">完成数量</th>
				<th field="preProductDate" width="50" sortable="true">计划生产日期</th>
				<th field="preShipmentDate" width="50" sortable="true">预计出货日期</th>
				<th field="packbarcode" width="50" sortable="true">彩盒条形码</th>
				<th field="boxbarcode" width="50" sortable="true">箱子条形码</th>
				<th field="boxcapacity" width="50" sortable="true">个/箱</th>
				<th field="productStatus" width="50" sortable="true" formatter="formatStatus">状态</th>
				<th field="lastUpUser" width="50" sortable="true">最后操作人</th>
			</tr>
		</thead>
	    </table>
	 <div id="searchtool"  style="padding:5px;">  
	    <table >	         
	         <tr>
	              <td>生产单号:</td><td><input type="text" id="pono" class="easyui-textbox" style="width:100px"/></td>
	              <td>计划生产日期:</td><td><input class="easyui-datebox" id="preProductDate"  style="width:104px"/></td>
	              <td>预计出货日期:</td><td><input class="easyui-datebox" id="preShipmentDate"  style="width:104px"/></td>
	              <td>彩盒条形码:</td><td><input type="text" id="packbarcode"  style="width:100px" class="easyui-numberbox" /></td>
	              <td>箱子条形码:</td><td><input type="text" id="boxbarcode"  style="width:100px" class="easyui-numberbox" /></td>
                  <td><a href="javascript:searchQCPP()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
	              <td><a href="javascript:clearQCPP()" class="easyui-linkbutton" data-options="iconCls:'icon-myclear'">清空</a></td>
	         </tr>	
	         <tr>	  
	              <td>生产状态:</td><td><select id="productStatus" style="width:105px">
                                          <option value="">全部</option>
			                              <option value="待产">待产</option>
			                              <option value="在产">在产</option>
			                              <option value="已完工">已完工<option>	
                                       </select></td>             	              
	              <td>订单数量:</td><td><input type="text" class="easyui-numberbox" id="orderNumber"  style="width:104px"/></td>
	              <td>完成数量:</td><td><input type="text" class="easyui-numberbox" id="finishNumber"  style="width:104px"/></td> 
	              <td>产品品名:</td><td><input type="text" id="model" style="width:100px" class="easyui-textbox" /></td>
	              <td>产品规格:</td><td><input type="text" id="productSpecific"  style="width:100px" class="easyui-textbox" /> </td>         
	         </tr>         
	    </table>         
    <div> 
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newQCPP()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editQCPP()">编辑</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="updateStatus()">更新订单状态</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyQCPP()">删除</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="reload()">刷新</a>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width:400px;height:400px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">生产计划信息</div>
		<form id="fm" method="post" novalidate>
			<div class="fitem">
				<label>生产单号:</label>
				<input name="pono" class="easyui-textbox" required="true"  id="big1"
				       validType="checkDuplicate" missingMessage="必填信息">
			</div>
			<div class="fitem">
				<label>产品品名:</label>
				<input  name="productId" class="easyui-combobox" required="true" missingMessage="必填信息" id="big2" data-options="
					url:'getAllModels.do',
					method:'get',
					valueField:'id',
					textField:'model',
					panelHeight:'auto'"> 
			</div>
			<div class="fitem">
				<label>产品规格:</label>
				<input name="productSpecific" class="easyui-textbox" readonly="readonly" id="big3"
				>
			</div>
			<div class="fitem">
				<label>订单数量:</label>
				<input name="orderNumber" class="easyui-numberbox" data-options="min:0,max:9999999" required="true" missingMessage="必填信息" id="big4">
			</div>
			<div class="fitem">
				<label>计划生产日期:</label>
				<input name="preProductDate" class="easyui-datebox" required="true" missingMessage="必填信息" >
			</div>
			<div class="fitem">
				<label>预计出货日期:</label>
				<input name="preShipmentDate" class="easyui-datebox" required="true" missingMessage="必填信息">
			</div>
			<div class="fitem">
				<label>彩盒条形码:</label>
				<input name="packbarcode" class="easyui-numberbox" >
			</div>
			<div class="fitem">
				<label>箱子条形码:</label>
				<input name="boxbarcode" class="easyui-numberbox" >
			</div>
			<div class="fitem">
				<label>个/箱:</label>
				<input name="boxcapacity" class="easyui-numberbox" >
			</div>
			<div class="fitem" hidden="true">
				<label>产品id隐藏起来:</label>
				<input id="hiddenmodel" name="model" class="easyui-textbox"  type="text">
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveQCPP()" style="width:90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
	</div>
			
    <script type="text/javascript">  
    
    
		var url;
		var temp="";
		function newQCPP(){
			
			$('#dlg').dialog('open').dialog('setTitle','添加');
			$('#fm').form('clear');
			url = 'addQCPP.do';
		}
		function editQCPP(){
			
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$('#dlg').dialog('open').dialog('setTitle','编辑');
				$('#fm').form('load',row);
				temp=row.pono;      //防止编辑的时候判断code重复,上面这一波消耗了比较长的时间,导致获取temp的速度慢于验证的value导致编辑的时候第一次会报重复的错误
				$('#fm').form('load',row); //加载两次成功解决问题,第一次重复验证的消息就不会显示了                         
				url = 'updateQCPP.do?id='+row.id;
			}else{
			   $.messager.show({
							title: '错误信息',msg: '请选择要编辑的信息'
						});
			}
		}
		function saveQCPP(){
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
		function destroyQCPP(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$.messager.confirm('Confirm','确定删除这条信息吗?',function(r){					
					if (r){
						$.post('deleteQCPP.do',{id:row.id},function(result){					    
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
		
		 var user='<%=session.getAttribute("name")%>';
		//更新订单为完成状态
		function updateStatus(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$.messager.confirm('Confirm','确定更新这个订单?',function(r){					
					if (r){
						$.post('updateStatus.do',{id:row.id,username:user},function(result){					    
							if (result==true){							    
								$('#dg').datagrid('reload');
								$.messager.show({	
									title: '成功信息',msg: '更新成功'
								});	
							} else {
							    $('#dg').datagrid('reload');
								$.messager.show({	
									title: '错误信息',msg: '更新失败'
								});
							}
						},'json');
					}
				});
			}else{
			    $.messager.show({
							title: '错误信息',msg: '请选择要更新的信息'
						});
			}
		}
		//条件查询
		function searchQCPP(){
		    $("#dg").datagrid('load',{
		        pono:$("#pono").val(),
		        model:$("#model").val(),
		        productSpecific:$("#productSpecific").val(),
		        orderNumber:$("#orderNumber").val(),
		        finishNumber:$("#finishNumber").val(),
		        preProductDate:$("#preProductDate").combo('getValue'),
		        preShipmentDate:$("#preShipmentDate").combo('getValue'),
		        productStatus:$("#productStatus").val(),
		        packbarcode:$("#packbarcode").val(),
		        boxbarcode:$("#boxbarcode").val(),
		        boxcapacity:$("#boxcapacity").val()
		    });
		}
		//清空查询条件,将查询组件赋值为空就行了
		function clearQCPP(){
		    console.log("测试清空");
		    $("#pono").textbox('clear');
		    $("#model").textbox('clear');
		    $("#productSpecific").textbox('clear');
		    $("#orderNumber").numberbox('clear');
		    $("#finishNumber").numberbox('clear');
		    $("#preProductDate").combo('clear'),
		    $("#preShipmentDate").combo('clear'),
		    $("#productStatus").val("");
		    $("#packbarcode").numberbox('clear');
		    $("#boxbarcode").numberbox('clear');
		    $("#boxcapacity").val("");
		}
		//刷新
		function reload(){
		   $('#dg').datagrid('reload');
		}
		//格式化,不同状态不同颜色
		function formatStatus(val,row){
		    if(val!=null & val=="待产"){
		          return '<span style="color:#2828FF;">'+val+'</span>';
		    }
		    if(val!=null & val=="在产"){
		          return '<span style="color:red;">'+val+'</span>';
		    }
		    if(val!=null & val=="已完工"){
		          return '<span style="color:green;">'+val+'</span>';
		    }		    
		}
		//没有记录时显示的内容
		function nodata(data){
		   /* 
		      这种方案没有通用性,放弃
		   if (data.total == 0){
		        $(this).datagrid('appendRow', { pono: '<div style="text-align:center;color:red">没有相关记录！</div>' })
		        .datagrid('mergeCells', { index: 0, field: 'pono', colspan: 11 }); 
		   } */
		   if (data.total == 0) {
               var body = $(this).data().datagrid.dc.body2;
               body.find('table tbody').append(
               '<div style="width:1333px;text-align:center;color:red">没有相关记录！</div>');
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
		                url:'checkQCPP.do',
		                data:{"pono":value},
                        dataType:"json",
		                success:function(data,type){                
		                   result=data;	
		                   if(temp!=""&&temp==value){result=true;}	                   
		                }	                
		          });
		          return result;
		      },
		      message:'重复的订单号,禁止使用'
		}});

	 
		
		//变大写
$(function(){

	//品名获取对应的规格型号
	
		
    $("input",$("#big1").next("span")).keyup(function(){
        this.value = this.value.toUpperCase(); 
        
    });
    $("input",$("#big2").next("span")).keyup(function(){
        this.value = this.value.toUpperCase(); 
    });
    $("input",$("#big4").next("span")).focus(function(){
   		
				
				var id=$('#big2').combobox('getValue');//从combobx取值
				var model=$('#big2').combobox('getText');//从combobx取值
				var url = "${ctx}/qc/getSpeById.do?id="+id;
				$("#hiddenmodel").textbox('setValue',model);//先假装没有,填0,有后面在改
				$.get(url,function(data){
				   
					if(data==''){
						
						alert("未找到相应规格型号，请检查订单号是否输入正确");
					} 
					$("#big3").textbox('setValue',data.productSpecific);//给规格赋值
				
					});
	 	    	
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
