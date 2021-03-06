<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <jsp:include page="../inc.jsp"/>

  </head>
<body>
<div id="tt" class="easyui-tabs" style="width:auto;height:auto;padding:20px 0 0 0" fit="true" tabPosition="left"
          plain="false" narrow="true" pill="false" justified="true" border="true">
		<div title="设置" style="">
			<table id="swipemachine" class="easyui-datagrid" style="width:auto;height:auto" fit="true"  toolbar="#toolbar"
                      data-options="url:'${ctx}/qc/getBindPono.do',fitColumns:true,singleSelect:true">
                            <thead><tr>
                                   <th field="mgid" width="100" align="center">卡机组别</th>
                                   <th field="mgroupid" width="100" align="center">生产组别id</th>
                                   <th field="mgroupname" width="100" align="center">组别名称</th>
                                   <th field="mpono" width="100" align="center">订单号</th>
                                   <th field="msequence" width="100" align="center">流程</th>
                                   <th field="mprintname" width="100" align="center">打印机</th>
                                   <th field="undefined" width="100" align="center" formatter="formatOper" >操作</th>
                            </tr></thead>
            </table>
            <div id="toolbar">
		    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newSMachine()">添加</a>
		    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editSMachine()">编辑</a>
		    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroySMachine()">删除</a>
		    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="reload()">刷新</a>
	        </div>
	        <div id="dlg" class="easyui-dialog" style="width:400px;height:300px;padding:10px 20px"
			              closed="true" buttons="#dlg-buttons">
		<div class="ftitle">卡机信息</div>
		    <form id="fm" method="post" novalidate>		
			<div class="fitem">
				<label>卡机组别:</label>
				<input id="mgid"  name="mgid" class="easyui-textbox" required="true" missingMessage="必填信息" validType="checkDuplicate">
			</div>
			<div class="fitem">
				<label>组别:</label>
				<input  name="mgroupid" class="easyui-combobox" required="true" missingMessage="必填信息" editable="false"
				                              data-options="valueField: 'id',    
                                                            textField: 'name',    
                                                            url: '${ctx}/qc/getAllDept.do',
                                                            panelHeight:'auto', 
                                                            onSelect:function(rec){
                                                                $('#mgroupname').textbox('setValue',rec.name);
                                                            }"/>
			</div>
			<div class="fitem" hidden="true">
				<label>组别名称:</label>
				<input id="mgroupname" name="mgroupname" class="easyui-textbox"/>
			</div>
			<div class="fitem">
				<label>订单号:</label>
				<input  name="mpono" class="easyui-textbox">
			</div>
			<div class="fitem">
				<label>流程:</label>
				<input  name="msequence" class="easyui-textbox" required="true" missingMessage="必填信息">
			</div>
			<div class="fitem">
				<label>打印机:</label>
				<input  name="mprintname" class="easyui-textbox" required="true" missingMessage="必填信息">
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveSMachine()" style="width:90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
	</div>
		</div>	
		<div title="重新打印">
			<table id="swipedata" class="easyui-datagrid"  rownumbers="true" style="width:auto;height:auto" fit="true" 
			                            fitColumns="true"  toolbar="#searchtool" pagination="true"  pageSize="20"
                                        data-options="fitColumns:true,singleSelect:true">
                                        <thead>
                                        <tr>
                                           <th field="pono" width="100" align="center">订单号</th>
                                           <th field="groupname" width="50" align="center">组别</th>
                                           <th field="position" width="50" align="center">工位</th>
                                           <th field="Info" width="100" align="center">卡号</th>
                                           <th field="serialnum" width="200" align="center">序列号</th>
                                           <th field="swipetime" width="150" align="center" formatter="formatStringTime">刷卡时间</th>
                                           <th field="dbtime" width="150" align="center" formatter="formatTime">录入时间</th>
                                           <th field="swipedate" width="80" align="center">日期</th> 
                                           <th field="isprint" width="80" align="center">打印结果</th> 
                                           <th field="dataid" width="100" align="center" formatter="formatOper1" >操作</th>                                 
                                        </tr></thead>
              </table>
              <div id="searchtool" style="padding:5px">  
	          <table><tr>
	            <td>生产订单:</td><td><input id="pono" name="pono" class="easyui-combobox"  style="width:120px;" 
                                              data-options="valueField: 'id',    
                                                            textField: 'pono',    
                                                            url: '${ctx}/qc/getPonoAndUnion.do',
                                                            panelHeight:'auto'"/></td>
	            <td>生产组别:</td><td><input id="groupid" name="groupid" class="easyui-combobox" style="width:120px;"
                                              data-options="valueField: 'mgroupid',    
                                                            textField: 'mgroupname',    
                                                            url: '${ctx}/qc/getBindPono.do',
                                                            panelHeight:'auto', 
                                                            onSelect: function(rec){    
                                                                selectprint=rec.mprintname
                                                            }
                                                            "/></td>
                <td>日期:</td><td><input class="easyui-datebox" id="swipedate" style="width:120px;"/></td>
	            <td>序列号:</td><td><input type="text" id="serialnum" size="20" onkeydown="enter(event);"/></td>
	            <td><a href="javascript:searchSData()" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchSData();">查询</a></td>
	            <td><a href="javascript:clearSData()" class="easyui-linkbutton" data-options="iconCls:'icon-myclear'" onclick="clearSData();">清空</a></td>
	         </tr></table> 
             <div> 
		</div>
	</div>

