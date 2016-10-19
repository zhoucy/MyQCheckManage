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
			url="searchEmployee.do" toolbar="#searchtool" showFooter="true" pageSize="20"
			toolbar="#toolbar"  pagination="true"  fit="true" striped="true"
			rownumbers="true" fitColumns="true" singleSelect="true" data-options="onLoadSuccess:nodata">			
		<thead>
			<tr>
				<th field="employeeno" width="50" >工号</th>
				<th field="employeename" width="50" >姓名</th>
				<th field="sex" width="50" >性别</th>
				<th field="birthday" width="50" >生日</th>
				<th field="address" width="50"  >住址</th>
				<th field="mobile" width="50">手机</th>
				<th field="positionname" width="50" >职位</th>
				<th field="positionstatus" width="50" >状态</th>
			</tr>
		</thead>
	    </table>
	 <div id="searchtool"  style="padding:5px;">  
	    <table >	         
	         <tr>
	              <td>工号:</td><td><input type="text" id="employeeno" size="12"/></td>
	              <td>姓名:</td><td><input type="text" id="employeename"  size="12"/></td>	              
	              <td>职位:</td><td><input type="text" id="positionname"  size="12"/></td>
	              <td>部门:</td><td><select id="deptid" class="easyui-combobox"  style="width:100px;" 
	                                        data-options="url:'${ctx}/qc/getAllDept.do',valueField:'id',textField:'name',panelHeight:'auto'"></select></td>
	              <td>是否在职:</td><td><input id="positionstatus" class="easyui-combobox" style="width:100px"
	                                    data-options="panelHeight:'auto',
		                                valueField: 'label',
		                                textField: 'value',
		                                data: [{label: '',value: '==请选择==',selected:'true'
		                                       },{label: '在职',value: '在职'
		                                       },{label: '离职',value: '离职'
		                                }]" /></td>  
                  <td><a href="javascript:searchEmployee()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></td>
	              <td><a href="javascript:clearEmployee()" class="easyui-linkbutton" data-options="iconCls:'icon-myclear'">清空</a></td>
	         </tr>	       
	    </table>         
    <div> 
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newEmployee()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editEmployee()">编辑</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyEmployee()">删除</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="reload()">刷新</a>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width:700px;height:400px;"
			closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post" novalidate>
	    <div id="tt" class="easyui-tabs" style="width:620px;height:280px" fit="true" plain="true" narrow="true" justified="true">
		<div title="基本信息">
		             <br>
		             <br>
			         <div class="fitem">
				     <label>工号:</label>
				     <input name="employeeno" class="easyui-textbox" validType="checkemployeeno" required="true" missingMessage="必填信息">
				     <label>姓名:</label>
				     <input name="employeename" class="easyui-textbox" required="true" missingMessage="必填信息">
			         </div>
			         <div class="fitem">
				     <label>性别:</label>
				     <input name="sex" class="easyui-combobox" required="true" missingMessage="必填信息"  data-options="
                           panelHeight:'auto',
		                   valueField: 'label',
		                   textField: 'value',
		                   data: [{label: '男',value: '男',selected:'true'
		                        },{label: '女',value: '女'
		                   }]" />
				     <label>生日:</label>
				     <input name="birthday" class="easyui-datebox" style="width:180px;" >
			         </div>
			         <div class="fitem">
				     <label>住址:</label>
				     <input name="address" class="easyui-textbox" >
				     <label>手机:</label>
				     <input name="mobile" class="easyui-textbox" required="true" missingMessage="必填信息">
			         </div>
			         <div class="fitem">
				     <label>职位:</label>
				     <input name="positionname" class="easyui-textbox" >
				     <label>状态:</label>
				     <input name="positionstatus" class="easyui-textbox" >
			         </div>	
		</div>
		<div title="职位信息" >
			         <br>
		             <br>
			         <div class="fitem">
				     <label>身份证号:</label>
				     <input name="identityno" class="easyui-validatebox"  
				            data-options="validType:'idcared'">
				     <label>入职日期:</label>
				     <input name="entrydate" class="easyui-datebox" style="width:180px;">
			         </div>
			         <div class="fitem">
				     <label>离职日期</label>
				     <input name="leavedate" class="easyui-datebox" style="width:180px;">
				     <label>离职原因:</label>
				     <input name="leavereason" class="easyui-textbox">
			         </div>
			         <div class="fitem">
				     <label>部门</label>
				     <select name="deptid" class="easyui-combobox" style="width:180px;"
				             data-options="url:'${ctx}/qc/getAllDept.do',valueField:'id',textField:'name',panelHeight:'auto'"></select>
				     <label></label>
				     <input  class="easyui-textbox" >
			         </div>
			         <div class="fitem">
				     <label></label>
				     <input  class="easyui-textbox" >
				     <label></label>
				     <input  class="easyui-textbox" >
			         </div>	
		</div>
		<div title="其他信息">
			         <br>
		             <br>
			         <div class="fitem">
				     <label>QQ:</label>
				     <input name="qq" class="easyui-textbox">
				     <label>Email:</label>
				     <input name="email" class="easyui-textbox">
			         </div>	
			         <div class="fitem">
				     <label>company:</label>
				     <input name="company" class="easyui-textbox">
				     <label>备注:</label>
				     <input name="others" class="easyui-textbox">
			         </div>	
			         <div class="fitem">
				     <label></label>
				     <input class="easyui-textbox" >
				     <label></label>
				     <input  class="easyui-textbox" >
			         </div>
			         <div class="fitem">
				     <label></label>
				     <input  class="easyui-textbox" >
				     <label></label>
				     <input  class="easyui-textbox" >
			         </div>			        
		</div>
	</div>
	    </form>
		


	
	</div>

	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveEmployee()" style="width:90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
	</div>
			
    <script type="text/javascript">  
    
    
		var url;
		var temp="";
		function newEmployee(){			
			$('#dlg').dialog('open').dialog('setTitle','添加');
			$('#fm').form('clear');
			$('#tt').tabs('select',0);//默认选中基本信息
			url = 'addEmployee.do';
		}
		function editEmployee(){			
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$('#dlg').dialog('open').dialog('setTitle','编辑');
				$('#fm').form('load',row);
				temp=row.employeeno;      
				$('#fm').form('load',row);
				$('#tt').tabs('select',0); //默认选中基本信息                       
				url = 'updateEmployee.do?id='+row.id;
			}else{
			   $.messager.show({
							title: '错误信息',msg: '请选择要编辑的信息'
						});
			}
		}
		function saveEmployee(){
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
		function destroyEmployee(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$.messager.confirm('警告','确定删除这条信息吗?',function(r){					
					if (r){
						$.post('deleteEmployee.do',{id:row.id},function(result){					    
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
		function searchEmployee(){
		    $("#dg").datagrid('load',{
                   employeeno:$("#employeeno").val(), 
                   employeename:$("#employeename").val(), 
                   positionname:$("#positionname").val(),
                   deptid:$("#deptid").combo('getValue'),
                   positionstatus:$("#positionstatus").combo('getValue')
		    });
		}
		//清空查询条件,将查询组件赋值为空就行了
		function clearEmployee(){
               $("#employeeno").val("");
               $("#employeename").val("");
               $("#positionname").val("");
               $("#deptid").combo('clear');
               $("#positionstatus").combobox('select','');
		}
		//刷新
		function reload(){
		   $('#dg').datagrid('reload');
		}
		//没有记录时显示的内容
		function nodata(data){
		   if (data.total == 0) {
               var body = $(this).data().datagrid.dc.body2;
               body.find('table tbody').append(
               '<div style="width:1333px;text-align:center;color:red">没有相关记录！</div>');
           }
		}
//身份证验证
var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",
35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",
54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"}; 	
function isCardID(sId){   
    var iSum=0 ;  
    var info="" ;  
    if(!/^\d{17}(\d|x)$/i.test(sId)) return "你输入的身份证长度或格式错误";   
    sId=sId.replace(/x$/i,"a");   
    if(aCity[parseInt(sId.substr(0,2))]==null) return "你的身份证地区非法";   
    sBirthday=sId.substr(6,4)+"-"+Number(sId.substr(10,2))+"-"+Number(sId.substr(12,2));   
    var d=new Date(sBirthday.replace(/-/g,"/")) ;  
    if(sBirthday!=(d.getFullYear()+"-"+ (d.getMonth()+1) + "-" + d.getDate()))return "身份证上的出生日期非法";   
    for(var i = 17;i>=0;i --) iSum += (Math.pow(2,i) % 11) * parseInt(sId.charAt(17 - i),11) ;  
    if(iSum%11!=1) return "你输入的身份证号非法";   
    return true;//aCity[parseInt(sId.substr(0,2))]+","+sBirthday+","+(sId.substr(16,1)%2?"男":"女")   
} 	
$.extend($.fn.validatebox.defaults.rules, {     
    idcared: {     
        validator: function(value,param){    
            var flag= isCardID(value);  
            return flag==true?true:false;    
        },     
        message: '不是有效的身份证号码'    
    },
    checkemployeeno:{
        validator:function(value, param){
		          var result;	          
		          $.ajax({
		                type:'post',
		                async:false, //ajax提交时锁死整个浏览器,
		                url:'${ctx}/qc/checkEmployee.do',
		                data:{"employeeno":value},
                        dataType:"json",
		                success:function(data,type){                
		                   result=data;	
		                   if(temp!=""&&temp==value){result=true;}	                   
		                }	                
		          });
		          return result;
		  },
		  message:'重复工号,禁止使用'
    }     
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
			width:180px;
		}
.panel-body {
  border:0;
}
	</style>
</body>
</html>