<script type="text/javascript">

	var url;
	var selectprint;
	var temp;
	function newSMachine() {
		$('#dlg').dialog('open').dialog('setTitle', '添加');
		$('#mgid').textbox('readonly', false);
		$('#fm').form('clear');
		temp="";
		url = '${ctx}/qc/addSMachine.do';
	}
	function editSMachine() {
		var row = $('#swipemachine').datagrid('getSelected');
		if (row) {
			$('#dlg').dialog('open').dialog('setTitle', '编辑');
			$('#fm').form('load', row);
			temp=row.mgid;
			$('#fm').form('load', row);
			$('#mgid').textbox('readonly', true);
			url = '${ctx}/qc/updateSMachine.do';
		} else {
			$.messager.show({
				title : '错误信息',
				msg : '请选择要编辑的信息'
			});
		}
	}
	function saveSMachine() {
		$('#fm').form('submit', {
			url : url,
			onSubmit : function() {
				return $(this).form('validate');
			},
			success : function(result) {
				$('#dlg').dialog('close');
				$('#swipemachine').datagrid('reload');
				if (result == 'true') {
					$.messager.show({
						title : '成功信息',
						msg : '操作成功'
					});
				} else {
					$.messager.show({
						title : '错误信息',
						msg : '操作时发生错误'
					});
				}
			}
		});
	}
	function destroySMachine() {
		var row = $('#swipemachine').datagrid('getSelected');
		console.log(row);
		if (row) {
			$.messager.confirm('Confirm', '确定删除这条信息吗?', function(r) {
				if (r) {
					$.post('${ctx}/qc/deleteSMachine.do', {
						mgid : row.mgid
					}, function(result) {
						if (result == true) {
							$('#swipemachine').datagrid('reload');
							$.messager.show({
								title : '成功信息',
								msg : '删除成功'
							});
						} else {
							$('#swipemachine').datagrid('reload');
							$.messager.show({
								title : '错误信息',
								msg : '删除失败'
							});
						}
					}, 'json');
				}
			});
		} else {
			$.messager.show({
				title : '错误信息',
				msg : '请选择要删除的信息'
			});
		}
	}
	function reload() {
		$('#swipemachine').datagrid('reload');
	}
	function formatOper(val, row, index) {
		return '<a href="javascript:void(0)" onclick="testprint(' +index+');" style="color:blue">打印测试</a>';
	}
	function formatOper1(val, row, index) {
		return '<a href="javascript:void(0)" onclick="reprint(' +index+');" style="color:blue">重新打印</a>';
	}
	function testprint(index) {
		//无法传递printname参数,可能是因为带了斜杠,所以采用如下方式
		var printname;
		var serialnum;
		$('#swipemachine').datagrid('selectRow', index); 
		var row = $('#swipemachine').datagrid('getSelected');
		printname = row.mprintname;			
		if (row) {
			var printurl = "${ctx}/qc/print.do";
			$.ajax({
				type : 'post',
				url : printurl,
				data : {
					printname : printname,
					serialnum:serialnum,
				},
				dataType : 'json',
				success : function(data) {
				    if(data=="true"){
				       alert("打印成功!如果未打印请检查是否缺纸");
				    }else{
				       alert("打印失败!请检查配置如:打印机名字是否正确");
				    }
				},
				error : function() {
					alert("打印请求失败了!可能是网络问题.");
				}
			});
		}
	}
	function reprint(index) {
		var printname;
		var serialnum;
		$('#swipedata').datagrid('selectRow', index); 
		var row = $('#swipedata').datagrid('getSelected');
		printname = selectprint;	
	    serialnum = row.serialnum;	
	    if(printname==null){
	        alert("请选择组别!");
	        return ;
	    }
		if (row) {
			var printurl = "${ctx}/qc/print.do";
			$.ajax({
				type : 'post',
				url : printurl,
				data : {
					printname : printname,
					cserialnum:serialnum,
				},
				dataType : 'json',
				success : function(data) {
				    if(data=="true"){
				       alert("打印成功!如果未打印请检查是否缺纸");
				    }else{
				       alert("打印失败!请检查配置如:打印机名字是否正确");
				    }
				},
				error : function() {
					alert("打印请求失败了!可能是网络问题.");
				}
			});
		}
	}
	function formatTime(value, row, index) {
		if (value != undefined) {
			value = parseInt(value);
			var time = new Date(value);
			var y = time.getFullYear();
			var m = time.getMonth() < 9? "0" + (time.getMonth()+1) : (time.getMonth()+1);
			var d = time.getDate() < 10 ? "0" + time.getDate() : time.getDate();
			var h = time.getHours() < 10 ? "0" + time.getHours() : time
					.getHours();
			var mm = time.getMinutes() < 10 ? "0" + time.getMinutes() : time
					.getMinutes();
			var ss = time.getSeconds() < 10 ? "0" + time.getSeconds() : time
					.getSeconds();
			var t = y + "-" + m + "-" + d + " " + h + ":" + mm + ":" + ss;
			return t;
		}
	}
	function formatStringTime(value, row, index) {
		if (value != undefined) {
			var y = value.substring(0, 4);
			var m = value.substring(4, 6);
			var d = value.substring(6, 8);
			var h = value.substring(8, 10);
			var mm = value.substring(10, 12);
			var ss = value.substring(12, 14);
			var t = y + "-" + m + "-" + d + " " + h + ":" + mm + ":" + ss;
			return t;
		}
	}
	function searchSData(){
	    $("#swipedata").datagrid({
             url:'${ctx}/qc/getSwipeDataByParams.do',
             queryParams: {
                    pono:$("#pono").combobox('getText'),
		            groupid: $("#groupid").combobox('getValue'),
		            serialnum:$("#serialnum").val(),
		            swipedate:$("#swipedate").datebox('getValue'),
	         }           
         }); 
	}
	function clearSData(){
	    $("#pono").combobox('clear');
	    $("#groupid").combobox('clear');
	    $("#serialnum").val('');
	    $("#swipedate").datebox('setValue', '');
	}
	//重复检查的方法
	$.extend($.fn.validatebox.defaults.rules,{checkDuplicate:{
		      validator:function(value, param){	 
		      var result;         
		          $.ajax({
		                type:'post',
		                async:false, //ajax提交时锁死整个浏览器,
		                url:'${ctx}/qc/checkMgid.do',
		                data:{"mgid":value},
                        dataType:"json",
		                success:function(data,type){   
		                   result=data; 
		                   if(temp!=""&&temp==value){result=true;}	                
		                }	                
		          });
		          return result;
		      },
		      message:'卡机组别不能重复'
		}});
		function enter(e){
		    if(e.keyCode==13){
		       searchSData();
		    }
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
